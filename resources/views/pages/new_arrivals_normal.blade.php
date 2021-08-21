@foreach($newArrivals as $n_a)
<article class="single_product">
    <figure>
        <div class="product_thumb">
            <a class="primary_img" href="{{ route('product-details',$n_a->product->slug) }}"><img src="{{ $n_a->product->image }}" alt=""></a>
            <a class="secondary_img" href="{{ route('product-details',['slug'=>$n_a->product->slug]) }}">
                <img src="{{ asset($n_a->product->image) }}" alt="">
            </a>
            {{-- <div class="label_product">
                <span class="label_sale">Sale</span>
            </div> --}}
            <div class="action_links">
                <ul>
                    <li class="wishlist">
                        <a href="javascript:void(0)" onclick="addToFavorite({{ $n_a->product->id }})" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="product_content">
            <div class="product_content_inner">
                <h4 class="product_name"><a href="{{ route('product-details',$n_a->product->slug) }}">
                    {{ $n_a->product->name }}
                </a></h4>
                <div class="price_box">
                    @if($n_a->product->discount_price > 0)
                    <span class="old_price">
                        {{ $n_a->product->unit_price }}
                    </span>
                    <span class="current_price">
                        {{ $n_a->product->discount_price }} BDT
                    </span>
                    @else
                    <span class="current_price">
                        {{ $n_a->product->unit_price }} BDT
                    </span>
                    @endif
                </div>
            </div>
            <div class="add_to_cart">
                <a href="javascript:void(0)" onclick="addToCartSingle({{ $n_a->product->id }})" title="Add to cart">Add to cart</a>
            </div>

        </div>
    </figure>
</article>
@endforeach

   