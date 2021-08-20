@extends('admin.layouts.app')
@section('title','Front Category Products')

@push('css')

@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="ibox">
			<div class="ibox-head">
				<div class="ibox-title">
					Add/Edit Product On {{ $category->name }}
				</div>
			</div>
			<div class="ibox-body">
			@if(isset($fornt_category_product))
			<form action="{{ route('admin.update-product-front-cat',$fornt_category_product->id) }}" method="POST">
				@csrf
				@method('PUT')
				<div class="form-group">
					<label>Product</label>
					<select name="product_id" class="form-control product">
						<option value="{{ $fornt_category_product->product_id }}">
							{{ $fornt_category_product->product->name }}
						</option>
						@foreach($products as $product)
							<option value="{{ $product->id }}">
								{{ $product->name }}
							</option>
						@endforeach
					</select>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label>Serial</label>
						<select name="serial" class="form-control">
							<option value="{{ $fornt_category_product->serial }}">{{ $fornt_category_product->serial }}</option>
							@for($i=1;$i<=20;$i++)
		        			<option value="{{ $i }}">{{ $i }}</option>
		        			@endfor
		        		</select>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Status</label>
							<select name="status" class="form-control">
			        			<option value="{{ $fornt_category_product->status }}">
			        				{{ $fornt_category_product->status == 1 ? 'Active' : 'In Active' }}
			        			</option>
			        			@if($fornt_category_product->status == 0)
			        			<option value="1">Active</option>
			        			@elseif($fornt_category_product->status == 1)
			        			<option value="0">In Active</option
			        			>
			        			@endif
			        		</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label> </label>
							<button type="submit" class="btn pointer btn-primary btn-block">Update</button>
						</div>
					</div>
				</div>
			</form>
			@else
			<form action="{{ route('admin.add-product-front-cat') }}" method="POST">
				@csrf
				<input type="hidden" name="category_slug" value="{{ $category->slug }}">
				<div class="form-group">
					<label>Product</label>
					<select name="product_id" class="form-control product">
						<option>Select Product</option>
						@foreach($products as $product)
							<option value="{{ $product->id }}">
								{{ $product->name }}
							</option>
						@endforeach
					</select>
				</div>
				<div class="row">
					<div class="col-md-4">
						<label>Serial</label>
						<select name="serial" class="form-control">
							@for($i=1;$i<=20;$i++)
		        			<option value="{{ $i }}">{{ $i }}</option>
		        			@endfor
		        		</select>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Status</label>
							<select name="status" class="form-control">
								<option value="1">Active</option>
								<option value="0">In Active</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label> </label>
							<button type="submit" class="btn pointer btn-primary btn-block ">Add</button>
						</div>
					</div>
				</div>
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
