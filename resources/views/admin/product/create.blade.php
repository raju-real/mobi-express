@extends('admin.layouts.app')
@section('title','Add Product')
@push('css')
@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Add New Product</div>
            </div>
            <div class="ibox-body">
                <form action="{{ route('admin.product.store') }}" method="POST" enctype="multipart/form-data">
                	@csrf
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label for="name">Product Name</label>
                            <input  name="name" id="name" class="form-control" type="text" placeholder="Product Name">
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="category_id">Category</label>
                            <select name="category_id" id="category_id" class="form-control">
                            	<option value="">Select Category</option>
                            	@foreach($categories as $category)
                            	<option value="{{ $category->id }}">
                            		{{ $category->name }}
                            	</option>
                            	@endforeach
                            </select>
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="subcategory_id">Sub Category</label>
                            <select name="subcategory_id" id="subcategory_id" class="form-control">
                            	<option value="">Select Category</option>
                            	@foreach($categories as $category)
                            	<option value="{{ $category->id }}">
                            		{{ $category->name }}
                            	</option>
                            	@endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-sm-3 form-group">
                            <label for="brand_id">Brand</label>
                            <select name="brand_id" id="brand_id" class="form-control">
                            	<option value="">Select Brand</option>
                            	@foreach($brands as $brand)
                            	<option value="{{ $brand->id }}">
                            		{{ $brand->name }}
                            	</option>
                            	@endforeach
                            </select>
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="product_code">Product Code</label>
                            <input type="text" name="product_code" id="product_code" class="form-control" placeholder="Product Code">
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="unit_price">Unit Price</label>
                            <input type="text" name="unit_price" id="unit_price" class="form-control" placeholder="Unit Price">
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="discount_price">Discount Price</label>
                            <input type="text" name="discount_price" id="discount_price" class="form-control" placeholder="Discount Price">
                        </div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-3 form-group">
                            <label for="unit_weight">Unit Weight</label>
                            <input name="unit_weight" id="unit_weight" class="form-control" placeholder="Unit Weight">
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="stock_status">Stock Status</label>
                            <select name="stock_status" id="stock_status" class="form-control">
                            	<option value="1">In Stock</option>
                            	<option value="0">Out Of Stock</option>
                            </select>	
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="quantity">Quantity</label>
                            <input name="quantity" id="quantity" class="form-control" placeholder="Quantity">
                        </div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-4 form-group">
                    		<label for="">Units</label>
                    		<select name="units[]" id="units" class="form-control select2_demo_1" multiple>
                    			<option value="">Select Unit</option>
                    			@foreach($units as $unit)
                    			<option value="{{ $unit->id }}">{{ $unit->name }}</option>
                    			@endforeach
                    		</select>
                    	</div>
                    	<div class="col-sm-4 form-group">
                    		<label for="">Sizes</label>
                    		<select name="sizes[]" id="sizes" class="form-control select2_demo_1" multiple>
                    			<option value="">Select Size</option>
                    			@foreach($sizes as $size)
                    			<option value="{{ $size->id }}">{{ $size->name }}</option>
                    			@endforeach
                    		</select>
                    	</div>
                    	<div class="col-sm-4 form-group">
                    		<label for="">Colors</label>
                    		<select name="colors[]" id="colors" class="form-control select2_demo_1" multiple>
                    			<option value="">Select Color</option>
                    			@foreach($colors as $color)
                    			<option value="{{ $color->id }}">{{ $color->name }}</option>
                    			@endforeach
                    		</select>
                    	</div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-6 form-group">
                            <label for="special_note">Special Note</label>
                            <input type="text" name="special_note" id="special_note" class="form-control" placeholder="Special Note">
                        </div>
                        <div class="col-sm-6 form-group">
                            <label for="video_link">Video Link</label>
                            <input type="text" name="video_link" id="video_link" class="form-control" placeholder="Video Link">
                        </div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-12 form-group">
                    		<label id="details_label">
                    			Product Details
							</label>
							<textarea name="product_details" class="form-control"
									  id="product_details"></textarea>
							<script>
                                CKEDITOR.replace('product_details')
                        	</script>
                    	</div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-4 form-group">
                    		<label for="images">Images(Multiple)</label>
                            <input type="file" name="images[]" id="images" class="form-control" multiple>
                    	</div>
                    	<div class="col-sm-4 form-group">
                    		<label for="status">Status</label>
                    		<select name="status" id="status" class="form-control">
                    			<option value="1">Active</option>
                    			<option value="0">In Active</option>
                    		</select>
                    	</div>
                    	<div class="col-sm-4 form-group btn-block">
                    		<button class="btn btn-default" type="submit">Submit</button>
                    	</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script>
	$('.select2_demo_1').select2();
</script>
@endpush