@extends('admin.layouts.app')
@section('title','Add Promotion Product')

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="ibox">
			<div class="ibox-head">
				<div class="ibox-title">
					Add Product To - {{ $promotion->name }}
				</div>
			</div>
			<div class="ibox-body">
				@if(isset($product))
					<form action="{{ route('admin.promotion-product.update') }}" 
						method="POST">
						@csrf
						@method('PUT')
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
