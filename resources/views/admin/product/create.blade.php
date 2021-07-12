@extends('admin.layouts.app')
@section('title','Add Product')
@push('css')
<style>
    .button {
      float: right;     
      padding: 15px 25px;
      font-size: 24px;
      text-align: center;
      cursor: pointer;
      outline: none;
      color: #fff;
      background-color: #4CAF50;
      border: none;
      border-radius: 15px;
      box-shadow: 0 9px #999;
    }

    .button:hover {background-color: #3e8e41}

    .button:active {
      background-color: #3e8e41;
      box-shadow: 0 5px #666;
      transform: translateY(4px);
    }
</style>
@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Add New Product</div>
            </div>
            <div class="ibox-body">
                <form action="{{ route('admin.product.store') }}" method="POST" enctype="multipart/form-data" onsubmit="return validate()">
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
                            <label for="discount_price" id="discount_label">Discount Price</label>
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
                        <div class="col-sm-12 form-group">
                            <label id="specification_label">
                                Product Specification
                            </label>
                            <textarea name="specification" class="form-control"
                                      id="specification"></textarea>
                            <script>
                                CKEDITOR.replace('specification')
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
                            <label></label>
                    		<button type="submit"  class="button preview"> 
                                Add Product
                            </button>
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
    function validate(){
        var name = $('#name').val();
        var category = $('#category_id').val();
        var unit_price = $('#unit_price').val();
        var discount_price = $('#discount_price').val();
        var product_details = document.getElementById("product_details");
        var total_length = CKEDITOR.instances['product_details'].getData().replace(/<[^>]*>/gi, '').length;
        var image = $('#images').val();

        if(!(name.length) && (name.trim() == "")){
            $('#name').css("border","1px solid red");
            return false;
        } else if(!category.length){
            $('#category_id').css("border","1px solid red");
            return false;
        } else if(!(unit_price.length) && (unit_price.trim() == "")){
            $('#unit_price').css("border","1px solid red");
            return false;
        } else if((discount_price.length > 0) && (discount_price >= unit_price)){
            $('#discount_price').css("border","1px solid red");
            $("#discount_label").append("<span style='color: red;'>Invalid Discount Price</span>");
            return false;
        } else if (total_length == 0){
            $('#details_label').append("<span style='color:red;'>Required</span>");
            return false;
        } else if(!(image.length)){
            $('#images').css("border","1px solid red");
            return false;
        } else {
            return true;
        }
    }
</script>
@endpush