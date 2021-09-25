<!doctype html>
<html class="no-js" lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>@yield('title','')</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon"
        href="assets/img/favicon.ico">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="{{ asset('assets/user/css/plugins.css') }}">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="{{ asset('assets/user/css/style.css') }}">
    <!-- Sweetalert cdn -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- toastr -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/topuhit/Font-Bangla@1.0.3/1.0.0/font-bangla.css">
   <script src="{{ asset('assets/user/js/plugins.js') }}"></script>
   
   <style type="text/css">
       .autocomplete-item{
        display: grid;
       }
       .autocomplete-item a {
          padding: 3px 0px 3px 10px;
          cursor: pointer;
          background-color: #fff;
          /*border-bottom: 1px solid #d4d4d4;*/
          font-size: 15px;
        }
        .autocomplete-item a:hover {
          /*when hovering an item:*/
          /*background-color: #e9e9e9;*/
          color: #1a9cb7;
        }
   </style>
    @stack('css')

</head>

<body>
    @include('sweetalert::alert')
    <!--Offcanvas menu area start-->
    <div class="off_canvars_overlay"></div>
    <div class="Offcanvas_menu">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="canvas_open">
                        <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                    </div>
                    <div class="Offcanvas_menu_wrapper">
                        <div class="canvas_close">
                            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                        </div>
                        <div class="antomi_message">
                            <p>Get free shipping – Free 30 day money back guarantee</p>
                        </div>
                        <div class="header_top_settings text-right">
                            <ul>
                                <li><a href="#">Store Locations</a></li>
                                <li><a href="#">Track Your Order</a></li>
                                <li>Hotline: <a href="tel:+0123456789">0123456789 </a></li>
                                <li>Quality Guarantee Of Products</li>
                            </ul>
                        </div>
                        <div class="search_container">
                            <form action="#">
                                <div class="search_box">
                                    <input placeholder="Search product..." type="text">
                                    <button type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                        <div id="menu" class="text-left">

                            @include('user.layouts.header_nav')

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Offcanvas menu area end-->
    <!--header area start-->
    <header>
        <div class="main_header">
            <div class="container">
                <!--header top start-->
                <div class="header_top">
                    <div class="row align-items-center">
                        <div class="col-lg-4 col-md-5">
                            <div class="antomi_message">
                                <p>Get free shipping – Free 30 day money back guarantee</p>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7">
                            <div class="header_top_settings text-right">
                                <ul>
                                    <li><a href="#">Store Locations</a></li>
                                    <li>Hotline: <a href="tel:+0123456789">0123456789 </a></li>
                                    <li>Quality Guarantee Of Products</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--header top start-->

                <!--header middel start-->
                <div class="header_middle sticky-header">
                    <div class="row align-items-center">
                        <div class="col-lg-2 col-md-3 col-4">
                            <div class="logo">
                                <a href="{{ route('home') }}"><img src="{{ asset('assets/user/img/logo/demo_3.png') }}" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-12">
                            <div class="main_menu menu_position text-center">
                                <nav>
                                    @include('user.layouts.header_nav')
                                </nav>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-7 col-6">
                            <div class="header_configure_area">
                                <div class="header_wishlist">
                                    <a href="{{ route('user.dashboard') }}"><i class="fa fa-user"></i>
                                    </a>
                                </div>

                                @php
                                    $carts = DB::table('carts')->where('session_id',session()->get('session_id'))->get();
                                    $totalPrice = 0;
                                    foreach($carts as $cart){
                                        $totalPrice += $cart->total_price;
                                    }
                                @endphp

                                <div class="header_wishlist">
                                    <a href="{{ route('wishlists') }}"><i class="ion-android-favorite-outline"></i>
                                        <span class="wishlist_count">
                                            {{ Auth::check() ? App\Model\Favorite::where('user_id',Auth::id())->count() : 0 }}
                                        </span>
                                    </a>
                                </div>

                                 <div class="header_wishlist">
                                    <a href="{{ route('carts') }}"><i class="fa fa-shopping-bag"></i>
                                        <span class="wishlist_count">
                                            {{ $carts->count() }}
                                        </span>
                                    </a>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <!--header middel end-->

                 <!--mini cart-->
                {{-- <div class="mini_cart">
                    @php
                        $cartData = App\Model\Cart::where('session_id',session()->get('session_id'))->get();
                    @endphp
                    <div class="cart_close">
                        <div class="cart_text">
                            <h3>cart</h3>
                        </div>
                        <div class="mini_cart_close">
                            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                        </div>
                    </div>
                    @foreach($cartData as $cart)
                    <div class="cart_item">
                        <div class="cart_img">
                            @php
                                $image = DB::table('product_images')->where('product_id',$cart->product->id)
                                ->whereNotNull('image')->first()->image;
                            @endphp
                            <a href="{{ route('product-details',$cart->product->slug) }}"><img src="{{ asset($image) }}" alt=""></a>
                        </div>
                        <div class="cart_info">
                            <a href="{{ route('product-details',$cart->product->slug) }}">
                                {{ $cart->product->name }}
                            </a>
                            <p>
                                Qty: {{ $cart->quantity }} X
                                <span>{{ $cart->total_price }}</span>
                            </p>
                        </div>
                        <div class="cart_remove">
                            <a href="javascript:void(0)" onclick="removeCartItem({{ $cart->id }})"><i class="ion-android-close"></i></a>
                        </div>
                    </div>
                    @endforeach
                    <div class="mini_cart_table">
                        <div class="cart_total">
                            <span>Sub total:</span>
                            <span class="price">$138.00</span>
                        </div>
                        <div class="cart_total mt-10">
                            <span>total:</span>
                            <span class="price">$138.00</span>
                        </div>
                    </div>
                    <div class="mini_cart_footer">
                        <div class="cart_button">
                            <a href="cart.html">View cart</a>
                        </div>
                        <div class="cart_button">
                            <a class="active" href="checkout.html">Checkout</a>
                        </div>

                    </div>
                </div> --}}
                <!--mini cart end-->

                <!--header bottom satrt-->
                <div class="header_bottom">
                    <div class="row align-items-center">
                        <div class="column1 col-lg-3 col-md-6">
                            <div class="categories_menu categories_three">
                                <div class="categories_title">
                                    <h2 class="categori_toggle">SHOP BY CATEGORY</h2>
                                </div>
                                @include('user.layouts.category_menu')
                            </div>
                        </div>
                        <div class="column2 col-lg-6 ">
                            <div class="search_container">
                                @php
                                    $categories = DB::table('categories')->orderBy('name','asc')->get();
                                @endphp
                                <form action="#">
                                    <div class="hover_category">
                                        <select class="select_option" name="select" id="category_id">
                                            <option selected value="">All Categories</option>
                                            @foreach($categories as $category)
                                            <option value="{{ $category->id }}">
                                                {{ $category->name }}
                                            </option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="search_box"
                                        style="position: relative;
                                            display: inline-block;">
                                        <input id="product_name" autocomplete="off" placeholder="Search product..." type="text" onkeyup="searchProduct()">
                                        {{-- <button type="submit">Search</button> --}}
                                        <div id="searchResult" style="display: none;position: absolute;width: 100%;">
                                        <ul class="dropdown-menu" style="display:block; position:relative;">
                                            <li class="autocomplete-item">

                                            </li>

                                        </ul>
                                    </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                        <div class="column3 col-lg-3 col-md-6">
                            <div class="header_bigsale">
                                <a href="{{ route('campaign') }}">CAMPAIGN</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--header bottom end-->
            </div>
        </div>
    </header>
    <!--header area end-->

    @yield('content')

    <!--footer area start-->
    <footer class="footer_widgets">
        @php
            $contact = App\Model\ContactUs::first();
        @endphp
        <!--newsletter area start-->
        <div class="newsletter_area">
            <div class="container">
                <div class="newsletter_inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-5">
                            <div class="newsletter_sing_up">
                                <h3>Newsletter Sign Up</h3>
                                <p>(Get <span>30% OFF</span> coupon today subscibers)</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-7">
                            <div class="subscribe_content">
                                <p><strong>Join 226.000+ subscribers</strong> and get a new discount coupon on every Monday.</p>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-12">
                            <div class="subscribe_form">
                                <form class="mc-form footer-newsletter" action="{{ route('user-subscribe') }}" method="POST">
                                    @csrf
                                    <input name="email" id="mc-email" type="email" autocomplete="off" placeholder="Your email address..." />
                                    <button type="submit">Subscribe</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--newsletter area end-->
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="widgets_container widget_menu">
                            <h3>Customer Service</h3>
                            <div class="footer_menu">
                                <ul>
                                    <li>
                                        <a href="{{ route('terms-condition') }}">
                                            Terms & Condition
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('privacy-policy') }}">
                                            Privacy Policy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('return-policy') }}">
                                            Return Policy
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="widgets_container widget_menu">
                            <h3>About Us</h3>
                            <div class="footer_menu">
                                <ul>
                                    <li>
                                        <a href="{{ route('about-us') }}">
                                            About Us
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('contact-us') }}">
                                            Contact Us
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('delivery-information') }}">
                                            Delivery Informaiton
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="widgets_container widget_menu">
                            <h3>My Account</h3>
                            <div class="footer_menu">
                                <ul>
                                    <li>
                                        <a href="{{ route('user.dashboard') }}">
                                            My Account
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('carts') }}">
                                            Shopping Cart
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('wishlists') }}">
                                            Wishlists
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3">
                        <div class="copyright_area">
                            <p>&copy; 2021 <a href="{{ route('home') }}" class="text-uppercase">{{ $contact->company_name }}</a></p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="footer_social">
                                <ul>
                                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a class="instagram" href="#"><i class="fa fa-instagram"></i></a></li>
                                    <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                                </ul>
                            </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="footer_payment text-right">
                            <img src="{{ asset('assets/user/img/icon/payment.png') }}" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--footer area end-->

    <!-- modal area start-->
    {{-- <div class="modal fade" id="modal_box" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="modal_body">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12">
                                <div class="modal_tab">
                                    <div class="tab-content product-details-large">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig2.jpg" alt=""></a>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab2" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig3.jpg" alt=""></a>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab3" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig4.jpg" alt=""></a>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab4" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig5.jpg" alt=""></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal_tab_button">
                                        <ul class="nav product_navactive owl-carousel" role="tablist">
                                            <li>
                                                <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="assets/img/product/product1.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="assets/img/product/product6.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="assets/img/product/product9.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                <a class="nav-link" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><img src="assets/img/product/product14.jpg" alt=""></a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-12">
                                <div class="modal_right">
                                    <div class="modal_title mb-10">
                                        <h2>Sit voluptatem rhoncus sem lectus</h2>
                                    </div>
                                    <div class="modal_price mb-10">
                                        <span class="new_price">$64.99</span>
                                        <span class="old_price" >$78.99</span>
                                    </div>
                                    <div class="modal_description mb-15">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam, reiciendis maiores quidem aperiam, rerum vel recusandae </p>
                                    </div>
                                    <div class="variants_selects">
                                        <div class="variants_size">
                                            <h2>size</h2>
                                            <select class="select_option">
                                                <option selected value="1">s</option>
                                                <option value="1">m</option>
                                                <option value="1">l</option>
                                                <option value="1">xl</option>
                                                <option value="1">xxl</option>
                                            </select>
                                        </div>
                                        <div class="variants_color">
                                            <h2>color</h2>
                                            <select class="select_option">
                                                <option selected value="1">purple</option>
                                                <option value="1">violet</option>
                                                <option value="1">black</option>
                                                <option value="1">pink</option>
                                                <option value="1">orange</option>
                                            </select>
                                        </div>
                                        <div class="modal_add_to_cart">
                                            <form action="#">
                                                <input min="1" max="100" step="2" value="1" type="number">
                                                <button type="submit">add to cart</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal_social">
                                        <h2>Share this product</h2>
                                        <ul>
                                            <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                            <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}
    <!-- modal area end-->

    <!-- Plugins JS -->
    {{-- <script src="{{ asset('assets/user/js/plugins.js') }}"></script> --}}
    <!-- Main JS -->
    <script src="{{ asset('assets/user/js/main.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    {!! Toastr::message() !!}
    <script>
        @if($errors->any())
        @foreach($errors->all() as $error)
              toastr.error('{{ $error }}','Error',{
                  closeButton:true,
                  progressBar:true,
               });
        @endforeach
    @endif
    </script>

    <script type="text/javascript">

        function searchProduct() {
            let category_id = $('#category_id').val();
            let product_name = $('#product_name').val();
            let data = {
                category_id : category_id,
                product_name : product_name
            };
            // && (product_name.length) >= 2
            if((product_name.trim() != "")) {
                $.ajax({
                    method : 'GET',
                    url: "{{ route('search-product') }}",
                    data: data,
                    dataType: 'JSON',
                    success: function(response){
                        //console.log(response.data);
                        let products = response.data;
                        if(products.length){
                            $('#searchResult').show();
                            $('.autocomplete-item').html(products);
                        } else {
                            $('#searchResult').hide();
                        }
                    }
                });
            } else{
                $('#searchResult').hide();
            }

        }

        function addToCartSingle(product_id){
            $.ajax({
            method : 'GET',
            url : "{{ route('add-to-cart') }}",
            data : {product_id: product_id},
           // dataType : 'JSON',
            success : function(response){
                if(response.type == 'success'){
                    Swal.fire({
                      position: 'top-end',
                      icon: 'success',
                      text: response.message,
                      showConfirmButton: true,
                      timer: 5000
                    })
                    //toastr.success(response.message, response.type);
                    //toastr.success(response.message);
                    $(".header_configure_area").load(location.href + " .header_configure_area");
                } else if(response.type == 'danger') {
                    Swal.fire({
                      position: 'top-end',
                      icon: 'info',
                      text: response.message,
                      showConfirmButton: true,
                      timer: 5000
                    })
                }

            }
            });
        }

        function addToFavorite(product_id){
          $.ajax({
            method : 'GET',
            url : "{{ route('add-to-favorite') }}",
            data : {product_id:product_id},
            dataType : 'JSON',
            success : function(response){
                if(response.type == 'success'){
                    $(".header_configure_area").load(location.href + " .header_configure_area");
                    Swal.fire({
                        text: response.message,
                        icon: "success",
                        button: "Ok",
                    });
                } else if(response.type == 'error') {
                    $(".header_configure_area").load(location.href + " .header_configure_area");
                    Swal.fire({
                        text: response.message,
                        icon: "error",
                        button: "Ok",
                    })

                }
            }
          });
        }
    </script>
    @stack('js')
</body>

</html>
