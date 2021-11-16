@extends('admin.layouts.app')
@section('title','User Details - '.$user->name)

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="card card-info">
		<div class="card-header">
			<div class="card-title">
				{{ 'User Details' }}
			</div>
		</div>
		<div class="card-body">
			<div class="col-md-12">
				<table class="table table-bordered table-striped" width="100%">
					<tr>
						<th>Action</th>
						<th>
							@if($user->status == 1)
								<a href="{{ route('admin.change-user-status',['id'=>$user->id,'status'=>0]) }}" class="badge badge-danger">
									<i class="fa fa-ban" aria-hidden="true"></i>
									Block
								</a>
							@elseif($user->status == 0)
								<a href="{{ route('admin.change-user-status',['id'=>$user->id,'status'=>1]) }}" class="badge badge-success">
									<i class="fa fa-check-circle" aria-hidden="true"></i>
									Un Block
								</a>
							@endif		
						</th>
					</tr>
					<tr>
						<th>Status</th>
						<th>{{ $user->status == 1 ? 'Active' : 'Blocked' }}</th>
					</tr>
					<tr>
						<th>Profile</th>
						<th>
							@if($user->image != null)
                                <img src="{{ asset($user->image) }}" class="img-responsive" alt="Responsive image" style="height: 100px;width:100px;border-radius: 10px;">
                              @else
                                <img src="{{ asset('assets/common/images/avator.png') }}" class="img-responsive" alt="Responsive image" style="height: 100px;width:100px;">
                              @endif  
						</th>
					</tr>
					<tr>
						<th>Name</th>
						<th>{{ $user->name ?? 'None' }}</th>
					</tr>
					<tr>
						<th>Mobile</th>
						<th>{{ $user->mobile ?? 'None' }}</th>
					</tr>
					<tr>
						<th>Email</th>
						<th>{{ $user->email ?? 'None' }}</th>
					</tr>
					
			    </table>
			</div>
		</div>
	</div>
</div>
</div>
@endsection

@push('js')

@endpush