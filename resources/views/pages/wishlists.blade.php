@extends('user.layouts.app')
@section('title','Wishlists')

@section('content')
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="{{ route('home') }}">home</a></li>
                        <li>Wishlist</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--wishlist area start -->
<div class="wishlist_page_bg">
    <div class="container">
        <div class="wishlist_area">
            <div class="wishlist_inner">
                <div class="row">
                    <div class="col-12">
                    	@if(sizeof($wishlists) > 0)
                        <div class="table_desc wishlist">
                            <div class="cart_page table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product_thumb">Image</th>
                                            <th class="product_name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product_quantity">Stock Status</th>
                                            <th class="product_total">Add To Cart</th>
                                            <th class="product_remove">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	@foreach($wishlists as $list)
                                        @if(isset($list->product))
                                        <tr>
                                            <td class="product_thumb">
						                        <a href="{{ route('product-details',$list->product->image) }}"><img src="{{ $list->product->image }}" alt=""></a>
						                    </td>
                                            <td class="product_name">
                                            	<a href="{{ route('product-details',$list->product->slug) }}">
						                        {{ $list->product->name }}
						                    	</a>
						                	</td>
                                            <td class="product-price">
                                            	<i class="fb-taka"></i>
                                            	{{ $list->product->discount_price >0 ? $list->product->discount_price : $list->product->unit_price }}
                                            	
                                            </td>
                                            <td class="product_quantity">
                                            	{{ $list->product->quantity > 0 ? 'In Stock' : 'Out Of Stock' }}
                                            </td>
                                            <td class="product_total">
                                            	@if($list->product->quantity > 0)
                                            	<a href="javascript:void(0)" onclick="addToCartSingle({{ $list->product->id }})">
                                            		Add To Cart
                                            	</a>
                                            	@else
                                            		<span class="btn btn-danger btn-sm">Out Of Stock</span>
                                            	@endif
                                            </td>
                                            <td class="product_remove">
                                            	<a href="javascript:void(0)" onclick="removeFavoriteItem({{ $list->id }})">X</a>
                                            </td>
                                        </tr>
                                        @endif
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        @else 
                        	<div class="alert alert-danger text-center" role="alert">
                        		<strong>Your Wishlist Is Empty :)</strong>
                        	</div>
                        @endif
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>


<!--wishlist area end -->
@endsection

@push('js')
<script type="text/javascript">
	function removeFavoriteItem(list_id){
        Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
            method : 'GET',
            url : "{{ route('remove-list-product') }}",
            data : {list_id: list_id},
            success : function(response){
                if(response.type == 'danger') {
                	$(".wishlist_area").load(location.href + " .wishlist_area");
                	$(".header_configure_area").load(location.href + " .header_configure_area");
                }
            }
            });
        }
        })

    }
</script>
@endpush