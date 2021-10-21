@if(sizeof($products) > 0)
<div class="w-100">
	

                <!--shop banner area start-->
                @if(isset($image))
                <div class="shop_banner_area mb-30">
                    <div class="row">
                        <div class="col-12">
                            <div class="shop_banner_thumb">
                                <img src="{{ asset($image) }}" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                 @endif
                <!--shop banner area end-->
                <!--shop toolbar start-->
                <div class="shop_toolbar_wrapper">
                	<div class="shop_toolbar_btn">
                            <button data-role="grid_4" type="button" class=" active btn-grid-4" data-toggle="tooltip" title="4"></button>
                            <button data-role="grid_list" type="button" class="btn-list" data-toggle="tooltip" title="List"></button>
                        </div>
                    <div class="">
                        <form>
                            <select class="form-control" id="short">
                                <option value="">Short By Price</option>
                                <option value="1">High To Low</option>
                                <option value="2">Low To High</option>
                            </select>
                        </form>
                        
                    </div>
                    <div class="page_amount">
                        <p>Showing {{ $products->count() }} Products</p>
                    </div>
                </div>
                <!--shop toolbar end-->

                <!--shop wrapper start-->
                <div class="row no-gutters shop_wrapper">
                	@foreach($products as $product)
                    <div class="col-lg-3 col-md-4 col-12 ">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a class="primary_img" href="{{ route('product-details',$product->slug) }}">
                                        @if(isset($product->image) && file_exists($product->image) AND !empty($product->image))
                                        <img src="{{ asset($product->image) }}" alt="">
                                        @else
                                        <img src="{{ asset('assets/common/images/product.png') }}" alt="">
                                        @endif
                                    </a>

                                    <a class="secondary_img" href="{{ route('product-details',$product->slug) }}">
                                        @if(isset($product->image) && file_exists($product->image) AND !empty($product->image))
                                        <img src="{{ asset($product->image) }}" alt="">
                                        @else
                                        <img src="{{ asset('assets/common/images/product.png') }}" alt="">
                                        @endif
                                    </a>
                                </div>

                                <div class="product_content grid_content">
                                    <div class="product_content_inner">
                                        <h4 class="product_name"><a href="{{ route('product-details',$product->slug) }}">
                                        	{{ $product->name }}
                                        </a></h4>
                                        <div class="product_rating">
                                            <ul>
                                                @for($i=1;$i<=$product->rating;$i++)
                                                <li><i class="ion-android-star" style="font-size: 20px;color: orange;"></i></li>
                                                @endfor
                                            </ul>
                                        </div>
                                        <div class="price_box">
                                        	@if($product->discount_price > 0)
                                                <span class="old_price">
                                                	{{ $product->unit_price }}
                                                </span>
                                                <span class="current_price">
                                                {{ $product->discount_price }} BDT
                                            </span>
                                            @else
                                            <span class="current_price">
                                                {{ $product->unit_price }} BDT
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="javascript:void(0)" onclick="addToCartSingle({{ $product->id }})" title="Add to cart">Add to cart</a>
                                    </div>
                                </div>
                                <div class="product_content list_content">
                                    <h4 class="product_name"><a href="{{ route('product-details',$product->slug) }}">
                                    	{{ $product->name }}
                                    </a></h4>
                                    <div class="product_rating">
                                        <ul>
                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="price_box">
                                    	@if($product->discount_price > 0)
                                        <span class="old_price">
                                        	{{ $product->discount_price }}
                                        </span>
                                        @endif
                                        <span class="current_price">
                                        	{{ $product->unit_price }}
                                        </span>
                                    </div>
                                    <div class="product_desc">
                                        <p>
                                        	{!! $product->product_details !!}
                                        </p>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="javascript:void(0)" onclick="addToCartSingle({{ $product->id }})" title="Add to cart">Add to cart</a>
                                    </div>
                                    
                                </div>
                            </figure>
                        </article>
                    </div>
                    @endforeach
                </div>

                <div class="shop_toolbar t_bottom">
                    <div class="pagination">
                        {{ $products->links() }}
                    </div>
                </div>
                <!--shop toolbar end-->
                <!--shop wrapper end-->
                @else 
                    <div class="alert alert-danger text-center" role="alert">
                        <strong>No Items Found :)</strong>
                    </div>
                @endif
                </div>