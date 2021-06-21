@extends('layouts.app')
@section('title','Checkout')
@push('css')

@endpush

@section('content')
 <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
        <div class="col-12">
            @if(Session::has('message'))
                <p class="alert alert-{{ Session::get('type') }}">{{ Session::get('message') }}</p>
            @endif
             @if ($errors->any())
                @foreach ($errors->all() as $error)
                    <p class="alert alert-danger">{{ $error }}</p>
                @endforeach
            @endif
        </div>
        <div class="col-md-4">
            <form action="{{ route('user.place_order') }}" method="POST">
                @csrf
            <h3>Shipping Address</h3><hr>
                <div class="form-group">
                    <label for="division">Division</label>
                    <select name="division_id" id="division" class="form-control" onchange="getDistrict()">
                        <option value="">Select Division</option>
                        @foreach($divisions as $division)
                            <option value="{{ $division->id }}">{{ $division->english_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="district">District</label>
                    <select name="district_id" id="district" class="form-control" onchange="getUpazila()">
                        <option value="">Select District</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="upazila">Upazila</label>
                    <select name="upazila_id" id="upazila" class="form-control">
                        <option value="">Select Upazila</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="postal_code">Postal Code</label>
                    <input type="text" name="postal_code" class="form-control">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea type="text" name="address" class="form-control"></textarea>
                </div>
        </div>
        <div class="col-md-4">
            <h3>Additional Information</h3><hr>
            <div class="payment">
                <p>Select Payment</p>
                <div class="form-group">
                    <input type="radio" name="payment" id="cash" value="Cash On Delivery" checked onclick="hidePayment()">
                    <label for="cash">Cash On Delivery</label>
                    <br>
                    <input type="radio" name="payment" id="pay_now" value="Pay Now" onclick="showPayment()">
                    <label for="pay_now">Pay Now</label>
                </div>
                <div class="form-group" id="payment_box" style="display: none;">
                    <lable>Select Payment Method</lable><hr>
                    <input type="checkbox" id="online_payment" name="payment_status" value="online_payment">
                    <label for="online_payment">Online Payment</label>
                    <br>
                    <input type="checkbox" id="bkash_payment" name="payment_status" value="bkash_payment">
                    <label for="bkash_payment">Bkash Payment</label>
                </div>

            </div>
        </div>
        <div class="col-md-4">
            <h3>Product Information</h3>
            <table class="table table-bordered" style="font-size: 13px;">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($carts as $cart)
                    <tr>
                        <td>{{ $cart->product->product_name }}</td>
                        <td>
                            {{ $cart->quantity }}{{ 'X' }}{{ $cart->unit_price }}{{ ' =' }}
                            {{ $cart->total_price }}
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <table class="table table-bordered table-striped">
                    @php
                        $subTotal = 0;
                        $deliveryCharge = 100;
                        foreach($carts as $cart){
                            $subTotal += $cart->total_price;
                        }
                    @endphp
                    <thead>
                        <tr>
                            <th>Sub Total</th>
                            <th>:</th>
                            <th>{{ $subTotal }}</th>
                        </tr>
                        <tr>
                            <th>Delivery Charge</th>
                            <th>:</th>
                            <th>100</th>
                        </tr>
                        <tr>
                            <th>Vat</th>
                            <th>:</th>
                            <th>0</th>
                        </tr>
                        <tr>
                            <th>Online Payment Charge</th>
                            <th>:</th>
                            <th>0</th>
                        </tr>
                        <tr>
                            <th>Grand Total</th>
                            <th>:</th>
                            <th>{{ $subTotal + $deliveryCharge }}</th>
                        </tr>
                    </thead>
                </table>
            </table>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-block btn-lg">Place Order</button>
            </div>
        </form>
        </div>

    </div>
      </div>
    </section><!-- End About Us Section -->
@endsection

@push('js')
<script>
    function showPayment(){
        $('#payment_box').show();
    }
    function hidePayment(){
        $('#payment_box').hide();
    }
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
