@extends('user.layouts.app')
@section('title','Checkout')
@push('css')
@push('css')
<style>
    .error{
        border: 1px solid red !important;
    }
    .width{
        width: 30%;
    }
</style>
@endpush
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
                                <h3>Shipping Details</h3>
                                <div class="row">

                                    <div class="col-lg-12 mb-20">
                                        <table class="table table-responsive table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th class="width">Full Name</th>
                                                    <th id="ship_name">
                                                        {{ $shipping->full_name ?? '' }}
                                                        <span style="color: red">
                                                            {{ Session::get('ship_name') ?? '' }}
                                                        </span>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th class="width">Mobile</th>
                                                    <th id="ship_mobile">
                                                        {{ $shipping->mobile ?? '' }}
                                                        <span style="color: red">
                                                            {{ Session::get('ship_mobile') ?? '' }}
                                                        </span>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th class="width">Email</th>
                                                    <th>{{ $shipping->email ?? '' }}</th>
                                                </tr>
                                                <tr>
                                                    <th class="width">District</th>
                                                    <th id="ship_district">
                                                        {{ $shipping->district_name->name ?? '' }}
                                                        <span style="color: red">
                                                            {{ Session::get('ship_district') ?? '' }}
                                                        </span>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th class="width">City/Town</th>
                                                    <th id="ship_city_town">
                                                        {{ $shipping->city_town ?? '' }}
                                                        <span style="color: red">
                                                            {{ Session::get('ship_city_town') ?? '' }}
                                                        </span>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th class="width">Post Code</th>
                                                    <th id="ship_post_code">
                                                        {{ $shipping->post_code ?? '' }}
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th class="width">Address</th>
                                                    <th id="ship_address">
                                                        {{ $shipping->address ?? '' }}
                                                        <span style="color: red">
                                                            {{ Session::get('ship_address') ?? '' }}
                                                        </span>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                        <a href="#"
                                        class="btn btn-info btn-sm pull-right"
                                        data-tippy-placement="top"
                                        data-tippy-arrow="true"
                                        data-tippy-inertia="true"
                                        data-bs-toggle="modal"
                                        data-bs-target="#ship-add-update"
                                        >
                                            Update Shipping Address
                                        </a>
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
                                            <tr class="order_total">
                                                <th style="text-align: left;">
                                                    Delivery Within
                                                </th>
                                                <td>
                                                @if($shipping->delivery_time > 0)
                                                <strong>
                                                    {{ \Carbon\Carbon::today()->addDays($shipping->delivery_time)->format('d-m-y') }}
                                                </strong>
                                                @else
                                                    {{ 'Set Shipping District First' }}
                                                @endif
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <h5 style="color: green;font-weight: bold;">
                                    Delivery Charge: Inside Dhaka 60 <i class="fb-taka"></i>
                                    Outside Dhaka 90 <i class="fb-taka"></i>
                                </h5>
                                <div class="payment_method">
                                    <div class="panel-default">
                                        <input id="cash-on-delivery"
                                        name="payment_method" type="radio" value="1" checked />
                                        <label for="cash-on-delivery">Cash on delivery</label>
                                        {{-- @if($order_price->voucher_apply == true)
                                        <br>
                                        <input id="evaly-voucher" name="payment_method" type="radio" value="2" />
                                        <label for="evaly-voucher">
                                            Evaly Voucher
                                        </label>
                                        @endif
                                        --}}
                                        <br>
                                        <input id="online-payment" name="payment_method" type="radio" value="3"  />
                                        <label for="online-payment">
                                            Online Payment
                                        </label>
                                    </div>
                                    <div class="panel-default" id="agree">
                                        <input type="checkbox" name="agree" class="mt-2" id="agree-box" >
                                        <label for="agree-box">
                                            I agree with the
                                            <a href="{{ route('terms-condition') }}" target="_blank">
                                                <u style="color: blue;">terms and condition</u>
                                            </a>
                                            <span>,</span>
                                            <a href="{{ route('return-policy') }}" target="_blank">
                                                <u style="color: blue;">return policy</u>
                                            </a>
                                            <span>,</span>
                                            <a href="{{ route('refund-policy') }}" target="_blank">
                                                <u style="color: blue;">refund policy</u>
                                            </a>
                                            <span>and</span>
                                            <a href="{{ route('privacy-policy') }}" target="_blank">
                                                <u style="color: blue;">privacy policy</u>
                                            </a>
                                        </label>
                                        <p id="agree-message" style="display: none;color: red;">
                                            Please check to agree with our condition before place order
                                            <br>
                                        </p>
                                    </div>
                                    <div class="order_button">
                                        <button type="button" id="submit-order-button">
                                            Submit Order
                                        </button>
                                    </div>
                            </form>

                                </div>

                                {{-- Coupon Remove From --}}
                                <form id="remove-coupon" action="{{ route('remove-coupon') }}" method="POST" style="display:none;">
                                    @csrf
                                    @method('DELETE')
                                    <input type="hidden" name="coupon_code" value="{{ $order_price->coupon_code }}">
                                </form>

                                {{-- Shipping Address Update --}}
                                <!-- Modal -->
                                <!-- modal area start-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- Shipping Address Update Modal --}}
