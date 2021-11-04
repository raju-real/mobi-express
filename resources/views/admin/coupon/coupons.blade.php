@extends('admin.layouts.app')
@section('title','Coupons')
@push('css')
@endpush

@section('content')
<div class="row">
    <div class="col-xl-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">All Coupons</div>
                <div class="ibox-title text-right">
                	<a href="{{ route('admin.coupon.create') }}" class="btn btn-primary pointer">
                		<i class="fa fa-plus"></i>
                	</a>
                	{{-- Modal Add --}}
                	{{-- <button type="button" class="btn btn-primary pointer" data-toggle="modal" data-target="#add-coupon">
					  <i class="fa fa-plus"></i>
					</button> --}}

					<!-- Modal -->
					<div class="modal fade" id="add-coupon" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">
					        	Add coupon
					        </h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <form action="{{ route('admin.coupon.store') }}" method="POST" role="form">
						      	@csrf
						        <div class="modal-body">
						        	<div class="form-group text-left">
						        		<label for="coupon_code">
						        			Coupon Code
						        		</label>
						        		<input type="text" name="coupon_code" class="form-control" id="coupon_code" placeholder="Coupon Code" value="{{ old('coupon_code') }}">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="valid_for">
						        			Valid For
						        		</label>
						        		<select name="valid_for" id="valid_for" class="form-control">
						        			<option value="{{ old('valid_for') ?? '' }}" selected>
						        				{{ old('valid_for') == 1 ? 'All User' : old('valid_for') == 2 ? 'New User' : 'Valid For' }}
						        			</option>
						        			<option value="1">All User</option>
						        			<option value="2">New User</option>
						        		</select>
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="discount_type">
						        			Discount Type
						        		</label>
						        		<select name="discount_type" id="discount_type" class="form-control">
						        			<option value="{{ old('discount_type') ?? '' }}" selected>
						        				{{ old('discount_type') == 1 ? 'Amount' : old('discount_type') == 2 ? 'Percentage' : 'Discount Type' }}
						        			</option>
						        			<option value="1">Amount</option>
						        			<option value="2">Percentage</option>
						        		</select>
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="discount">
						        			Discount
						        		</label>
						        		<input type="text" name="discount" class="form-control" id="discount" placeholder="Discount" value="{{ old('discount') }}">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="used_limit">
						        			Used Limit
						        		</label>
						        		<input type="number" name="used_limit" class="form-control" id="used_limit" value="{{ old('used_limit') ? old('used_limit') : 1 }}">
						        	</div>
						        	<div class="form-group text-left">
						        		<label for="minimum_cost">
						        			Minimum Cost
						        		</label>
						        		<input type="number" name="minimum_cost" class="form-control" id="minimum_cost" value="{{ old('minimum_cost') ? old('minimum_cost') : '' }}">
						        	</div>
						        	<div class="form-group text-left" id="date_1">
			                            <label class="font-normal">
			                            	Start Date
			                            </label>
			                            <div class="input-group date">
			                                <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
			                                <input name="start_date" class="form-control" type="text" autocomplete="off" value="{{ old('start_date') }}">
			                            </div>
			                        </div>
						        	<div class="form-group text-left" id="date_1">
			                            <label class="font-normal">End Date</label>
			                            <div class="input-group date">
			                                <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
			                                <input name="end_date" class="form-control" type="text" autocomplete="off" value="{{ old('end_date') }}">
			                            </div>
			                        </div>

						        	<div class="form-group text-left">
						        		<label for="coupon">
						        			Status
						        		</label>
						        		<select name="status" class="form-control">
						        			<option value="{{ old('status') ?? '' }}" selected>
						        				{{ old('status') == 1 ? 'Active' : old('status') == 2 ? 'In Active' : 'Status' }}
						        			</option>
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
                <table class="table table-bordered table-striped text-nowrap text-sm text-left table-responsive">
                    <thead >
                        <tr>
                            <th class="text-left">Sl.no</th>
                            <th class="text-left">Code</th>
                            <th class="text-left">Valid For</th>
                            <th class="text-left">Discount</th>
                            <th class="text-left">Limit</th>
                            <th class="text-left">Min Cost</th>
                            <th class="text-left">Date</th>
                            <th class="text-left">Status</th>
                            <th class="text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	@foreach($coupons as $coupon)
                        <tr>
                            <td>{{ $loop->index + 1 }}</td>
                            <td>{{ $coupon->coupon_code }}</td>
                            <td>
                            	@if($coupon->valid_for == 1)
                            		{{ 'All User' }}
                            	@elseif($coupon->valid_for == 2)
                            		{{ 'New User' }}
                            	@elseif($coupon->valid_for == 3)	
                            		{{ $coupon->group->name ?? '' }}
                            	@else
                            		{{ 'Invalid' }}
                            	@endif
                            </td>
                            <td>
                            	{{ $coupon->discount }}
                            	@if($coupon->discount_type == 1)
                            		{{ 'BDT' }}
                            	@elseif($coupon->discount_type == 2)
                            		{{ '%' }}
                            	@else
                            		{{ 'Invalid' }}
                            	@endif
                            </td>
                            <td>{{ $coupon->used_limit }}</td>
                            <td>{{ $coupon->minimum_cost }}</td>
                            <td>
                            	{{ date('d-m-y', strtotime($coupon->start_date)) }} -
                            	{{ date('d-m-y', strtotime($coupon->end_date)) }}
                            </td>
                            <td>
                            	{{ $coupon->status == 1 ? 'Active' : 'In Active' }}
                            </td>
                            <td>
                            	{{-- Delete Activity --}}
                            	<button type="button" class="btn btn-info pointer" data-toggle="modal" data-target="#edit-coupon{{ $coupon->id }}">
								  <i class="fa fa-edit"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="edit-coupon{{ $coupon->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">
								        	Edit coupon
								        </h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>

								      <form action="{{ route('admin.coupon.update',$coupon->id) }}" method="POST" role="form">
								      	@csrf
								      	@method('PUT')
								        <div class="modal-body">
								        	<div class="form-group text-left">
								        		<label for="coupon_code">
								        			Coupon Code
								        		</label>
								        		<input type="text" name="coupon_code" class="form-control" id="coupon_code" value="{{ $coupon->coupon_code }}">
								        	</div>
								        	<div class="form-group text-left">
								        		<label for="valid_for">
								        			Valid For
								        		</label>
								        		<select name="valid_for" id="valid_for" class="form-control">
								        			<option value="{{ $coupon->valid_for }}">
								        				{{ $coupon->valid_for == 1 ? 'All User' : $coupon->valid_for == 2 ? 'New User' : 'Valid For' }}
								        			</option>
								        			<option value="1">All User</option>
								        			<option value="2">New User</option>

								        		</select>
								        	</div>
								        	<div class="form-group text-left">
								        		<label for="discount_type">
								        			Discount Type
								        		</label>
								        		<select name="discount_type" id="discount_type" class="form-control">
					                    			<option value="{{ $coupon->discount_type }}">
					                                    {{ $coupon->discount_type == 1 ? 'Amount':'Percentage' }}
					                                </option>
					                                @if($coupon->discount_type == 1)
					                                    <option value="2">Percentage</option>
					                                @elseif($coupon->discount_type == 2)
					                                    <option value="1">Amount</option>
					                                @endif
					                    		</select>
								        	</div>
								        	<div class="form-group text-left">
								        		<label for="discount">
								        			Discount
								        		</label>
								        		<input type="text" name="discount" class="form-control" id="discount" value="{{ $coupon->discount }}">
								        	</div>
								        	<div class="form-group text-left">
								        		<label for="used_limit">
								        			Used Limit
								        		</label>
								        		<input type="number" name="used_limit" class="form-control" id="used_limit" value="{{ $coupon->used_limit }}">
								        	</div>
								        	<div class="form-group text-left">
								        		<label for="minimum_cost">
								        			Minimum Cost
								        		</label>
								        		<input type="number" name="minimum_cost" class="form-control" id="minimum_cost" value="{{ $coupon->minimum_cost }}">
								        	</div>
								        	<div class="form-group text-left" id="date_1">
					                            <label class="font-normal">
					                            	Start Date
					                            </label>
					                            <div class="input-group date">
					                                <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
					                                <input name="start_date" class="form-control" type="text" autocomplete="off" value="{{ $coupon->start_date }}">
					                            </div>
					                        </div>
								        	<div class="form-group text-left" id="date_1">
					                            <label class="font-normal">End Date</label>
					                            <div class="input-group date">
					                                <span class="input-group-addon bg-white"><i class="fa fa-calendar"></i></span>
					                                <input name="end_date" class="form-control" type="text" autocomplete="off" value="{{ $coupon->end_date }}">
					                            </div>
					                        </div>

								        	<div class="form-group text-left">
								        		<label for="coupon">
								        			Status
								        		</label>
								        		<select name="status" id="status" class="form-control">
					                    			<option value="{{ $coupon->status }}">
					                                    {{ $coupon->status == 1 ? 'Active':'In Active' }}</option>
					                                @if($coupon->status == 1)
					                                    <option value="0">In Active</option>
					                                @elseif($coupon->status == 0)
					                                    <option value="1">Active</option>
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
								<button class="btn btn-danger pointer" type="button" onclick="deletecoupon({{ $coupon->id }})">
			                        <i class="fa fa-trash"></i>
			                    </button>
			                    <form id="delete-coupon-{{ $coupon->id }}" action="{{ route('admin.coupon.destroy',$coupon->id) }}" method="POST" style="display: none;">
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

	function deletecoupon(id) {
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
              document.getElementById('delete-coupon-'+id).submit();
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
