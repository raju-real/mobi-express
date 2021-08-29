<div class="tab-pane fade show active" id="" role="tabpanel">
    <div class="product_carousel product_style product_column4 owl-carousel">
        @foreach($products as $product)
            <article class="single_product">
                <figure>
                    <div class="product_thumb">
                        <a class="primary_img" href="{{ route('product-details',$product->slug) }}"><img src="{{ $product->image }}" alt=""></a>
                        <a class="secondary_img" href="{{ route('product-details',['slug'=>$product->slug]) }}">
                            <img src="{{ asset($product->image) }}" alt="">
                        </a>
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
                            <a href="javascript:void(0)" onclick="addToCartSingle({{ $product->id }})" title="Add to cart">Add to cart</a>
                        </div>
                    </div>
                </figure>
            </article>
        @endforeach
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){
      $('.owl-carousel').owlCarousel({
          loop:true,
            margin:10,
            responsiveClass:true,
            navText : ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
            responsive:{
                0:{
                    items:1,
                    nav:true
                },
                600:{
                    items:3,
                    nav:false
                },
                1000:{
                    items:4,
                    nav:true,
                    loop:false
                }
            }
      })
    });
</script>