@extends('admin.layouts.app')
@section('title',$promotion->name)

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="ibox">
			<div class="ibox-head">
				<div class="ibox-title">
					{{ $promotion->name }}
				</div>
			</div>
			<div class="ibox-body">
				@if(isset($product))
					<form action="{{ route('admin.promotion-product.update',$promotionProduct->id) }}" 
						method="POST">
						@csrf
						@method('PUT')
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">
									<label>Product</label>
									<select name="product_id" class="form-control product">
										<option value="{{ $product->id ?? '' }}">
											{{ $product->name ?? '' }} --
											{{ $product->unit_price }}
										</option>
										@foreach($products as $product)
											<option value="{{ $product->id }}">
												{{ $product->name }} -- 
												{{ $product->unit_price }}
											</option>
										@endforeach
									</select>
								</div>
							</div>
							
							<div class="col-md-2">
								<label>Discount</label>
								<input type="text" name="discount" class="form-control" value="{{ $promotionProduct->discount_price }}">
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label>Status</label>
									<select name="status" id="status" class="form-control">
	                    			<option value="{{ $promotionProduct->status }}">
	                                    {{ $promotionProduct->status == 1 ? 'Active':'In Active' }}</option>
	                                @if($promotionProduct->status == 1)    
	                                    <option value="0">In Active</option>
	                                @elseif($promotionProduct->status == 0)
	                                    <option value="1">Active</option>
	                                @endif
	                    		</select>
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-lg btn-primary pointer">Update</button>
					</form>
				@else 
					<form action="{{ route('admin.promotion-product.store') }}" method="POST">
						@csrf
						<div class="row">
							<div class="col-md-8">
								<input type="hidden" name="promotion_id" value="{{ $promotion->id }}">
								<div class="form-group">
									<label>Product</label>
									<select name="product_id" class="form-control product">
										<option>Select Product</option>
										@foreach($products as $product)
											<option value="{{ $product->id }}">
												{{ $product->name }} -- 
												{{ $product->unit_price }}
											</option>
										@endforeach
									</select>
								</div>
							</div>
							
							<div class="col-md-2">
								<label>Discount</label>
								<input type="text" name="discount" class="form-control">
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label>Status</label>
									<select name="status" class="form-control">
										<option value="1">Active</option>
										<option value="0">In Active</option>
									</select>
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-lg btn-primary pointer">Add</button>
					</form>
				@endif		
			</div>
		</div>
	</div>
</div>
@endsection

@push('js')
<script>
	$('.product').select2();
</script>
@endpush
