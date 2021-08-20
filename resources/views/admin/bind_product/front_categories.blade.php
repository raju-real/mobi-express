@extends('admin.layouts.app')
@section('title','Front Category')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Front Category</div>
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
					       <form action="{{ route('admin.front-category.store') }}" method="POST" role="form" onsubmit="return validate()" enctype="multipart/form-data">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="category_id">
						        			Select Category
						        		</label>
						        		<select name="category_id" id="category_id" class="form-control">
						        			<option value="">Select Category</option>
						        			@foreach($allCategories as $category)
						        				<option value="{{ $category->id }}">
						        					{{ $category->name }}
						        				</option>
						        			@endforeach	
						        		</select>
						        	</div>
						        	<div class="form-group text-left">
										<label>Status</label>
										<select name="status" class="form-control">
											<option value="1">Active</option>
											<option value="0">In Active</option>
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
                <table class="table table-bordered table-striped text-nowrap text-sm text-left ">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Image</th>
                            <th class="text-left">Products</th>
                            <th class="text-left">Status</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($frontCategories as $f_category)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $f_category->category->name }}</td>
                            <td>
                            	@if($f_category->category->image != null)
                            		<img src="{{ asset($f_category->category->image) }}" class="img-fluid img-thumbnail" alt="Category image" style="height: 80px;width: 100px;">
                            	@else
                            		{{ 'None' }}
                            	@endif		
                            </td>
                            <td>
                            	<span class="badge badge-info">
                            		{{ App\Model\FrontCategoryProduct::where('front_category_id',$f_category->id)->count() }}
                            	</span>
                            	<a href="{{ route('admin.front-category-products',['front-category'=>$f_category->category_slug]) }}" class="badge badge-primary">
                            		<i class="fa fa-plus-circle"></i>
                            	</a>
                            </td>
                            <td>
                            	@if($f_category->status == 1)
                            		{{ 'Active' }}
                            	@else
                            		{{ 'In Active' }}	
                            	@endif	
                            </td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-category{{ $f_category->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-category{{ $f_category->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
								       <form action="{{ route('admin.front-category.update',$f_category->id) }}" method="POST" role="form" enctype="multipart/form-data">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body">
									        	<div class="form-group text-left">
								        		<label for="category_id">
								        			Select Category
								        		</label>
								        		<select name="category_id" id="category_id" class="form-control">
								        			<option value="{{ $f_category->category_id }}">
								        				{{ $f_category->category->name }}
								        			</option>
								        			@foreach($allCategories as $category)
								        				<option value="{{ $category->id }}">
								        					{{ $category->name }}
								        				</option>
								        			@endforeach	
								        		</select>
								        	</div>
								        	<div class="form-group text-left">
												<label>Status</label>
												<select name="status" class="form-control">
							        			<option value="{{ $f_category->status }}">
							        				{{ $f_category->status == 1 ? 'Active' : 'In Active' }}
							        			</option>
							        			@if($f_category->status == 0)
							        			<option value="1">Active</option>
							        			@elseif($f_category->status == 1)
							        			<option value="0">In Active</option
							        			>
							        			@endif
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
								<button class="btn btn-danger pointer" type="button" onclick="deleteFrontCategory({{ $f_category->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-front-category-{{ $f_category->id }}" action="{{ route('admin.front-category.destroy',$f_category->id) }}" method="POST" style="display: none;">
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
	function deleteFrontCategory(id) {
        Swal({
          title: 'Are you sure?',
          text: "It will be remove from database",
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
              document.getElementById('delete-front-category-'+id).submit();
          } else if (
              // Read more about handling dismissals
          result.dismiss === swal.DismissReason.cancel
          ) {
              Swal(
                  'Cancelled',
                  'Your data is safe :)',
                  'error'
              )
          }
      })  
    }

	
</script>
@endpush