<div class="product_area">
    <div class="row">
        <div class="col-12">
            <div class="product_header row">
                <div class="section_title col-xl-auto col-12">
                    <h2>New Arrivals</h2>

                </div>
                <div class="product_tab_btn col-xl-auto col-12 mt-md-3 mt-xl-0">
                    <ul class="nav" role="tablist" id="nav-tab3">
                        @foreach($categories as $category)
                        <li>
                            <a class="active" type="button" wire:click="findProducts">
                                {{ $category->name }}
                            </a>
                        </li>
                        @endforeach
                        <button wire:click="findProducts">check</button>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-pane fade show active" id="Computer3" role="tabpanel">
            <div class="product_carousel product_style product_column4 owl-carousel">
                @foreach($products as $product)
<article class="single_product">
    <figure>
        <div class="product_thumb">
            <a class="primary_img" href="{{ route('product-details',$product->slug) }}"><img src="{{ $product->image }}" alt=""></a>
            <a class="secondary_img" href="{{ route('product-details',['slug'=>$product->slug]) }}">
                <img src="{{ asset($product->image) }}" alt="">
            </a>
            {{-- <div class="label_product">
                <span class="label_sale">Sale</span>
            </div> --}}
            <div class="action_links">
                <ul>
                    <li class="wishlist">
                        <a href="javascript:void(0)" onclick="addToFavorite({{ $product->id }})" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="product_content">
            <div class="product_content_inner">
                <h4 class="product_name"><a href="{{ route('product-details',$product->slug) }}">
                    {{ $product['name'] }}
                </a></h4>
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
    </figure>
</article>
@endforeach
            </div>
        </div>
    </div>
</div>