<div class="product_area">
    <div class="row">
        <div class="col-12">
            <div class="product_header row">
                <div class="section_title col-xl-auto col-12">
                    <h2>Featured Products</h2>
                </div>
            </div>
        </div>
    </div>
    @php
        $lists = App\Model\FeaturedProduct::all();
    @endphp
    <div class="tab-content">
        <div class="product_carousel product_style product_column4 owl-carousel">
            @foreach($lists as $list)
            <div class="product_items">
                @if($list->list == 1)
                <article class="single_product">
                    <figure>
                        <div class="product_thumb">
                            <a class="primary_img" href="{{ route('product-details',$list->product->slug) }}">
                                <img src="{{ asset($list->product->image) }}" alt="">
                            </a>
                            <a class="secondary_img" href="{{ route('product-details',$list->product->slug) }}">
                                <img src="{{ asset($list->product->image) }}" alt="">
                            </a>
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
                @endif
                @if($list->list == 2)
                <article class="single_product">
                    <figure>
                        <div class="product_thumb">
                            <a class="primary_img" href="{{ route('product-details',$list->product->slug) }}">
                                <img src="{{ asset($list->product->image) }}" alt="">
                            </a>
                            <a class="secondary_img" href="{{ route('product-details',$list->product->slug) }}">
                                <img src="{{ asset($list->product->image) }}" alt="">
                            </a>
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
                @endif
            </div>
            @endforeach
        </div>
    </div>
</div>