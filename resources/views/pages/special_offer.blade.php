<div class="widget_list widget_products">
    <h3>Special Offer</h3>
    <div class="product_carousel product_style product_sidebar_slider owl-carousel">
        @foreach($offers as $offer)
        <article class="single_product">
            <figure>
                <div class="product_thumb">
                    <a class="primary_img" href="{{ route('product-details',$offer->product->slug) }}">
                        <img src="{{ asset($offer->product->image) }}" alt="">
                    </a>
                    <a class="secondary_img" href="{{ route('product-details',$offer->product->slug) }}">
                        <img src="{{ asset($offer->product->image) }}" alt="">
                    </a>
                   <div class="action_links">
                        <ul>
                            <li class="wishlist">
                                <a href="javascript:void(0)" onclick="addToFavorite({{ $offer->product->id }})" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="product_content">
                    <div class="product_content_inner">
                        <h4 class="product_name">
                            <a href="{{ route('product-details',$offer->product->slug) }}">
                                {{ $offer->product->name }}
                            </a>
                        </h4>
                        <div class="price_box">
                            @if($offer->product->discount_price > 0)
                                <span class="old_price">
                                    {{ $offer->product->unit_price }}
                                </span>
                                <span class="current_price">
                                    {{ $offer->product->discount_price }} BDT
                                </span>
                            @else
                                <span class="current_price">
                                    {{ $offer->product->unit_price }} BDT
                                </span>
                            @endif
                        </div>
                        <div class="countdown_text">
                            <p><span>Hurry Up!</span> Offers ends in: </p>
                            <h2>{{ date('d-m-y', strtotime($offer->end_date)) }}</h2>
                        </div>
                        {{-- <div class="product_timing">
                            <div data-countdown="2021/12/15"></div>
                        </div> --}}
                    </div>
                    <div class="add_to_cart">
                        <a href="javascript:void(0)" onclick="addToCartSingle({{ $offer->product->id }})" title="Add to cart">Add to cart</a>
                    </div>

                </div>
            </figure>
        </article>
        @endforeach
    </div>
</div>