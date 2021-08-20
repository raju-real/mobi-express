@foreach($frontCategories as $front_category)
<div class="col-lg-4">
    <div class="small_product_list">
        <div class="section_title">
            <h2>{{ $front_category->category->name }}</h2>
        </div>
        <div class="product_carousel small_p_container  product_column1 owl-carousel">
            @php
                $categoryProducts = App\Model\FrontCategoryProduct::with('product')
                ->where('front_category_id',$front_category->id)
                ->orderBy('serial','asc')->get();
            @endphp
            
            <div class="product_items">
                @foreach($categoryProducts as $cat_product)
                <figure class="single_product">
                    <div class="product_thumb">
                        <a class="primary_img" href="{{ route('product-details',$cat_product->product->slug) }}"><img src="{{ $cat_product->product->image }}" alt=""></a>
                        <a class="secondary_img" href="{{ route('product-details',['slug'=>$cat_product->product->slug]) }}">
                            <img src="{{ asset($cat_product->product->image) }}" alt="">
                        </a>
                    </div>
                    <div class="product_content">
                        <h4 class="product_name">
                            <a href="{{ route('product-details',$cat_product->product->slug) }}">
                                {{ $cat_product->product->name }}
                            </a>
                        </h4>
                        {{-- <div class="product_rating">
                            <ul>
                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                                <li><a href="#"><i class="ion-android-star-outline"></i></a></li>
                            </ul>
                        </div> --}}
                        <div class="price_box">
                            @if($cat_product->product->discount_price > 0)
                            <span class="old_price">
                                {{ $cat_product->product->unit_price }}
                            </span>
                            <span class="current_price">
                                {{ $cat_product->product->discount_price }} BDT
                            </span>
                            @else
                            <span class="current_price">
                                {{ $cat_product->product->unit_price }} BDT
                            </span>
                            @endif
                        </div>
                        <div class="product_cart_button">
                            <a href="javascript:void(0)" onclick="addToCartSingle({{ $cat_product->product->id }})" title="Add to cart"><i class="fa fa-shopping-bag"></i></a>
                        </div>

                    </div>
                </figure>
                @endforeach
            </div>
            
        </div>
    </div>
</div>
@endforeach