@foreach($featuredProducts as $product)
    <article class="single_product">
        <figure>
            @php
                $firstImage = DB::table('product_images')
                    ->where('product_id',$product['id'])
                    ->whereNotNull('image')
                    ->latest()
                    ->first()->image;
                $secondImage = DB::table('product_images')
                    ->where('product_id',$product['id'])
                    ->whereNotNull('image')
                    ->orderBy('updated_at','DESC')
                    ->first()->image;    
            @endphp
            <div class="product_thumb">
                <a class="primary_img" href="{{ route('product-details',$product->slug) }}"><img src="{{ $firstImage }}" alt=""></a>
                <a class="secondary_img" href="{{ route('product-details',['slug'=>$product->slug]) }}">
                    <img src="{{ asset($secondImage) }}" alt="">
                </a>
                {{-- <div class="label_product">
                    <span class="label_sale">Sale</span>
                </div> --}}
                {{-- <div class="action_links">
                    <ul>
                        <li class="wishlist">
                            <a href="wishlist.html" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true" data-tippy="Add to Wishlist"><i class="ion-android-favorite-outline"></i></a>
                        </li>
                        <li class="compare"><a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-tippy="Add to Compare"><i class="ion-ios-settings-strong"></i></a></li>
                        <li class="quick_button">
                            <a href="#" data-tippy-placement="top" data-tippy-arrow="true" data-tippy-inertia="true"  data-bs-toggle="modal" data-bs-target="#product-preview-{{ $product->id }}" data-tippy="quick view"><i class="ion-ios-search-strong"></i>
                            </a>
                        </li>
                    </ul>
                </div> --}}
            </div>
            <div class="product_content">
                <div class="product_content_inner">
                    <h4 class="product_name"><a href="product-details.html">
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

   