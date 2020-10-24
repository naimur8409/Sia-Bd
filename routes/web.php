<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@dashboard')->name('dashboard');
Route::post('/visitor_store', 'VisitorController@visitorStore')->name('visitor.store');
Route::get('/visitor_create', 'VisitorController@visitorCreate')->name('visitor.create');

Auth::routes();

Route::group(['middleware'=>'CheckPermission'],function(){
Route::get('/visitor_list', 'VisitorController@visitorIndex')->name('visitor.list');
Route::get('/visitor_show/{id}', 'VisitorController@visitorShow')->name('visitor.show');
Route::get('User/roles-view','RoleController@index')->name('user.role.index');
Route::get('User/roles-add','RoleController@create')->name('user.role.create');
Route::post('User/roles-store','RoleController@store')->name('user.role.store');
Route::get('User/roles-edit/{id}','RoleController@edit')->name('user.role.edit');
Route::post('User/roles-update/{id}','RoleController@update')->name('user.role.update');
Route::post('User/roles-destroy','RoleController@destroy')->name('user.role.destroy');

Route::get('User/list-view','StudentListController@userList')->name('user.list.index');
Route::post('User/list-view','StudentListController@registerUser')->name('user.register');


Route::get('/home', 'HomeController@index')->name('home');
Route::post('/eligibility_check', 'ProgramController@eligibilityCheck')->name('eligibility_check');
Route::get('/offers', 'ProgramController@offers')->name('offers');
Route::get('/student_list_create', 'StudentListController@studentListCreate')->name('studentlist.create');
Route::get('/student_details/{id}', 'StudentListController@studentListShow')->name('studentlist.show');
Route::post('/student_list_store', 'StudentListController@studentListStore')->name('studentlist.store');
Route::get('/create-cost-type','CostTypeController@index')->name('cost_type.create');
Route::post('/store-cost-type','CostTypeController@store')->name('cost_type.store');
Route::post('/apply','CostTypeController@store')->name('apply');

Route::get('/student_assign_to_counselor', 'StudentListController@studentAssignToCounselor')->name('student.assign.create');
Route::post('/student_assign_to_counselor_store', 'StudentListController@studentAssignToCounselorStore')->name('student.assign.store');
Route::get('/student_list_new', 'StudentListController@studentListStatus')->name('student.new.list');
Route::get('/student_list_scheduled', 'StudentListController@studentListStatus')->name('student.scheduled.list');
Route::get('/student_list_not_interested', 'StudentListController@studentListStatus')->name('student.not_interested.list');
Route::get('/student_list_not_answered', 'StudentListController@studentListStatus')->name('student.not_answered.list');
Route::get('/student_list_interested', 'StudentListController@studentListStatus')->name('student.interested.list');
Route::get('/change_student_status', 'StudentListController@studentListStatusChange')->name('default.change_status');


// Route::get('/Settings/country', 'ProgramController@countryList')->name('country_list');
Route::get('/Settings/university', 'ProgramController@universityList')->name('university_list');
Route::get('/Settings/degree_type', 'ProgramController@typeList')->name('degree_type_list');
Route::post('/Settings/degree_type_update/{id}', 'ProgramController@degreeTypeUpdate')->name('degree_type_update');
Route::get('/Settings/subject', 'ProgramController@subjectList')->name('subject_list');

Route::get('/Accounts/account_head', 'CostTypeController@index')->name('account.head.index');
Route::post('/Accounts/account_head', 'CostTypeController@store')->name('account.head.store');
Route::get('/Accounts/account_head_edit/{id}', 'CostTypeController@edit')->name('account.head.edit');
Route::post('/Accounts/account_head_update/{id}', 'CostTypeController@update')->name('account.head.update');
Route::post('/Accounts/account_head_delete/{id}', 'CostTypeController@delete')->name('account.head.delete');

Route::get('/Settings/country', 'CountryController@index')->name('setting.country.index');
Route::post('/Settings/country', 'CountryController@store')->name('setting.country.store');
Route::get('/Settings/country_edit/{id}', 'CountryController@edit')->name('setting.country.edit');
Route::post('/Settings/country_update/{id}', 'CountryController@update')->name('setting.country.update');
Route::post('/Settings/country_delete/{id}', 'CountryController@delete')->name('setting.country.delete');

Route::get('/Settings/university', 'UniversityController@index')->name('setting.university.index');
Route::post('/Settings/university', 'UniversityController@store')->name('setting.university.store');
Route::get('/Settings/university_edit/{id}', 'UniversityController@edit')->name('setting.university.edit');
Route::post('/Settings/university_update/{id}', 'UniversityController@update')->name('setting.university.update');
Route::post('/Settings/university_delete/{id}', 'UniversityController@delete')->name('setting.university.delete');

Route::get('/Settings/subject', 'SubjectController@index')->name('setting.subject.index'); 
Route::post('/Settings/subject', 'SubjectController@store')->name('setting.subject.store');
Route::get('/Settings/subject_edit/{id}', 'SubjectController@edit')->name('setting.subject.edit');
Route::post('/Settings/subject_update/{id}', 'SubjectController@update')->name('setting.subject.update');
Route::post('/Settings/subject_delete/{id}', 'SubjectController@delete')->name('setting.subject.delete');

Route::get('/Settings/defaultUploadTitle', 'DefaultUploadTitleController@index')->name('setting.defaultUploadTitle.index');
Route::post('/Settings/defaultUploadTitle', 'DefaultUploadTitleController@store')->name('setting.defaultUploadTitle.store');
Route::get('/Settings/defaultUploadTitle_edit/{id}', 'DefaultUploadTitleController@edit')->name('setting.defaultUploadTitle.edit');
Route::post('/Settings/defaultUploadTitle_update/{id}', 'DefaultUploadTitleController@update')->name('setting.defaultUploadTitle.update');
Route::post('/Settings/defaultUploadTitle_delete/{id}', 'DefaultUploadTitleController@delete')->name('setting.defaultUploadTitle.delete');

Route::get('/Settings/program', 'ProgramController@index')->name('setting.program.index');
Route::post('/Settings/program', 'ProgramController@store')->name('setting.program.store');
Route::get('/Settings/program_edit/{id}', 'ProgramController@edit')->name('setting.program.edit');
Route::post('/Settings/program_update/{id}', 'ProgramController@update')->name('setting.program.update');
Route::post('/Settings/program_delete/{id}', 'ProgramController@delete')->name('setting.program.delete');


Route::get('get_university', 'ProgramController@getUniversity')->name('default.get_university');
Route::get('get_subject', 'ProgramController@getSubject')->name('default.get_subject');
Route::get('get_program', 'ProgramController@getProgram')->name('default.get_program');
});