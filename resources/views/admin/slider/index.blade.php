@extends('admin.layouts.app')
@section('title','Slider')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Slider</div>
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-slider">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-slider" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add slider
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.slider.store') }}" method="POST" role="form" enctype="multipart/form-data">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="title">
						        			Title
						        		</label>
						        		<input type="text" name="title" class="form-control" id="title" placeholder="Slider Title">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="slider">
						        			Slider Image
						        		</label>
						        		<input type="file" name="image" class="form-control" id="image">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="slider">
						        			Status
						        		</label>
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
                <table class="table table-bordered table-striped text-nowrap text-sm text-center ">
                    <thead >
                        <tr>
                            <th class="text-center">Sl.no</th>
                            <th class="text-center">Image</th>
                            <th class="text-center">Name</th>
                            {{-- <th class="text-center">Product</th> --}}
                            <th class="text-center">Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($sliders as $slider)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>
                            	<img src="{{ asset($slider->image) }}" class="img-responsive" style="height: 80px;width:100px;">
                            </td>
                            <td>{{ $slider->title }}</td>
                            {{-- <td>
                            	{{ $slider->products->count() }}
                            	<a class="badge badge-info" href="{{ route('admin.slider-products',$slider->id) }}">
                            		Products
                            	</a>
                            	0
                            </td> --}}
                            <td>
                            	{{ $slider->status == 1 ? 'Active' : 'In Active' }}
                            </td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-slider{{ $slider->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-slider{{ $slider->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit slider
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								       <form action="{{ route('admin.slider.update',$slider->id) }}" method="POST" role="form" enctype="multipart/form-data">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body">
									        	<div class="form-group text-left">
									        		<label for="slider">
									        			Slider Title
									        		</label>
									        		<input type="text" name="title" class="form-control" value="{{ $slider->title }}">
									        	</div>
									        	<div class="form-group text-left">
						        		<label for="slider">
						        			Slider Image
						        		</label>
						        		<input type="file" name="image" class="form-control">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="slider">
						        			Status
						        		</label>
						        		<select name="status" class="form-control">
						        			<option value="{{ $slider->status }}">
						        				{{ $slider->status == 1 ? 'Active' : 'In Active' }}
						        			</option>
						        			@if($slider->status == 0)
						        			<option value="1">Active</option>
						        			@elseif($slider->status == 1)
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
								<button class="btn btn-danger pointer" type="button" onclick="deleteslider({{ $slider->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-slider-{{ $slider->id }}" action="{{ route('admin.slider.destroy',$slider->id) }}" method="POST" style="display: none;">
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
	
	function deleteslider(id) {
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
              document.getElementById('delete-slider-'+id).submit();
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