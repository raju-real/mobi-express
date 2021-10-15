@extends('admin.layouts.app')
@section('title','Sub Category')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Sub Category</div>
                @if(Session::has('message'))
	                <div class="alert alert-danger" role="alert">
	                	<strong>{{ Session::get('message') }}</strong>
	                </div>
                @endif
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-subcategory">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-subcategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add Sub Category
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.subcategory.store') }}" method="POST" role="form" onsubmit="return validate()" enctype="multipart/form-data">
						      	@csrf
						        <div class="modal-body text-left">
						        	<div class="form-group">
						        		<label for="category_id">
						        			Category
						        		</label>
						        		<select name="category_id" id="category_id" class="form-control">
						        			<option value="">Select Category</option>
						        		@foreach($categories as $category)
						        		<option value="{{ $category->id }}">
						        			{{ $category->name }}
						        		</option>
						        		@endforeach
						        		</select>
						        	</div>
						        	<div class="form-group">
						        		<label for="subcategory">
						        			Sub Category Name
						        		</label>
						        		<input type="text" name="name" class="form-control" id="subcategory" placeholder="Sub Category Name">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="image">
						        			Sub Category Image
						        		</label>
						        		<input type="file" name="image" class="form-control" id="image">
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
                <table class="table table-bordered table-striped text-nowrap text-sm text-left ">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Category</th>
                            <th class="text-left">Image</th>
                            <th class="text-left">Product Count</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($subcategories as $subcategory)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $subcategory->name }}</td>
                            <td>{{ $subcategory->category->name }}</td>
                            <td>
                            	@if($subcategory->image != null)
                            	<img src="{{ asset($subcategory->image) }}" class="img-fluid img-thumbnail" alt="Category image" style="height: 100px;width: 100px;">
                            	@else 
                            	{{ 'None' }}
                            	@endif
                            </td>
                            <td>{{ $subcategory->products->count() }}</td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-subcategory{{ $subcategory->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-subcategory{{ $subcategory->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit Sub Category
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								       <form action="{{ route('admin.subcategory.update',$subcategory->id) }}" method="POST" role="form" enctype="multipart/form-data">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body text-left">
									        	<div class="form-group">
								        		<label for="category_id">
								        			Category
								        		</label>
								        		<select name="category_id" id="category_id" class="form-control">
								        			<option value="{{ $subcategory->category_id }}">{{ $subcategory->category->name }}</option>
								        		@foreach($categories as $category)
								        		<option value="{{ $category->id }}">
								        			{{ $category->name }}
								        		</option>
								        		@endforeach
								        		</select>
								        	</div>
									        	<div class="form-group">
									        		<label for="subcategory">
									        			Sub Category Name
									        		</label>
									        		<input type="text" name="name" class="form-control" value="{{ $subcategory->name }}">
									        	</div>
									        	<div class="form-group text-left">
									        		<label for="image">
									        			Sub Category Image
									        		</label>
									        		<input type="file" name="image" class="form-control">
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
								<button class="btn btn-danger pointer" type="button" onclick="deleteItem({{ $subcategory->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-subcategory-{{ $subcategory->id }}" action="{{ route('admin.subcategory.destroy',$subcategory->id) }}" method="POST" style="display: none;">
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
		let subcategory = $('#subcategory').val();
		let category_id = $('#category_id').val();
		if(!category_id.length){
			$('#category_id').after('<span class="val-error">Category Required</span>');
			return false;
		}else if(!subcategory.length){
			$('#subcategory').after('<span class="val-error">Sub Category Name Required</span>');
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
              document.getElementById('delete-subcategory-'+id).submit();
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