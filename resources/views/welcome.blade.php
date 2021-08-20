@extends('user.layouts.app')
@section('title','Home')

@push('css')

@endpush

@section('content')
<!--slider area start-->
<section class="slider_section slider_s_three mb-60 mt-20">
    <div class="slider_area slider3_carousel owl-carousel">
        <div class="single_slider d-flex align-items-center" data-bgimg="{{ asset('assets/user/img/slider/slider9.jpg') }}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="slider_content slider_c_three color_white">
                            <h3>new collection</h3>
                            <h1>new Arrivals <br> cellphone new model 2019</h1>
                                <p>discount <span> -30% off</span> this week</p>
                                <a class="button" href="shop.html">DISCOVER NOW</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!--slider area end-->


<!--shipping area start-->
<div class="shipping_area mb-60">
    <div class="container">
        <div class="shipping_inner">
            <div class="single_shipping">
                <div class="shipping_icone">
                    <img src="assets/img/about/shipping1.png" alt="">
                </div>
                <div class="shipping_content">
                    <h4>Free Delivery</h4>
                    <p>For all oders over $120</p>
                </div>
            </div>
            <div class="single_shipping">
                <div class="shipping_icone">
                    <img src="assets/img/about/shipping2.png" alt="">
                </div>
                <div class="shipping_content">
                    <h4>Free Delivery</h4>
                    <p>For all oders over $120</p>
                </div>
            </div>
            <div class="single_shipping">
                <div class="shipping_icone">
                    <img src="assets/img/about/shipping3.png" alt="">
                </div>
                <div class="shipping_content">
                    <h4>Free Delivery</h4>
                    <p>For all oders over $120</p>
                </div>
            </div>
            <div class="single_shipping">
                <div class="shipping_icone">
                    <img src="assets/img/about/shipping4.png" alt="">
                </div>
                <div class="shipping_content">
                    <h4>Free Delivery</h4>
                    <p>For all oders over $120</p>
                </div>
            </div>
            <div class="single_shipping">
                <div class="shipping_icone">
                    <img src="assets/img/about/shipping5.png" alt="">
                </div>
                <div class="shipping_content">
                    <h4>Free Delivery</h4>
                    <p>For all oders over $120</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--shipping area end-->

<!--home section bg area start-->
    <div class="home_section_bg">
        <div class="container">
            <div class="row">

                <div class="col-xl-9 col-lg-8 col-12 order-lg-2">
                    <!--product area start-->
                    <div class="product_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="product_header row">
                                    <div class="section_title col-xl-auto col-12">
                                        <h2>Featured Products</h2>
                                    </div>
                                    <div class="section_title col-xl-auto col-12">
                                        <a href="{{ route('featured-products') }}" class="btn btn-sm btn-warning">View All</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="Computer3" role="tabpanel">
                                <div class="product_carousel product_style product_column4 owl-carousel">
                                    @include('pages.featured_products')
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--product area end-->

                    <!--product area start-->
                    <div class="product_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="product_header row">
                                    <div class="section_title col-xl-auto col-12">
                                        <h2>Best Selling Products</h2>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="Computer3" role="tabpanel">
                                <div class="product_carousel product_style product_column4 owl-carousel">
                                    @include('pages.best_selling_product')
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--product area end-->

                </div>

                <div class="col-xl-3 col-lg-4 col-12">
                    <!--sidebar widget start-->
                    <aside class="sidebar_widget mb-5">
                        @if(sizeof($offers) > 0)
                            @include('pages.special_offer')
                        @endif
                        <div class="widget_list widget_categories">
                            <h3>Product categories</h3>
                            <div class="categories_sidebar_slider owl-carousel">
                                <div class="categories_sidebar_slide">
                                    @foreach($categories as $category)
                                    <div class="single_categories_product">
                                        <div class="categories_product_content">
                                            <h4><a href="{{ route('category-products',$category->slug) }}">
                                                {{ $category->name }}
                                            </a></h4>
                                            <p>{{ $category->products->count() }} Products</p>
                                        </div>
                                        @if($category->image != null)
                                        <div class="categories_product_thumb">
                                            <a href="{{ route('category-products',$category->slug) }}"><img src="{{ asset($category->image) }}" alt="" style="height: 55px;width: 77px;"></a>
                                        </div>
                                        @endif
                                    </div>
                                    @endforeach
                                </div>
                                
                            </div>
                        </div>
                        
                        @if(sizeof($popularProducts) > 0)
                        <div class="widget_list widget_products">
                            <h3>Popular Products</h3>
                            <div class="recent_product_container">
                                @include('pages.popular_products')
                            </div>
                        </div>
                        @endif
                    </aside>
                    <!--sidebar widget end-->
                </div>

            </div>
        </div>

        <!--product area start-->
        <div class="small_product_area small_product_style2">
            <div class="container">
                <div class="row">
                    @include('pages.front_categories')
                </div>
            </div>
        </div>
        <!--product area end-->
    </div>
    <!--home section bg area end-->
@endsection

@push('js')

@endpush