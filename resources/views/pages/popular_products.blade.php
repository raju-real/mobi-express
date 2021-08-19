@foreach($popularProducts as $p_p)
<article class="recent_product_list">
    <figure>
        <div class="product_thumb">
            <a class="primary_img" href="{{ route('product-details',$p_p->product->slug) }}"><img src="{{ $p_p->product->image }}" alt=""></a>
            <a class="secondary_img" href="{{ route('product-details',['slug'=>$p_p->product->slug]) }}">
                <img src="{{ asset($p_p->product->image) }}" alt="">
            </a>
        </div>
        <div class="product_content">
            <h4><a href="{{ route('product-details',$p_p->product->slug) }}">
                {{ $p_p->product->name }}
            </a></h4>
            <div class="product_rating">
                <ul>
                    @for($i=1;$i<=$p_p->rating;$i++)
                    <li><i class="ion-android-star" style="font-size: 20px;color: orange;"></i></li>
                    @endfor
                </ul>
            </div>
            <div class="price_box">
                @if($p_p->product->discount_price > 0)
                    <span class="old_price">
                        {{ $p_p->product->unit_price }}
                    </span>
                    <span class="current_price">
                        {{ $p_p->product->discount_price }} BDT
                    </span>
                @else
                    <span class="current_price">
                        {{ $p_p->product->unit_price }} BDT
                    </span>
                @endif
            </div>
        </div>
    </figure>
</article>
@endforeach