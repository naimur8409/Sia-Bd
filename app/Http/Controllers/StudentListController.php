<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\StudentList;
use App\User;
use App\Role;
use App\Country;
use App\University;
use App\Subject;
use App\DegreeType;
use App\Document;
use App\Program;
use Auth;
use Session;

class StudentListController extends Controller
{
    public function studentListCreate(Request $request){
        $program_id=Request('program_id');
        //dd($program_id);
        $countries=Country::all();
        $universities=University::all();
        $subjects=Subject::all();
        $degrees=DegreeType::all();
        $programmes=[];

        if(Request('search')){
            $programmes=Program::where([['country_id',$request->country],['university_id',$request->university],['subject_id',$request->subject]])->get();
        }

        return view('student.create',compact('program_id','countries','universities','subjects','degrees','programmes'));
    }
    public function studentListShow($id){
        $student=StudentList::find($id);
        return view('student.details',compact('student'));
    }

    public function userList(){
        $users=User::where('role_id','!=',2)->get();
        if(Request('role')){
            $users=User::where('role_id','=',Request('role'))->get();
        }
        $roles=Role::where('id','!=','2')->get();
        return view('users.index-user',compact('users','roles'));
    }

    public function registerUser(Request $request){
        $this->validate($request, [
            'name'=>'required|string',
            'phone'=>'required|string|min:11|unique:users',
            'email'=>'required|string|email|unique:users',
            'password'=>'required|string|min:8|confirmed',
            'role'=>'required',
        ]);

        $user = new User();
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->email = $request->email;
        $user->role_id = $request->role;
        $user->password = Hash::make($request->password);
        $user->save();
        Session::flash('message', 'User sucessfully Added!'); 
        Session::flash('type', 'success');
        return redirect()->back();
    }

    public function studentListStatus(){
        $status=Request('status');
        //dd($program_id);
        $where=[['status',$status]];
        if(Auth::user()->role_id==3){
            $where=[['status',$status],['counselor_id',Auth::user()->id]];
        }
        //dd($where);
        $student_lists=StudentList::where($where)->get();
        return view('student.status_list',compact('student_lists'));
    }

    public function studentAssignToCounselor(){
        $student_lists=StudentList::where('counselor_id',null)->get();
        $counselors=User::where('role_id','=',3)->get();;
        return view('student.assign_list',compact('student_lists','counselors'));
    }

    public function studentAssignToCounselorStore(Request $request){
        //dd($request->student_id);
       $students=$request->student_id;
       $counselor_id=$request->counselor;
       if($students){
        foreach($students as $student){
                $student_list=StudentList::find($student);
                $student_list->counselor_id=$counselor_id;
                $student_list->update();
            }
            Session::flash('message', 'Student sucessfully asigned to Counselor!'); 
            Session::flash('type', 'success'); 
        }else{
            Session::flash('message', 'Student or Counselor Not selected'); 
            Session::flash('type', 'danger'); 
        }
        return redirect()->back();
    }

    public function studentListStatusChange(){
        $status=Request('status');
        $student_id=Request('student_id');
        //dd($program_id);
        $student_list=StudentList::find($student_id);
        $student_list->status=$status;
        $student_list->update();
        Session::flash('message', 'Status Changed Successfully!'); 
        Session::flash('type', 'success'); 
        return 'test';
    }

    public function studentListStore(Request $request){
        //dd($request->ssc_image);
        // return $request->all();
        $ssc=$request->ssc;
        $hsc=$request->hsc;
        $hons=$request->hons;
        $masters=$request->masters;
        $others=$request->others;
        $documents=[];
        $student_list_data=$request->except(['name','email','phone','ssc','hsc','hons','masters','others','ssc_image','hsc_image','hons_image','masters_image','others_image','additional_skill_image']);
        //$user_id=2;
        if(Auth::user()->role->name=='student'){
            $user_id=Auth::user()->id;
        }else{
            $user=new User;
            $user->name=$request->name;
            $user->email=$request->email;
            $user->phone=$request->phone;
            $user->role_id=2; //student
            $user->password=Hash::make('password');
            $user->save();
            $user_id=$user->id;
        }

        $student_applied=StudentList::where([['user_id',$user_id],['program_id',$request->program_id]])->get();
        //dd(count($student_applied));
        if(count($student_applied)){
            Session::flash('message', 'You Have Already Applied For This Program!'); 
            Session::flash('type', 'warning'); 
            return redirect()->back();
        }

       
        
        $student_list_data['student_code']=time();
        $student_list_data['ssc']=json_encode($ssc);
        $student_list_data['hsc']=json_encode($hsc);
        $student_list_data['hons']=json_encode($hons);
        $student_list_data['masters']=json_encode($masters);
        $student_list_data['others']=json_encode($others);
        $student_list_data['user_id']=$user_id;
        $student_list_data['created_by']=Auth::user()->id;
       // dd($student_list_data);
        $studentCreated=StudentList::create($student_list_data);

        //upload fie
        if ($request->hasFile('ssc_image')) {
            $file = $request->file('ssc_image');
            $filename = 'ssc-'.$user_id.'-'.time() . '.' . $request->file('ssc_image')->extension();
            $filePath = 'files/documents/';
            $file->move($filePath, $filename);
            $documents['ssc_image']=$filePath.$filename;
        }
        if ($request->hasFile('hsc_image')) {
            $file = $request->file('hsc_image');
            $filename = 'hsc-'.$user_id.'-'.time() . '.' . $request->file('hsc_image')->extension();
            $filePath = 'files/documents/';
            $file->move($filePath, $filename);
            $documents['hsc_image']=$filePath.$filename;
        }
        if ($request->hasFile('hons_image')) {
            $file = $request->file('hons_image');
            $filename = 'hons-'.$user_id.'-'.time() . '.' . $request->file('hons_image')->extension();
            $filePath = 'files/documents/';
            $file->move($filePath, $filename);
            $documents['hons_image']=$filePath.$filename;
        }
        if ($request->hasFile('masters_image')) {
            $file = $request->file('masters_image');
            $filename = 'masters-'.$user_id.'-'.time() . '.' . $request->file('masters_image')->extension();
            $filePath = 'files/documents/';
            $file->move($filePath, $filename);
            $documents['masters_image']=$filePath.$filename;
        }
        if ($request->hasFile('others_image')) {
            $file = $request->file('others_image');
            $filename = 'others-'.$user_id.'-'.time() . '.' . $request->file('others_image')->extension();
            $filePath = 'files/documents/';
            $file->move($filePath, $filename);
            $documents['others_image']=$filePath.$filename;
        }
        if ($request->hasFile('additional_skill_image')) {
            $file = $request->file('additional_skill_image');
            $filename = 'additional_skill_image-'.$user_id.'-'.time() . '.' . $request->file('additional_skill_image')->extension();
            $filePath = 'files/documents/';
            $file->move($filePath, $filename);
            $documents['additional_skill_image']=$filePath.$filename;
        }
        foreach($documents as $key=>$document){
            $document_data=new Document;
            $document_data->student_id=$studentCreated->id;
            $document_data->required_by=1;
            $document_data->uploaded_by=Auth::user()->id;
            $document_data->document_title=$key;
            $document_data->file_location=$document;
            $document_data->save();
        }

        Session::flash('message', 'Application Successfully Submitted!'); 
        Session::flash('type', 'success'); 
        return redirect()->back();
    }
}
