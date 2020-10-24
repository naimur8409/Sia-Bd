@extends('layouts.master')
@section('title','Student List')
@section('content')
<div class="container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card" style="border:1px solid #ea1b23">
                <div class="card-header" style="background-color: #ea1b23">
                    <h4 class="text-white">Student List</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="multi_col_order"
                            class="table table-striped table-bordered display no-wrap" style="width:100%">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>University</th>
                                    <th>Subject</th>
                                    <th>Counselor</th>
                                    <th>Status</th>
                                    <th colspan="2"> Action </th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($student_lists as $key=>$student_list)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$student_list->code}}</td>
                                    <td>{{$student_list->detail->name}}</td>
                                    <td>{{$student_list->detail->phone}}</td>
                                    <td>{{$student_list->program->university->name}} - {{$student_list->program->country->name}}</td>
                                    <td>{{$student_list->program->subject->name}}</td>
                                    <td>{{$student_list->counselor ? $student_list->counselor->name : 'Yet Not Assign'}}</td>
                                    <td>{{strtoupper(str_replace('_',' ',$student_list->status))}}</td>
                                    <td>
                                        <div class="form-group">
                                        <select name="status" class="custom-select mr-sm-2" id="change_status{{$student_list->id}}" onchange="changeStatus({{$student_list->id}})">
                                                <option value="0">Change Status</option>
                                                <option value="new_leads" class="text-warning">New Applied</option>
                                                <option value="scheduled" class="text-info">Scheduled</option>
                                                <option value="not_interested" class="text-danger">Not Interested</option>
                                                <option value="interested" class="text-success">Interested</option>
                                                <option value="not_answered" class="text-dark">Not Answered</option>
                                            </select>
                                        </div>
                                    </td>
                            
                                    <td><a class="btn btn-danger" style="background-color: #ea1b23" href="{{route('studentlist.show',$student_list->id)}}">Details</a></td>
                                </tr> 
                                @empty
                                    <tr><th colspan="9">There is no data for this query</th></tr>
                                @endforelse
                                
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 
@section('script')

<script>
function changeStatus(student_id){
    var status=$('#change_status'+student_id).val();
    if(status==0){
        alert('Select One of Options');
    }else{
        $.ajax({
            type: "GET",
            url: "{{route('default.change_status')}}",
            data: { status:status, student_id:student_id }, 
            success: function( msg ) {
                console.log( msg );
                if(msg){
                    location.reload();
                }
            }
        });
    }
}
</script>
 
@stop