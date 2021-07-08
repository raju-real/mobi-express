@extends('admin.layouts.app')
@section('title','Edit Product - '.$product->name)

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="card card-info">
		<div class="card-header">
			<div class="card-title">
				{{ $product->name }}
				<a href="{{ route('admin.product.edit',$product->slug) }}">
					<i class="fa fa-edit"></i>
				</a>
			</div>
			<div class="card-title" style="float: right;">
				
			</div>
		</div>
		<div class="card-body">
			<div class="col-md-12">
				<table class="table table-bordered table-striped text-nowrap" width="100%">
					<tr>
						<th>Status</th>
						<th>{{ $product->status == 1 ? 'Active' : 'In Active' }}</th>
					</tr>
					<tr>
						<th>Stock Status</th>
						<th>{{ $product->stock_status == 1 ? 'Yes' : 'No' }}</th>
					</tr>
					<tr>
						<th>Quantity</th>
						<th>{{ $product->quantity }}</th>
					</tr>
					<tr>
						<th>Product Name</th>
						<th>{{ $product->name }}</th>
					</tr>
					<tr>
						<th>Category</th>
						<th>{{ $product->category->name }}</th>
					</tr>
					<tr>
						<th>Sub Category</th>
						<th>{{ $product->subcategory_id != null ? $product->subcategory->name : '' }}</th>
					</tr>
					<tr>
						<th>Brand</th>
						<th>{{ $product->brand_id != null ? $product->brand->name : '' }}</th>
					</tr>
					<tr>
						<th>Unit Price</th>
						<th>{{ $product->unit_price }}</th>
					</tr>
					<tr>
						<th>Discount Price</th>
						<th>{{ $product->discount_price }}</th>
					</tr>
					<tr>
						<th>Discount</th>
						<th>{{ $product->percentage }}</th>
					</tr>
					<tr>
						<th>Unit Weight</th>
						<th>{{ $product->unit_weight }}</th>
					</tr>
					<tr>
						<th>Details</th>
						<th>{!! $product->product_details !!}</th>
					</tr>
					<tr>
						<th>Specila Note</th>
						<th>{{ $product->special_note }}</th>
					</tr>
					<tr>
						<th>Video Link</th>
						<th>{{ $product->video_link }}</th>
					</tr>
					<tr>
						<th>Image</th>
						<th>
							<div class="row">
								@foreach($product->images as $image)
									<div class="col-md-3">
										<img src="{{ asset($image->image) }}" class="img-responsive" alt="Image" style="width: 100%;height: 150px;padding-bottom: 10px;">
									</div>
								@endforeach
							</div>
						</th>
					</tr>
			    </table>
			</div>
		</div>
	</div>
</div>
</div>
@endsection

@push('js')

@endpush