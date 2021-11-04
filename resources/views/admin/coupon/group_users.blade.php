@extends('admin.layouts.app')
@section('title','Coupon Group User')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Group User of {{ $group->name }}</div>
                @if(Session::has('message'))
	                <div class="alert alert-danger" role="alert">
	                	<strong>{{ Session::get('message') }}</strong>
	                </div>
                @endif
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-group">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-group" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add User
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.add-group-user') }}" method="POST" role="form">
						      	@csrf
						      	<input type="hidden" name="coupon_group_id" value="{{ $group->id }}">
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="group">
						        			User Mobile
						        		</label>
						        		<input type="text" name="mobile" class="form-control" id="group" placeholder="User Mobile">
						        	</div>
						      	</div>
							    <div class="modal-footer">
							      	<button type="submit" class="btn btn-primary pointer">Add</button>
							        <button type="button" class="btn btn-danger pointer" data-dismiss="modal">Close</button>
							    </div>
					      </form>
					    </div>
					  </div>
					</div>
                </div>
            </div>
            <div class="ibox-body">
                <table class="table table-bordered table-striped text-nowrap text-sm table-sm text-left ">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Image</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Mobile</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($members as $member)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                            	@if($member->user->image != null)
                                <img src="{{ asset($member->user->image) }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @else
                                <img src="{{ asset('assets/common/images/avator.png') }}" class="img-responsive img-circle" alt="Responsive image" style="height: 50px;width:50px;">
                              @endif
                            </td>
                            <td>{{ $member->user->name }}</td>
                            <td>{{ $member->user->mobile ?? '' }}</td>
                            <td>
								{{-- Delete Activity --}}
								<button class="btn btn-danger pointer" type="button" onclick="deleteItem({{ $group->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-group-{{ $group->id }}" action="{{ route('admin.coupon-group.destroy',$group->id) }}" method="POST" style="display: none;">
			                        @csrf
			                        @method('DELETE')
			                    </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script>
	function validate(){
		let group = $('#group').val();
		if(!group.length){
			$('#group').after('<span class="val-error">group Name Required</span>');
			return false;
		} else{
			return true;
		}
	}

	function deleteItem(id) {
      swal({
          title: 'Are you sure?',
          text: "You won't be able to revert this!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, delete it!',
          cancelButtonText: 'No, cancel!',
          confirmButtonClass: 'btn btn-success',
          cancelButtonClass: 'btn btn-danger',
          buttonsStyling: false,
          reverseButtons: true
      }).then((result) => {
          if (result.value) {
              event.preventDefault();
              document.getElementById('delete-group-'+id).submit();
          } else if (
              // Read more about handling dismissals
          result.dismiss === swal.DismissReason.cancel
          ) {
              swal(
                  'Cancelled',
                  'Your data is safe :)',
                  'error'
              )
          }
      })
    }

	
</script>
@endpush