<div class="modal fade" id="ship-add-update" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            @php
                $districts = App\Model\District::orderBy('name','asc')->get();
            @endphp
            <div class="modal_body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="{{ route('user.update-address',['type'=>'shipping']) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="checkout" value="yes">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="full_name" class="form-control" value="{{ $shipping->full_name ?? Auth::user()->name }}">
                        </div>
                        <div class="form-group mt-3">
                            <label>Mobile</label>
                            <input type="text" name="mobile" class="form-control" value="{{ $shipping->mobile ?? Auth::user()->mobile }}">
                        </div>
                        <div class="form-group mt-3">
                            <label>Email(Optional)</label>
                            <input type="text" name="email" class="form-control" id="s_email" value="{{ $shipping->email ?? Auth::user()->email }}">
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group mt-3">
                                    <label>District</label>
                                    <select name="district" class="form-control">
                                        <option value="{{ $shipping->district_name->id ?? '' }}">{{ $shipping->district_name->name ?? 'Select District' }}</option>
                                        @foreach($districts as $district)
                                            <option value="{{ $district->id }}">
                                                {{ $district->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                    {{-- <input type="text" name="district" class="form-control" id="s_district" value="{{ $shipping->district ?? '' }}"> --}}
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mt-3">
                                    <label>City/Town</label>
                                    <input type="text" name="city_town" class="form-control"
                                    value="{{ $shipping->city_town ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mt-3">
                                    <label>Post Code</label>
                                    <input type="number" name="post_code" class="form-control"
                                    value="{{ $shipping->post_code ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group mt-3">
                                    <label>Address</label>
                                    <textarea name="address" class="form-control">{{ $shipping->address ?? '' }}</textarea>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="btn btn-success pull-right">
                                    Update
                                </button>
                            </div>
                        </div>
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


    $('#submit-order-button').click(function(){
        $.ajax({
            method: 'GET',
            url : "{{ route('user.shipping') }}",
            success: function(response){
                let shipping = response;
                var name = shipping.full_name;
                var mobile = shipping.mobile;
                var district = shipping.district;
                var city_town = shipping.city_town;
                var address = shipping.address;
                let payment_method = $('input[name=payment_method]:checked').val();
                if(name == null){
                    $('#ship_name').text("Set Your Name").css("color","red");
                    return false;
                } else if(mobile == null){
                    $('#ship_mobile').text("Set Your Mobile").css("color","red");
                    return false;
                } else if(district == null){
                    $('#ship_district').text("Set Your District").css("color","red");
                    return false;
                } else if(city_town == null){
                    $('#ship_city_town').text("Set Your City/Town").css("color","red");
                    return false;
                } else if(address == null){
                    $('#ship_address').text("Set Your Address").css("color","red");
                    return false;
                } else if($('#agree-box').prop("checked") == false){
                    $('#agree-box').attr("required","");
                    $('#agree-message').show();
                    return false;
                } else if(payment_method == 3 && $('#agree-box').prop("checked") == false){
                    $('#agree-box').attr("required","");
                    $('#agree-message').show();
                    return false;
                } else{
                    $('#order-form').submit();
                }

            }
        });
    });

    // $('#order-form').submit(function(e){
    //     e.preventDefault();
    //     $.ajax({
    //         method: 'GET',
    //         url : "{{ route('user.shipping') }}",
    //         success: function(response){
    //             let shipping = response;
    //             var name = shipping.full_name;
    //             var mobile = shipping.mobile;
    //             var district = shipping.district;
    //             var city_town = shipping.city_town;
    //             var address = shipping.address;
    //             let payment_method = $('input[name=payment_method]:checked').val();
    //             if(name == null){
    //                 $('#ship_name').text("Set Your Name").css("color","red");
    //                 return false;
    //             } else if(mobile == null){
    //                 $('#ship_mobile').text("Set Your Mobile").css("color","red");
    //                 return false;
    //             } else if(district == null){
    //                 $('#ship_district').text("Set Your District").css("color","red");
    //                 return false;
    //             } else if(city_town == null){
    //                 $('#ship_city_town').text("Set Your City/Town").css("color","red");
    //                 return false;
    //             } else if(address == null){
    //                 $('#ship_address').text("Set Your Address").css("color","red");
    //                 return false;
    //             } else if(payment_method == 3 && $('#agree-box').prop("checked") == false){
    //                 $('#agree-message').show();
    //                 return false;
    //             } else{
    //                 location.replace('submit-order',{payment_method:payment_method});
    //             }

    //         }
    //     });
    // });

    function hideError(attribute){
        let value = $('#'+attribute).val();
        if(value.length > 0 && value.trim() != ""){
            $('#'+attribute).removeClass("error");
        }
    }

    $("input[name=payment_method]").on('change', function() {
       let value = $('input[name=payment_method]:checked').val();
       if(value == 3){
        $('#agree').show();
        $('#agree-box').attr("required","");
       } else{
        $('#agree').hide();
        $('#agree-box').removeAttr("required","");
       }
    });



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
