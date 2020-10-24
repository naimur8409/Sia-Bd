@extends('layouts.master')
@section('title','Visitor List')
@section('content')
<div class="container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card" style="border:1px solid #ea1b23">
                <div class="card-header" style="background-color: #ea1b23">
                    <h4 class="text-white">Visitor List</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="multi_col_order"
                            class="table table-striped table-bordered display no-wrap" style="width:100%">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Guardian</th>
                                    <th>University</th>
                                    <th>Subject</th>
                                    <th> Action </th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($visitors as $key=>$visitor)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$visitor->name}}</td>
                                    <td>{{$visitor->phone}}</td>
                                    <td>{{$visitor->guardian}}</td>
                                    <td>{{($visitor->university?$visitor->university->name:'')}}-{{($visitor->country?$visitor->country->name:'')}}</td>
                                    <td>{{$visitor->subject}}</td>
                                    <td><a class="btn btn-danger" style="background-color: #ea1b23" href="{{route('visitor.show',$visitor->id)}}">Details</a></td>
                                </tr> 
                                @empty
                                    <tr><th colspan="7">There is no data for this query</th></tr>
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