@extends('user.layouts.app')
@section('title','Home')

@push('css')

@endpush

@section('content')
<!--slider area start-->
<section class="slider_section slider_s_three mb-40 mt-20">
    <div class="slider_area slider3_carousel owl-carousel">
        @foreach($promotions as $promotion)
        <div class="single_slider d-flex align-items-center" data-bgimg="{{ asset($promotion->image) }}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="slider_content slider_c_three color_white">
                            {{-- <h1 style="color: red;font-weight: bold;">{{ $promotion->name }}</h1> --}}
                            @if(sizeof($promotion->products) > 0)
                                <a class="button"
                                href="{{ route('campaign-products',$promotion->slug) }}">Shop Now</a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</section>
<!--slider area end-->


<!--shipping area start-->
<div class="shipping_area mb-10 d-none d-md-block">
    <div class="container">
        <div class="shipping_inner">
            <div class="single_shipping">
                {{-- <div class="shipping_icone">
                    <img src="assets/user/img/about/shipping1.png" alt="">
                </div> --}}
                <div class="shipping_content">
                    <img src="{{ asset('assets/user/images/1.jpg') }}" alt="" class="img-responsive">
                </div>
            </div>
            <div class="single_shipping">
                <img src="{{ asset('assets/user/images/2.jpg') }}" alt="" class="img-responsive">
            </div>
            <div class="single_shipping">
                <img src="{{ asset('assets/user/images/3.jpg') }}" alt="" class="img-responsive">
            </div>
            <div class="single_shipping">
                <img src="{{ asset('assets/user/images/4.jpg') }}" alt="" class="img-responsive">
            </div>
            <div class="single_shipping">
                <img src="{{ asset('assets/user/images/5.jpg') }}" alt="" class="img-responsive">
            </div>
        </div>
    </div>
</div>
<!--shipping area end-->

<!--home section bg area start-->
    <div class="home_section_bg" style="padding: 30px 0 132px;">
        <div class="container">
            <div class="row">

                <div class="col-xl-9 col-lg-8 col-12 order-lg-2">
                    <!--product area start-->
                    <div class="product_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="product_header row">
                                    <div class="section_title">
                                        <h2>Featured Products</h2>
                                        <a href="{{ route('featured-products') }}" class="btn btn-warning btn-sm" style="float: right;">View All</a>
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
                                    <div class="section_title">
                                        <h2>Best Selling Products</h2>
                                        <a href="{{ route('best-selling-products') }}" class="btn btn-warning btn-sm" style="float: right;">View All</a>
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

                    <!--new arrivals normal start-->
                    <div class="product_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="product_header row">
                                     <div class="section_title">
                                        <h2>New Arrivals</h2>
                                        <a href="{{ route('new-arrivals') }}" class="btn btn-warning btn-sm" style="float: right;">View All</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="Computer3" role="tabpanel">
                                <div class="product_carousel product_style product_column4 owl-carousel">
                                    @include('pages.new_arrivals_normal')
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--new arrivals normal end-->

                    {{-- New Arrivals Ajax load --}}
                        {{-- @include('pages.new_arrivals') --}}
                    {{-- New Arrivals Ajax load --}}

                    <!--banner area start-->
                    {{-- <div class="banner_area mb-55">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <figure class="single_banner">
                                    <div class="banner_thumb">
                                        <a href="shop.html"><img src="{{ asset('assets/user/img/bg/banner4.jpg') }}" alt=""></a>
                                    </div>
                                </figure>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <figure class="single_banner">
                                    <div class="banner_thumb">
                                        <a href="shop.html"><img src="{{ asset('assets/user/img/bg/banner5.jpg') }}" alt=""></a>
                                    </div>
                                </figure>
                            </div>
                        </div>
                    </div> --}}
                    <!--banner area end-->
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
