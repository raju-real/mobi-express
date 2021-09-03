@extends('user.layouts.app')
@section('title','Checkout')
@push('css')
<style type="text/css">
    .red{
        color: red;
    }
</style>
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
                        <li>Checkout</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--Checkout page section-->
<div class="checkout_page_bg" style="padding-top: 0px;">
    <div class="container">
        <div class="Checkout_section">
            <div class="row">
                <div class="col-12">
                    <div class="user-actions">
                        @if(Session::has('coupon_message'))
                        <p class="alert alert-info mt-2">
                            {{ Session::get('coupon_message') }}
                        </p>
                        @endif
                        @if(($order_price->coupon_code == null) AND ($order_price->coupon_apply == true) AND($order_price->voucher_apply == false))
                        <h3>
                            <i class="fa fa-gift" aria-hidden="true"></i>
                             Do you have any coupon ?

                            <a class="Returning" href="#checkout_coupon" data-bs-toggle="collapse"  aria-expanded="true">Click here to enter your code</a>
                        </h3>
                         <div id="checkout_coupon" class="collapse" data-parent="#accordion">
                            <div class="checkout_info coupon_info">
                                <form action="{{ route('checkout') }}" method="POST">
                                    @csrf
                                    <input placeholder="Coupon code" type="text" name="coupon_code">
                                    <button type="submit">Apply coupon</button>
                                </form>
                            </div>
                        </div>
                        @endif
                    </div>
               </div>
            </div>
            <div class="checkout_form">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="checkout_form_left">
                            <form action="{{ route('submit-order') }}" method="POST" id="order-form">
                                @csrf
                                <h3>Billing Details</h3>
                                <div class="row">

                                    <div class="col-lg-12 mb-20">
                                        <label>Full Name <span class="red">*</span></label>
                                        <input name="name" id="name" type="text">
                                    </div>

                                    <div class="col-12 mb-20">
                                        <label>Mobile<span class="red">*</span></label>
                                        <input name="mobile" id="mobile" type="number">
                                    </div>
                                    <div class="col-12 mb-20">
                                        <label>Email</label>
                                        <input name="email" id="email" type="text">
                                    </div>
                                    {{-- <div class="col-12 mb-20">
                                        <label>District<span class="red">*</span></label>
                                        <input name="district" id="district" type="text">
                                    </div> --}}
                                    @php
                                        $districts = DB::table('districts')
                                            ->get();
                                    @endphp
                                    <div class="col-12 mb-20">
                                        <label>District<span class="red">*</span></label>
                                        <select name="district_id" id="district" class="form-control">
                                        <option value="">
                                            Select District
                                        </option>
                                        @foreach($districts as $district)
                                        <option value="{{ $district->id }}">
                                            {{ $district->name }}
                                        </option>
                                        @endforeach
                                        </select>
                                    </div>

                                    <div class="col-12 mb-20">
                                        <label>City/ Town<span class="red">*</span></label>
                                        <input name="city_town" id="city_town" type="text">
                                    </div>

                                    <div class="col-12">
                                        <label>
                                            Address
                                            <span class="red">*</span>
                                        </label>
                                        <textarea name="address" id="address" class="form-control"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label>Order Note</label>
                                        <textarea name="note" id="note" class="form-control"></textarea>
                                    </div>
                                </div>
                        </div>
                    </div>


                    <div class="col-lg-6 col-md-6">
                        <div class="checkout_form_right">
                                <h3>Your order</h3>
                                <div class="order_table table-responsive" >
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: left;">
                                            @foreach($carts as $cart)
                                            <tr>
                                                <td style="text-align: left;">
                                                    {{ $cart->product->name }}
                                                    <strong> ×
                                                        {{ $cart->quantity }}
                                                    </strong>
                                                </td>
                                                <td>
                                                    {{ $cart->total_price }}
                                                    <i class="fb-taka"></i>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th style="text-align: left;"> Subtotal</th>
                                                <td>
                                                    <strong>
                                                    {{ $order_price->total_price }}
                                                    <i class="fb-taka"></i>
                                                    </strong>
                                                </td>
                                            </tr>
                                            {{-- @if($order_price->product_discount_price > 0)
                                            <tr>
                                                <th style="text-align: left;"> Discount</th>
                                                <td>
                                                    <strong>
                                                        <i class="fa fa-minus"></i>
                                                    {{ $order_price->product_discount_price }}
                                                    <i class="fb-taka"></i>
                                                    </strong>
                                                </td>
                                            </tr>
                                            @endif --}}
                                            <tr>
                                                <th style="text-align: left;">
                                                    Delivery Charge
                                                </th>
                                                <td>
                                                    <strong>
                                                        {{ $order_price->delivery_charge }}
                                                        <i class="fb-taka"></i>
                                                    </strong>
                                                </td>
                                            </tr>
                                            @if($order_price->coupon_code !=null)
                                            <tr>
                                                <th style="text-align: left;">
                                                    Coupon Discount
                                                    <a href="javascript:void(0)" style="color: red;text-decoration: underline;" onclick="document.getElementById('remove-coupon').submit()">
                                                        Remove Coupon
                                                    </a>
                                                </th>
                                                <td>
                                                    <strong>
                                                        {{ $order_price->coupon_discount }}
                                                        <i class="fb-taka"></i>
                                                    </strong>
                                                </td>
                                            </tr>
                                            @endif
                                            <tr class="order_total">
                                                <th style="text-align: left;">Total Price</th>
                                                <td><strong>
                                                    {{ $order_price->order_price }}
                                                    <i class="fb-taka"></i>
                                                </strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="payment_method">
                                    <div class="panel-default">
                                        <input id="cash-on-delivery"  name="payment_method" type="radio" value="1" checked />
                                        <label for="cash-on-delivery">Cash on delivery</label>
                                        @if($order_price->voucher_apply == true)
                                        <br>
                                        <input id="evaly-voucher" name="payment_method" type="radio" value="2"  />
                                        <label for="evaly-voucher">
                                            Evaly Voucher
                                        </label>
                                        @endif
                                        <br>
                                        <input id="online-payment" name="payment_method" type="radio" value="3"  />
                                        <label for="online-payment">
                                            Online Payment
                                        </label>
                                    </div>
                            </form>
                                    <div class="order_button">
                                        <button type="button" onclick="document.getElementById('order-form').submit()">
                                            Submit Order
                                        </button>
                                    </div>
                                </div>

                                {{-- Coupon Remove From --}}
                                <form id="remove-coupon" action="{{ route('remove-coupon') }}" method="POST" style="display:none;">
                                    @csrf
                                    @method('DELETE')
                                    <input type="hidden" name="coupon_code" value="{{ $order_price->coupon_code }}">
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Checkout page section end-->
@endsection

@push('js')
<script>

    function getDistrict() {
        $('#district').find('option').remove().end().append('<option value="">Select District</option>');
        var id = document.getElementById('division').value;
        axios.get(`/api/districts/${id}`)
            .then(function (response) {
                var list = response.data.data;
                var select = document.getElementById("district");
                for (i = 0; i < list.length; i++) {
                    var el = document.createElement("option");
                    var districts = list[i];
                    var districtName = districts.english_name;
                    var districtId = districts.id;
                    el.textContent = districtName;
                    el.value = districtId;
                    select.appendChild(el);
                }
            });
    }
    function getUpazila() {
        $('#upazila').find('option').remove().end().append('<option value="">Select Thana</option>');
        var id = document.getElementById('district').value;
        axios.get(`/api/upazilas/${id}`)
            .then(function (response) {
                var list = response.data.data;
                var select = document.getElementById("upazila");
                for (i = 0; i < list.length; i++) {
                    var el = document.createElement("option");
                    var thanas = list[i];
                    var thanaName = thanas.english_name;
                    var thanaId = thanas.id;
                    el.textContent = thanaName;
                    el.value = thanaId;
                    select.appendChild(el);
                }
            });
    }
</script>
@endpush
