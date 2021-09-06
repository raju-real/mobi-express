@extends('user.layouts.app')
@section('title','Shopping Cart')
@push('css')

@endpush

@section('content')
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="{{ route('home') }}">home</a></li>
                        <li>Shopping Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--shopping cart area start -->
<div class="cart_page_bg">
    <div class="container">
        <div class="shopping_cart_area">
            <form action="#">
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            @if(sizeof($carts) > 0)
                            <div class="cart_page table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product_thumb">Image</th>
                                            <th class="product_name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product_quantity">Quantity</th>
                                            <th class="product_total">Total</th>
                                            <th class="product_remove">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($carts as $cart)
                                        @if(isset($cart->product))
                                        <tr>
                                            <td class="product_thumb">
                                                <a href="{{ route('product-details',$cart->product->slug) }}"><img src="{{ $cart->product->image }}" alt=""></a>
                                            </td>
                                            <td class="product_name"><a href="{{ route('product-details',$cart->product->slug) }}">
                                                {{ $cart->product->name }}
                                            </a></td>
                                            <td class="product-price">{{ $cart->order_price }}</td>
                                            <td class="product_quantity">
                                                <button onclick="decrement({{ $cart->id }})" 
                                                    type="button" 
                                                    class="btn btn-danger btn-sm">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                                <button class="btn btn-info btn-sm">
                                                    {{ $cart->quantity }}
                                                </button>
                                                <button onclick="increment({{ $cart->id }})" 
                                                    type="button" class="btn btn-primary btn-sm">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </td>
                                            <td class="product_total">{{ $cart->total_price }}</td>
                                            <td class="product_remove"><a href="javascript:void(0)" onclick="removeCartItem({{ $cart->id }})"><i class="fa fa-trash-o"></i></a></td>
                                        </tr>
                                        @endif
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            @else 
                                <div class="alert alert-danger text-center" role="alert">
                                    <strong>Your Cart Is Empty :)</strong>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
                <!--coupon code area start-->
                <div class="coupon_area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            {{-- <div class="coupon_code left">
                                <h3>Coupon</h3>
                                <div class="coupon_inner">
                                    <p>Enter your coupon code if you have one.</p>
                                    <input placeholder="Coupon code" type="text">
                                    <button type="submit">Apply coupon</button>
                                </div>
                            </div> --}}
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="coupon_code right">
                                <h3>Cart Totals</h3>
                                <div class="coupon_inner">
                                    <div class="cart_subtotal">
                                        <p>Subtotal</p>
                                        <p class="cart_amount">
                                            {{ $carts->sum('total_price') }} BDT
                                        </p>
                                    </div>
                                    <div class="checkout_btn">
                                        <a href="{{ route('checkout') }}">Proceed to Checkout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--coupon code area end-->
            </form>
        </div>
    </div>
</div>
<!--shopping cart area end -->
@endsection

@push('js')
<script type="text/javascript">
  $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

function getId(){
      var cart_id = $('#cart_id').val();
      return { cart_id : cart_id }
  }

  function increment(id){
    $.ajax({
    method : 'GET',
    url : "{{ url('increment-cart-product') }}"+'/'+ id,
    success : function(response){
        if(response.type == 'success'){
        $(".shopping_cart_area").load(location.href + " .shopping_cart_area");
        } else if(response.type == 'danger') {
        $(".shopping_cart_area").load(location.href + " .shopping_cart_area");
        }
    }
    });
  }

  function decrement(id){
    $.ajax({
    method : 'GET',
    url : "{{ url('decrement-cart-product') }}"+'/'+ id,
    success : function(response){
        if(response.type == 'warning'){
        $(".shopping_cart_area").load(location.href + " .shopping_cart_area");
        $(".header_configure_area").load(location.href + " .header_configure_area");
        } else if(response.type == 'danger') {
        $(".shopping_cart_area").load(location.href + " .shopping_cart_area");
        $(".header_configure_area").load(location.href + " .header_configure_area");
        }
    }
    });
  }

  function removeCartItem(cart_id){
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
            url : "{{ route('remove-cart-product') }}",
            data : {cart_id: cart_id},
            success : function(response){
                if(response.type == 'danger') {
                    $(".shopping_cart_area").load(location.href + " .shopping_cart_area");
                    $(".header_configure_area").load(location.href + " .header_configure_area");
                }
            }
            });
        }
        })

    }
</script>
@endpush
