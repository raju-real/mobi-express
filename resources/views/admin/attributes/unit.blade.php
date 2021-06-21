@extends('admin.layouts.app')
@section('title','Unit')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Unit</div>
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-unit">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-unit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add Unit
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.unit.store') }}" method="POST" role="form" onsubmit="return validate()">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="unit">
						        			Unit Name
						        		</label>
						        		<input type="text" name="name" class="form-control" id="unit" placeholder="Unit Name">
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
                <table class="table table-bordered table-striped text-nowrap text-sm text-center ">
                    <thead >
                        <tr>
                            <th class="text-center">Sl.no</th>
                            <th class="text-center">Unit Name</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($units as $unit)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $unit->name }}</td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-unit{{ $unit->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-unit{{ $unit->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit Unit
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								       <form action="{{ route('admin.unit.update',$unit->id) }}" method="POST" role="form">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body">
									        	<div class="form-group text-left">
									        		<label for="unit">
									        			Unit Name
									        		</label>
									        		<input type="text" name="name" class="form-control" value="{{ $unit->name }}">
									        	</div>
									      	</div>
										    <div class="modal-footer">
										      	<button type="submit" class="btn btn-primary pointer">Update</button>
										        <button type="button" class="btn btn-danger pointer" data-dismiss="modal">Close</button>
										    </div>
								      </form>
								    </div>
								  </div>
								</div>

								{{-- Delete Activity --}}
								<button class="btn btn-danger pointer" type="button" onclick="deleteItem(event,{{ $unit->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-unit-{{ $unit->id }}" action="{{ route('admin.unit.destroy',$unit->id) }}" method="POST" style="display: none;">
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
		let unit = $('#unit').val();
		if(!unit.length){
			$('#unit').after('<span class="val-error">Unit Name Required</span>');
			return false;
		} else{
			return true;
		}
	}

	function deleteItem(event,id){
		Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		  	event.preventDefault();
		  	$('#delete-unit-'+id).submit();
		    
		  } else{
		  		Swal.fire(
                  'Cancelled',
                  'Your data is safe :)',
                  'error'
              	)
		  }
		})
	}

	
</script>
@endpush