<!--product area start-->
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
                            <a class="active" data-toggle="tab" href="javascript:void(0)" role="tab" aria-controls="Computer3" aria-selected="true" onclick="getProduct({{ $category->id }})">
                                {{ $category->name }}
                            </a>
                            
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-pane fade show active" id="" role="tabpanel">
            <div class="product_carousel product_style product_column4 owl-carousel" id="new_arrivals_product">
                
            </div>
        </div>
    </div>
</div>
<!--product area end-->

<script>
    function getProduct(category_id){
        $.ajax({
        type: 'GET',
        url: '/product/'+category_id,
        success: function (data) {
            $('#new_arrivals_product').html(data);
        },
        error: function() { 
             console.log(data);
        }
    });
    }
</script>