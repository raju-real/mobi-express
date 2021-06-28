<div class="tab-pane fade show active" role="tabpanel">
                            <div class="product_carousel product_style product_column4 owl-carousel">
                                <div class="product_items" id="product_items">
                                   
                                    <article class="single_product">
    <figure>
        <div class="product_thumb">
            <a class="primary_img" href="product-details.html"><img src="{{ asset('assets/user/img/product/product1.jpg') }}" alt=""></a>
            <a class="secondary_img" href="product-details.html"><img src="{{ asset('assets/user/img/product/product2.jpg') }}" alt=""></a>
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
    </div>                               
</div>
</div>


<script>
    function getProduct(category_id){
        $.ajax({
        type: 'GET',
        url: '/product/'+category_id,
        success: function (data) {
            $('#tabcontent').html(data);
            console.log(data);
        },
        error: function() { 
             console.log(data);
        }
    });
    }
</script>
