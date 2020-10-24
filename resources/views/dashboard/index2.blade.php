@extends('layouts.new_master')
@section('title',strtoupper(auth()->user()->role->name)." ".'DASHBOARD')
@section('content')
<body>

	{{-- <header class="d-flex justify-content-center animated slideInDown">
		<a href="{{route('dashboard')}}">
		<img src="{{asset('new_template')}}/img/logo.jpg" alt="">
		</a>
	</header>

	<div class="container mt-2">
		<div class="d-flex justify-content-center">
			<div class="dashboard-heading text-center --fs-40 --fw-b">
				WELCOME TO SIA <br> <span class="--sia-red --fs-56 dashboard-heading-admin">ADMIN DASHBOARD</span>
			</div>
		</div>
	</div> --}}

	<div class="container mt-2">
		<div class="navigation-outer">

			<ul class="navigation-top list-unstyled align-items-center mb-0">
				
				<li class="navigation-link">
					<a href="{{route('home')}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/eligibilitycheck.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">ELIGIBILITY CHECK</p>
				</li>
				
				<li class="navigation-link">
					<a href="{{route('studentlist.create')}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/applications.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">APPLICATION</p>
				</li>
				{{-- ============Demo Menu/ Delete it====== --}}
				@if(Auth::user()->role_id==2)
				<li class="navigation-link">
					<a href="#">
						<img class="img-fluid" src="{{asset('new_template')}}/img/applications.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">Demo</p>
				</li>

				<li class="navigation-link">
					<a href="#">
						<img class="img-fluid" src="{{asset('new_template')}}/img/applications.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">demo</p>
				</li>
				@endif

				@if(Auth::user()->role_id==1)
				<li class="navigation-link">
					<a href="{{route('offers')}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">OVERVIEW</p>
				</li>
				
				<li class="navigation-link">
					<a href="{{route('user.list.index',['role'=>4])}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/partner.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">PARTNERS</p>
				</li>
									
				<li class="navigation-link">
					
					<div class="dropdown">
						<a onclick="myFunction()" class="dropbtn">
							<img class="img-fluid" src="{{asset('new_template')}}/img/account.png" alt="">
						</a>
						{{-- <div id="myDropdown" class="dropdown-content">
							<div class="p-3">
								<ul class="p-0 list-unstyled d-flex flex-wrap">
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/eligibilitycheck.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/applications.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/partner.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/account.png" alt="">
										</a>
									</li>
									<li><a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/activity.png" alt="">
										</a>
									</li>
									<li><a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/sale.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/report.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/counselor.png" alt="">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/cpanel.png" alt="">
										</a>
									</li>
								</ul>
							</div>
						</div> --}}
					</div>
					<p class="--fs-24 --fw-b">ACCOUNT</p>
				</li>
			</ul>
			<ul class="navigation-bottom list-unstyled align-items-center mb-0">
				<li class="navigation-link">
					<a href="{{route('student.assign.create')}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/activity.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">ACTIVITY</p>
				</li>
				<li class="navigation-link">
					<a href="{{route('visitor.list')}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/sale.png" alt="">
					</a>
					{{-- <a href="javascript:void(0);">
						<img class="img-fluid" src="{{asset('new_template')}}/img/sale.png" alt="">
					</a> --}}
					<p class="--fs-24 --fw-b">Visitors</p>
				</li>
				
				<li class="navigation-link">
				
					<div class="dropdown">
						<a onclick="myFunction()" class="dropbtn">
							<img class="img-fluid" src="{{asset('new_template')}}/img/report.png" alt="">
						</a>
						<div id="myDropdown" class="dropdown-content">
							<div class="p-3" >
								<ul class="p-0 list-unstyled d-flex flex-wrap">
									{{-- <li>
										<a href="javascript:void(0);">
											<img class="img-fluid" src="{{asset('new_template')}}/img/eligibilitycheck.png" alt="">
										</a>
										<p class="--fs-10">REPORTS</p>
									</li> --}}
									<li class="ml-5 mr-5">
										<a href="{{route('student.new.list',['status'=>'new_leads'])}}">
											<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
										</a>
										<p class="--fs-10">NEW LEADS</p>
									</li>
									<li class="ml-5">
										<a href="{{route('student.new.list',['status'=>'scheduled'])}}">
											<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
										</a>
										<p class="--fs-10">SCHEDULED</p>
									</li>
									<li class="ml-5 mr-5">
										<a href="{{route('student.new.list',['status'=>'not_interested'])}}">
											<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
										</a>
										<p class="--fs-10">NOT INTERESTED</p>
									</li>
									<li class="ml-5">
										<a href="{{route('student.new.list',['status'=>'not_answered'])}}">
											<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
										</a>
										<p class="--fs-10">NOT ANSWERED</p>
									</li>
									{{-- <li>
										<a href="{{route('visitor.list')}}">
											<img class="img-fluid" src="{{asset('new_template')}}/img/overview.png" alt="">
										</a>
										<p class="--fs-10">VISITORS</p>
									</li> --}}
								</ul>
							</div>
						</div>
					</div>
					<p class="--fs-24 --fw-b">REPORTS</p>
				</li>
				<li class="navigation-link">
					<a href="{{route('user.list.index',['role'=>3])}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/counselor.png" alt="">
					</a>
					<p class="--fs-24 --fw-b">COUNSELOR</p>
				</li>
				<li class="navigation-link">
					

                                   
					<a href="{{route('user.role.index')}}">
						<img class="img-fluid" src="{{asset('new_template')}}/img/cpanel.png" alt="">
					</a>
					<p class="--fs-24 --fw-b"> {{ 'C-PANEL' }}</p>
				</li>
				
				@endif
			</ul>
		</div>
	</div>

	
@endsection
