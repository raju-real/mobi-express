@extends('user.layouts.app')
@section('title', $product->name)
@push('css')

@section('content')
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="{{ route('home') }}">home</a></li>
                        <li>product details</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<div class="product_page_bg">
    <div class="container">
        <div class="product_details_wrapper mb-55">
            <!--product details start-->
            <div class="product_details">
                <div class="row">
                    <div class="col-lg-5 col-md-6">
                        <div class="product-details-tab">
                            @php
                                $image = DB::table('product_images')
                                ->where('product_id',$product->id)
                                ->whereNotNull('image')
                                ->first();
                            @endphp
                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="{{ asset($image->image) }}" data-zoom-image="{{ asset($image->image) }}" alt="big-1">
                                </a>
                            </div>
                            <div class="single-zoom-thumb">
                                <ul class="s-tab-zoom owl-carousel single-product-active" id="gallery_01">
                                    @foreach($product->images as $image)
                                    <li>
                                        <a href="#" class="elevatezoom-gallery active" data-update="" data-image="{{ asset($image->image) }}" data-zoom-image="{{ asset($image->image) }}">
                                            <img src="{{ asset($image->image) }}" alt="" />
                                        </a>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-6">
                        <div class="product_d_right">
                            <form action="#">

                                <h3>{{ $product->name }}</h3>
                                
                                <div class="product_rating">
                                    <ul>
                                        <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                        <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                        <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                        <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                        <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                        <li class="review"><a href="#">(1 customer review )</a></li>
                                    </ul>
                                </div>
                                <div class="price_box">
                                    @if($product->discount_price > 0)
                                    <span class="old_price">
                                        {{ $product->discount_price }}
                                    </span>
                                    @endif
                                    <span class="current_price">
                                        {{ $product->unit_price }} BDT
                                    </span>
                                </div>
                                <div class="product_desc">
                                    <p>
                                        {!! $product->product_details !!}
                                    </p>
                                </div>
                                <div class="product_variant color">
                                    <h3>Available Options</h3>
                                    <hr>
                                    <div class="row">
                                        <div class="form-group col-3">
                                            <label>Color</label>
                                            <select name="color_id" class="form-control form-select-sm">
                                                @foreach($product->colors as $color)
                                                    <option>Select Color</option>
                                                    <option value="{{ $color->id }}">
                                                        {{ $color->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-3">
                                            <label>Size</label>
                                            <select name="size_id" class="form-control form-select-sm">
                                                @foreach($product->sizes as $size)
                                                    <option>Select Size</option>
                                                    <option value="{{ $size->id }}">
                                                        {{ $size->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                                                        
                                </div>
                                <div class="product_variant quantity">
                                    <label>quantity</label>
                                    <input min="1" max="{{ $product->quantity }}" value="1" type="number">
                                    <button class="button" type="submit">add to cart</button>

                                </div>
                                <div class=" product_d_action">
                                    <ul>
                                        <li><a href="#" title="Add to wishlist">+ Add to Wishlist</a></li>
                                    </ul>
                                </div>
                                <div class="product_meta">
                                    <span>Category: <a href="#">
                                        {{ $product->category->name }}</a>
                                    </span>
                                </div>

                            </form>
                            {{-- <div class="priduct_social">
                                <ul>
                                    <li><a class="facebook" href="#" title="facebook"><i class="fa fa-facebook"></i> Like</a></li>
                                    <li><a class="twitter" href="#" title="twitter"><i class="fa fa-twitter"></i> tweet</a></li>
                                    <li><a class="pinterest" href="#" title="pinterest"><i class="fa fa-pinterest"></i> save</a></li>
                                    <li><a class="google-plus" href="#" title="google +"><i class="fa fa-google-plus"></i> share</a></li>
                                    <li><a class="linkedin" href="#" title="linkedin"><i class="fa fa-linkedin"></i> linked</a></li>
                                </ul>
                            </div> --}}

                        </div>
                    </div>
                </div>
            </div>
            <!--product details end-->

            <!--product info start-->
            <div class="product_d_info">
                <div class="row">
                    <div class="col-12">
                        <div class="product_d_inner">
                            <div class="product_info_button">
                                <ul class="nav" role="tablist" id="nav-tab">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">Description</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet" aria-selected="false">Specification</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews (1)</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="info" role="tabpanel">
                                    <div class="product_info_content">
                                        <p>
                                            {!! $product->product_details !!}
                                        </p>
                                        @if($product->video_link != null)
                                            {!! Embed::make($product->video_link)
                                            ->setAttribute([
                                                'width' => 700,
                                                'height'=>400
                                            ])->parseUrl()
                                            ->getIframe() !!}
                                        @endif    
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="sheet" role="tabpanel">
                                    <div class="product_d_table">
                                        <form action="#">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="first_child">Compositions</td>
                                                        <td>Polyester</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="first_child">Styles</td>
                                                        <td>Girly</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="first_child">Properties</td>
                                                        <td>Short Dress</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                    <div class="product_info_content">
                                        <p>Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which have since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe. The result? Cool, easy, chic looks with youthful elegance and unmistakable signature style. All the beautiful pieces are made in Italy and manufactured with the greatest attention. Now Fashion extends to a range of accessories including shoes, hats, belts and more!</p>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="reviews" role="tabpanel">
                                    <div class="reviews_wrapper">
                                        <h2>1 review for Donec eu furniture</h2>
                                        <div class="reviews_comment_box">
                                            <div class="comment_thmb">
                                                <img src="assets/img/blog/comment2.jpg" alt="">
                                            </div>
                                            <div class="comment_text">
                                                <div class="reviews_meta">
                                                    <div class="product_rating">
                                                        <ul>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <p><strong>admin </strong>- September 12, 2018</p>
                                                    <span>roadthemes</span>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="comment_title">
                                            <h2>Add a review </h2>
                                            <p>Your email address will not be published. Required fields are marked </p>
                                        </div>
                                        <div class="product_rating mb-10">
                                            <h3>Your rating</h3>
                                            <ul>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_review_form">
                                            <form action="#">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <label for="review_comment">Your review </label>
                                                        <textarea name="comment" id="review_comment"></textarea>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6">
                                                        <label for="author">Name</label>
                                                        <input id="author" type="text">

                                                    </div>
                                                    <div class="col-lg-6 col-md-6">
                                                        <label for="email">Email </label>
                                                        <input id="email" type="text">
                                                    </div>
                                                </div>
                                                <button type="submit">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--product info end-->
        </div>

        <!--product area start-->
        <section class="product_area related_products">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>
                            Related Products 
                        </h2>
                        <a href="{{ route('category-products',$product->category->slug) }}" class="btn btn-sm btn-warning" style="float: right;padding-right: 9px;">See All</a>
                    </div>
                </div>
            </div>
            <div class="product_carousel product_style product_column5 owl-carousel">
                @foreach($releatedProducts as $product)
                <article class="single_product">
                    <figure>
                        @php
                            $image = DB::table('product_images')
                                ->where('product_id',$product['id'])
                                ->whereNotNull('image')
                                ->latest()
                                ->first()->image;
                        @endphp
                        <div class="product_thumb">
                            <a class="primary_img" href="{{ route('product-details',$product->slug) }}"><img src="{{ asset($image) }}" alt=""></a>
                            {{-- <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div> --}}
                            
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="{{ route('product-details',$product->slug) }}">
                                    {{ $product->name }}
                                </a></h4>
                                <div class="price_box">
                                    @if($product->discount_price > 0)
                                    <span class="old_price">
                                        {{ $product->discount_price }}
                                    </span>
                                    @endif
                                    <span class="current_price">
                                        {{ $product->unit_price }} BDT
                                    </span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
                @endforeach
            </div>

        </section>
        <!--product area end-->

        <!--product area start-->
        <section class="product_area upsell_products">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>Upsell Products </h2>
                    </div>
                </div>
            </div>
            <div class="product_carousel product_style product_column5 owl-carousel">
                <article class="single_product">
                    <figure>

                        <div class="product_thumb">
                            <a class="primary_img" href="product-details.html"><img src="assets/img/product/product28.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product29.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                    <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                    <li class="quick_button"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#modal_box" data-tippy="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="product-details.html">Natus erro at congue massa commodo sit Natus erro</a></h4>
                                <div class="price_box">
                                    <span class="old_price">$80.00</span>
                                    <span class="current_price">$70.00</span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
                <article class="single_product">
                    <figure>

                        <div class="product_thumb">
                            <a class="primary_img" href="product-details.html"><img src="assets/img/product/product7.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product8.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                    <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                    <li class="quick_button"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#modal_box" data-tippy="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="product-details.html">Nullam maximus eget nisi dignissim sodales eget tempor</a></h4>
                                <div class="price_box">
                                    <span class="old_price">$76.00</span>
                                    <span class="current_price">$75.00</span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
                <article class="single_product">
                    <figure>

                        <div class="product_thumb">
                            <a class="primary_img" href="product-details.html"><img src="assets/img/product/product9.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product10.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                    <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                    <li class="quick_button"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#modal_box" data-tippy="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="product-details.html">Mirum est notare tellus eu nibh iaculis pretium</a></h4>
                                <div class="price_box">
                                    <span class="old_price">$72.00</span>
                                    <span class="current_price">$70.00</span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
                <article class="single_product">
                    <figure>

                        <div class="product_thumb">
                            <a class="primary_img" href="product-details.html"><img src="assets/img/product/product11.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product12.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                    <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                    <li class="quick_button"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#modal_box" data-tippy="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="product-details.html">Mirum est notare tellus eu nibh iaculis pretium</a></h4>
                                <div class="price_box">
                                    <span class="old_price">$65.00</span>
                                    <span class="current_price">$60.00</span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
                <article class="single_product">
                    <figure>

                        <div class="product_thumb">
                            <a class="primary_img" href="product-details.html"><img src="assets/img/product/product13.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product4.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                    <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                    <li class="quick_button"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#modal_box" data-tippy="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="product-details.html">Eodem modo vel mattis ante facilisis nec porttitor efficitur</a></h4>
                                <div class="price_box">
                                    <span class="old_price">$86.00</span>
                                    <span class="current_price">$79.00</span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
                <article class="single_product">
                    <figure>

                        <div class="product_thumb">
                            <a class="primary_img" href="product-details.html"><img src="assets/img/product/product15.jpg" alt=""></a>
                            <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product16.jpg" alt=""></a>
                            <div class="label_product">
                                <span class="label_sale">Sale</span>
                            </div>
                            <div class="action_links">
                                <ul>
                                    <li class="wishlist"><a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a></li>
                                    <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                                    <li class="quick_button"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#modal_box" data-tippy="quick view"><i class="ion-ios-search-strong"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_content">
                            <div class="product_content_inner">
                                <h4 class="product_name"><a href="product-details.html">Donec tempus pretium arcu et faucibus commodo</a></h4>
                                <div class="price_box">
                                    <span class="old_price">$82.00</span>
                                    <span class="current_price">$75.00</span>
                                </div>
                            </div>
                            <div class="add_to_cart">
                                <a href="cart.html" title="Add to cart">Add to cart</a>
                            </div>

                        </div>
                    </figure>
                </article>
            </div>
        </section>
        <!--product area end-->
    </div>
</div>


@endsection

@push('js')
<script type="text/javascript">
  $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

  function getInputs(){
      var product_id = $('#product_id').val();
      var quantity = $('#quantity').val();
      return { product_id : product_id,quantity : quantity }
  }

  function addToCart(){
    $.ajax({
    method : 'POST',
    url : "{{ route('add-to-cart') }}",
    data : getInputs(),
    dataType : 'JSON',
    success : function(response){
        if(response.type == 'success'){
            Swal.fire({
                text: response.message,
                icon: "success",
                button: "Ok",
            });
            $("#nav").load(location.href + " #nav");
            //$('#alert').addClass('alert alert-success').text(response.message);
        } else if(response.type == 'danger') {
            Swal.fire({
                text: response.message,
                icon: "error",
                button: "Ok",
            })
           // $('#alert').addClass('alert alert-danger').text(response.message);
        }

    }
    });
  }

  // function addToFavorite(){
  //     $.ajax({
  //       method : 'POST',
  //       url : "{{ route('add-to-favorite') }}",
  //       data : {'product_id':$('#product_id').val()},
  //       dataType : 'JSON',
  //       success : function(response){
  //           if(response.type == 'success'){
  //           Swal.fire({
  //               text: response.message,
  //               icon: "success",
  //               button: "Ok",
  //           });
  //       } else if(response.type == 'error') {
  //           Swal.fire({
  //               text: response.message,
  //               icon: "error",
  //               button: "Ok",
  //           })
  //           //window.location.href = response.redirect;
  //          // $('#alert').addClass('alert alert-danger').text(response.message);
  //       }
  //       }
  //     });
  // }
</script>
@endpush

