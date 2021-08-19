@extends('admin.layouts.app')
@section('title','Edit Product - '.$product->name)
@push('css')
@endpush

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Edit - {{ $product->name }}</div>
            </div>
            <div class="ibox-body">
                <form action="{{ route('admin.product.update',$product->id) }}" method="POST" enctype="multipart/form-data">
                	@csrf
                    @method('PUT')
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label for="name">Product Name</label>
                            <input  name="name" id="name" class="form-control" type="text" value="{{ $product->name }}">
                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="category_id">Category</label>
                            <select name="category_id" id="category_id" class="form-control" onchange="getSubcategory()">
                            	<option value="{{ $product->category_id }}">
                                 {{ $product->category->name }}   
                                </option>
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
                            	<option value="{{ $product->subcategory_id != null? $product->subcategory->id : '' }}" >
                                            {{ $product->subcategory_id != null? $product->subcategory->name : '' }}
                                        </option>
                            	
                            </select>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-sm-2 form-group">
                            <label for="brand_id">Brand</label>
                            <select name="brand_id" id="brand_id" class="form-control">
                            	<option value="{{ $product->brand_id }}">{{ $product->brand->name }}</option>
                            	@foreach($categories as $category)
                            	<option value="{{ $category->id }}">
                            		{{ $category->name }}
                            	</option>
                            	@endforeach
                            </select>
                        </div>
                        <div class="col-sm-2 form-group">
                            <label for="product_code">Product Code</label>
                            <input type="text" name="product_code" id="product_code" class="form-control" value="{{ $product->product_code }}">
                        </div>
                        <div class="col-sm-2 form-group">
                            <label for="unit_price">Unit Price</label>
                            <input type="text" name="unit_price" id="unit_price" class="form-control" value="{{ $product->unit_price }}">
                        </div>
                        <div class="col-sm-2 form-group">
                            <label for="discount_price">Discount Price</label>
                            <input type="text" name="discount_price" id="discount_price" class="form-control" value="{{ $product->discount_price }}">
                        </div>
                        <div class="col-sm-2 form-group">
                            <label for="stock_status">Stock Status</label>
                            <select name="stock_status" id="stock_status" class="form-control">
                                <option value="{{ $product->stock_status }}">
                                 {{ $product->stock_status == 1 ? 'In Stock' : 'Out Of Stock' }}   
                                @if($product->stock_status == 1)
                                    <option value="0">Out Of Stock</option>
                                @elseif($product->stock_status == 0)   
                                    <option value="1">In Stock</option>
                                @endif
                                </option>
                            </select>   
                        </div>
                        <div class="col-sm-2 form-group">
                            <label for="quantity">Quantity</label>
                            <input name="quantity" id="quantity" class="form-control" value="{{ $product->quantity }}">
                        </div>
                    </div>

                    <div class="row">
                    	{{-- <div class="col-sm-3 form-group">
                            <label for="unit_weight">Unit Weight</label>
                            <input name="unit_weight" id="unit_weight" class="form-control" value="{{ $product->unit_weight }}">
                        </div> --}}
                        
                    </div>

                    <div class="row">
                    	<div class="col-sm-4 form-group">
                    		<label for="">Units</label>
                    		<select name="units[]" id="units" class="form-control select2_demo_1" multiple="">
                                @foreach($product->units as $unit)
                                <option value="{{ $unit->id }}" selected="">
                                    {{ $unit->name }}
                                </option>
                                @endforeach

                    			@foreach($units as $unit)
                    			 <option value="{{ $unit->id }}">{{ $unit->name }}</option>
                    			@endforeach
                    		</select>
                    	</div>
                    	<div class="col-sm-4 form-group">
                    		<label for="">Sizes</label>
                    		<select name="sizes[]" id="sizes" class="form-control select2_demo_1" multiple>
                                @foreach($product->sizes as $size)
                                <option value="{{ $size->id }}" selected="">
                                    {{ $size->name }}
                                </option>
                                @endforeach
                    			@foreach($sizes as $size)
                    			<option value="{{ $size->id }}">{{ $size->name }}</option>
                    			@endforeach
                    		</select>
                    	</div>
                    	<div class="col-sm-4 form-group">
                    		<label for="">Colors</label>
                    		<select name="colors[]" id="colors" class="form-control select2_demo_1" multiple>
                    			 @foreach($product->colors as $color)
                                <option value="{{ $color->id }}" selected="">
                                    {{ $color->name }}
                                </option>
                                @endforeach
                    			@foreach($colors as $color)
                    			<option value="{{ $color->id }}">{{ $color->name }}</option>
                    			@endforeach
                    		</select>
                    	</div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-6 form-group">
                            <label for="special_note">Special Note</label>
                            <input type="text" name="special_note" id="special_note" class="form-control" value="{{ $product->special_note }}">
                        </div>
                        <div class="col-sm-6 form-group">
                            <label for="video_link">Video Link</label>
                            <input type="text" name="video_link" id="video_link" class="form-control" value="{{ $product->video_link }}">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <label for="short_description">Product Short Description</label>
                            <textarea name="short_description" id="short_description" class="form-control">{{ $product->short_description }}</textarea>
                        </div>
                    </div>

                    <div class="row">
                    	<div class="col-sm-12 form-group">
                    		<label id="details_label">
                    			Product Details
							</label>
							<textarea name="product_details" class="form-control"
									  id="product_details">{{ $product->product_details }}</textarea>
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
                                      id="specification">{{ $product->specification }}</textarea>
                            <script>
                                CKEDITOR.replace('specification')
                            </script>
                        </div>
                    </div>

                    <div class="row" id="h_i">
                        @foreach($product->images as $image)
                            <div class="col-md-3">
                                {{-- {{ route('admin.hotel-image-remove',$image->id) }} --}}
                                <span style="vertical-align: top;">
                                    <button type="button" class="badge badge-danger text-right" onclick="beSure({{ $image->id }})" style="float: right;">
                                    <i class="fa fa-times-circle"></i>
                                    </button>
                                </span>
                                <span style="vertical-align: bottom;">
                                    <img src="{{ asset($image->image) }}" class="img-responsive p-0" alt="Image" style="height: 150px;width: 90%;">
                                </span>
                                
                            </div>
                        @endforeach
                  </div>
                  <br>
                    <div class="row">
                    	<div class="col-sm-4 form-group">
                    		<label for="images">Images(Multiple)</label>
                            <input type="file" name="images[]" id="images" class="form-control" multiple>
                    	</div>
                    	<div class="col-sm-4 form-group">
                    		<label for="status">Status</label>
                    		<select name="status" id="status" class="form-control">
                    			<option value="{{ $product->status }}">
                                    {{ $product->status == 1 ? 'Active':'In Active' }}</option>
                                @if($product->status == 1)    
                                    <option value="0">In Active</option>
                                @elseif($product->status == 0)
                                    <option value="1">Active</option>
                                @endif
                    		</select>
                    	</div>
                    	<div class="col-sm-4 form-group pt-4 ">
                    		<button class="btn btn-success btn-lg btn-block pointer " type="submit">Update</button>
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
    function beSure(id) {
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
              axios.delete('/admin/remove-image/'+id);
              location.reload();
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

    function getSubcategory(){
        $('#subcategory_id') .find('option') .remove() .end() .append('<option value="">Select Sub Category</option>');
        var id = document.getElementById('category_id').value;

         axios.get(`/api/get_subcategory/${id}`)
        .then(function (response) {
            var list = response.data;
            var select = document.getElementById("subcategory_id");
            for(i = 0; i < list.length ;i ++){
                var el = document.createElement("option");
                var subcategorys = list[i];
                var subcategoryName = subcategorys.name;
                var subcategoryId = subcategorys.id;
                el.textContent = subcategoryName;
                el.value = subcategoryId;
                select.appendChild(el);
            }
        });
    }
</script>
@endpush