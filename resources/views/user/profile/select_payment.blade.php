@extends('user.layouts.app')
@section('title','Profile')

@push('css')
<style>
    .left{
        text-align: left;
    }
    .error{
        border: 1px solid red;
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
                        <li>Pay Now</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!-- my account start  -->
<div class="account_page_bg">
    <div class="container">
        <section class="main_content_area">
            <div class="account_dashboard">
                <div class="row">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <!-- Nav tabs -->
                        <div class="dashboard_tab_button">
                            @include('user.profile.user_menus')
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-9 col-lg-9">
                        <!-- Tab panes -->
                        @if(Session::has('message'))
                        <div class="alert alert-danger" role="alert">
                            <strong>{{ Session::get('message') }}</strong>
                        </div>
                        @endif
                        <p>Billing Details</p>
                        <hr>
                        <form action="{{ route('pay-now') }}" method="POST" id="payment-information">
                            @csrf
                            <input type="hidden" name="invoice" value="{{ $order->invoice }}">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 col-form-label">Name</label>
                                        <div class="col-sm-10">
                                          <input name="name" type="name" class="form-control" id="name" value="{{ $billing->full_name ?? Auth::user()->name }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile" class="col-sm-2 col-form-label">Mobile</label>
                                        <div class="col-sm-10">
                                          <input name="mobile" type="mobile" class="form-control" id="mobile" value="{{ $billing->mobile ?? Auth::user()->mobile }}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                          <input name="email" type="email" class="form-control" id="email" value="{{ $billing->email ?? Auth::user()->email }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city_town" class="col-sm-2 col-form-label">City</label>
                                        <div class="col-sm-10">
                                          <input name="city_town" type="city_town" class="form-control" id="city_town" value="{{ $billing->city_town ?? '' }}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="post_code" class="col-sm-2 col-form-label">Post Code</label>
                                        <div class="col-sm-10">
                                          <input name="post_code" type="number" class="form-control" id="post_code" value="{{ $billing->post_code ?? '' }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address" class="col-sm-2 col-form-label">Address</label>
                                        <div class="col-sm-10">
                                          <input name="address" type="address" class="form-control" id="address" value="{{ $order->address }}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <div class="panel-default">
                                    <input id="full_payment"  name="payment_type" type="radio" value="1" checked />
                                    <label for="full_payment">
                                        Full Payment ({{ $order->order_price }} BDT)
                                    </label>
                                    
                                    <br>
                                    <input id="partial_payment"  name="payment_type" type="radio" value="2" />
                                    <label for="partial_payment">
                                        Partial Payment ({{ $order->partial_payment }} BDT)
                                    </label>
                                    <p id="payment_type_error" style="color: red;display: none;">Select Payment</p>
                                </div>
                            </div>
                            {{-- <input type="checkbox" name="agree" id="agree" class="mt-2">
                            <label for="agree">
                                I have read full 
                                <a href="{{ route('terms-condition') }}" target="_blank">
                                    <u style="color: blue;">terms and condition</u>
                                </a>
                            </label> --}}
                          <br>
                          <button type="submit" class="btn btn-info mt-2">
                              Pay Now
                          </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- my account end   -->
@endsection

@push('js')
<script type="text/javascript">
    $('#payment-information').submit(function(){
        var name = $('#name').val();
        var mobile = $('#mobile').val();
        var city_town = $('#city_town').val();
        var post_code = $('#post_code').val();
        var address = $('#address').val();
        if(!name.length > 0 || name.trim()==""){
            $('#name').addClass("error");
            return false;
        } else if(!mobile.length > 0 || mobile.trim()==""){
            $('#mobile').addClass("error");
            return false;
        } else if(!city_town.length > 0 || city_town.trim()==""){
            $('#city_town').addClass("error");
            return false;
        } else if(!post_code.length > 0 || post_code.trim()==""){
            $('#post_code').addClass("error");
            return false;
        } else if(!address.length > 0 || address.trim()==""){
            $('#address').addClass("error");
            return false;
        } else if($('input[name="payment_type"]:checked').length == 0){
            $('#payment_type_error').show();
            return false;
        } else{
            return true;
        }
    });
</script>
<script>
    $("input[name=payment_type]").change(function(){
        if($('input[name="payment_type"]:checked').length > 0){
            $('#payment_type_error').hide();
        }
    });
</script>
@endpush