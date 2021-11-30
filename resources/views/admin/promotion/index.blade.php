@extends('admin.layouts.app')
@section('title','Promotion')

@push('css')

@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Promotion</div>
                <div class="ibox-title text-right">
                	<button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-promotion">
					  <i class="fa fa-plus"></i>
					</button>

					<!-- Modal -->
					<div class="modal fade" id="add-promotion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add Promotion
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.promotion.store') }}" method="POST" role="form" enctype="multipart/form-data">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="promotion">
						        			Promotion Name
						        		</label>
						        		<input type="text" name="name" class="form-control" id="promotion" placeholder="Promotion Name">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="promotion">
						        			Promotion Image
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
						        	<div class="form-group text-left">
						        		<label for="promotion">
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
                <table class="table table-bordered table-striped text-nowrap text-sm text-left ">
                    <thead >
                        <tr>
                            <th class="text-left">Serial</th>
                            <th class="text-left">Image</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Product</th>
                            <th class="text-left">Status</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($promotions as $promotion)
                        <tr>
                            <td>{{ $promotion->serial }}</td>
                            <td>
                            	<img src="{{ asset($promotion->image) }}" class="img-responsive" style="height: 80px;width:100px;">
                            </td>
                            <td>{{ $promotion->name }}</td>
                            <td>
                            	{{-- {{ $promotion->products->count() }} --}}
                            	{{ App\Model\PromotionProduct::whereIn('promotion_id',[$promotion->id])->count() }}
                            	<a class="badge badge-info" href="{{ route('admin.promotion-products',$promotion->slug) }}">
                            		Products
                            	</a>
                            </td>
                            <td>
                            	{{ $promotion->status == 1 ? 'Active' : 'In Active' }}
                            </td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-promotion{{ $promotion->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-promotion{{ $promotion->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit Promotion
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								       <form action="{{ route('admin.promotion.update',$promotion->id) }}" method="POST" role="form" enctype="multipart/form-data">
									      	@csrf
									      	@method('PUT')
									        <div class="modal-body">
									        	<div class="form-group text-left">
									        		<label for="promotion">
									        			promotion Name
									        		</label>
									        		<input type="text" name="name" class="form-control" value="{{ $promotion->name }}">
									        	</div>
									        	<div class="form-group text-left">
						        		<label for="promotion">
						        			Promotion Image
						        		</label>
						        		<input type="file" name="image" class="form-control">
						        	</div>
						        	<div class="form-group text-left">
						        		<label>Serial</label>
										<select name="serial" class="form-control">
											<option value="{{ $promotion->serial }}">{{ $promotion->serial }}</option>
											@for($i=1;$i<=20;$i++)
						        			<option value="{{ $i }}">{{ $i }}</option>
						        			@endfor
						        		</select>
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="promotion">
						        			Status
						        		</label>
						        		<select name="status" class="form-control">
						        			<option value="{{ $promotion->status }}">
						        				{{ $promotion->status == 1 ? 'Active' : 'In Active' }}
						        			</option>
						        			@if($promotion->status == 0)
						        			<option value="1">Active</option>
						        			@elseif($promotion->status == 1)
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
								<button class="btn btn-danger pointer" type="button" onclick="deletePromotion({{ $promotion->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-promotion-{{ $promotion->id }}" action="{{ route('admin.promotion.destroy',$promotion->id) }}" method="POST" style="display: none;">
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
	
	function deletePromotion(id) {
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
              document.getElementById('delete-promotion-'+id).submit();
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