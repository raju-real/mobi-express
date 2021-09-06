@extends('admin.layouts.app')
@section('title','Category')
{{-- @section('page-title','Category') --}}

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Category</div>
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-category">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add Category
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.category.store') }}" method="POST" role="form" onsubmit="return validate()" enctype="multipart/form-data">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="category">
						        			Category Name
						        		</label>
						        		<input type="text" name="name" class="form-control" id="category" placeholder="Category Name">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="image">
						        			Category Image
						        		</label>
						        		<input type="file" name="image" class="form-control" id="image">
						        	</div>
						        	<div class="form-group text-left">
						        		<label>Serial</label>
										<select name="serial" class="form-control">
											@for($i=1;$i<=20;$i++)
						        			<option value="{{ $i }}">{{ $i }}</option>
						        			@endfor
						        		</select>
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
                            <th class="text-center">Category Name</th>
                            <th class="text-center">Category Image</th>
                            <th class="text-center">Serial</th>
                            <th class="text-center">Product Count</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($categories as $category)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $category->name }}</td>
                            <td>
                            	@if($category->image != null)
                            		<img src="{{ asset($category->image) }}" class="img-fluid img-thumbnail" alt="Category image" style="height: 100px;width: 100px;">
                            	@else
                            		{{ 'None' }}
                            	@endif		
                            </td>
                            <td>{{ $category->serial }}</td>
                            <td>{{ $category->products->count() }}</td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-category{{ $category->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-category{{ $category->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit Category
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								       <form action="{{ route('admin.category.update',$category->id) }}" method="POST" role="form" enctype="multipart/form-data">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body">
									        	<div class="form-group text-left">
									        		<label for="category">
									        			Category Name
									        		</label>
									        		<input type="text" name="name" class="form-control" value="{{ $category->name }}">
									        	</div>
									        	<div class="form-group text-left">
									        		<label for="image">
									        			Category Image
									        		</label>
									        		<input type="file" name="image" class="form-control">
									        	</div>
									        	<div class="form-group text-left">
													<label>Serial</label>
													<select name="serial" class="form-control">
														<option value="{{ $category->serial }}">{{ $category->serial }}</option>
														@for($i=1;$i<=20;$i++)
									        			<option value="{{ $i }}">{{ $i }}</option>
									        			@endfor
									        		</select>
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
								<button class="btn btn-danger pointer" type="button" onclick="deleteItem(event,{{ $category->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-category-{{ $category->id }}" action="{{ route('admin.category.destroy',$category->id) }}" method="POST" style="display: none;">
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
		let category = $('#category').val();
		if(!category.length){
			$('#category').after('<span class="val-error">Category Name Required</span>');
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
		  	$('#delete-category-'+id).submit();
		    // Swal.fire(
		    //   'Deleted!',
		    //   'Your file has been deleted.',
		    //   'success'
		    // )
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