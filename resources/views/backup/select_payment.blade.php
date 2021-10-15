@extends('user.layouts.app')
@section('title','Pay Here')

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
                        <div class="row">
                            <div class="col-md-6" style="border-right: 1px solid black;">
                                <h4>
                                    Your Billing Details
                                    <a href="#" 
                                        class="btn btn-danger btn-sm pull-right" 
                                        data-tippy-placement="top" 
                                        data-tippy-arrow="true" 
                                        data-tippy-inertia="true"  
                                        data-bs-toggle="modal" 
                                        data-bs-target="#bill-address-update" 
                                        >
                                            <i class="fa fa-edit"></i>
                                    </a>
                                </h4>
                                <hr>
                                <form action="{{ route('pay-now') }}" method="POST" id="payment-information">
                            @csrf
                            <input type="hidden" name="invoice" value="{{ $order->invoice }}">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name" class="col-form-label">Name</label>
                                          <input name="name" type="name" class="form-control" id="name" value="{{ $billing->full_name ?? Auth::user()->name }}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile" class="col-form-label">Mobile</label>
                                          <input name="mobile" type="mobile" class="form-control" id="mobile" value="{{ $billing->mobile ?? Auth::user()->mobile }}">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city_town" class="col-form-label">City</label>
                                          <input name="city_town" type="city_town" class="form-control" id="city_town" value="{{ $billing->city_town ?? '' }}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="post_code" class="col-form-label">Post Code</label>
                                          <input name="post_code" type="number" class="form-control" id="post_code" value="{{ $billing->post_code ?? '' }}">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="email" class="col-form-label">Email</label>
                                          <input name="email" type="email" class="form-control" id="email" value="{{ $billing->email ?? Auth::user()->email }}">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="address" class="col-form-label">Address</label>
                                          <input name="address" type="address" class="form-control" id="address" value="{{ $order->address }}">
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
                            <div class="col-md-6">
                                <h4>Shipping & Order Details</h4>
                                <hr>
                                <p>
                                    {{ $shipping->full_name ?? '' }} <br>
                                    {{ $shipping->mobile ?? '' }}<br>
                                    {{ $shipping->email ?? '' }}<br>
                                    {{ $shipping->district_name->name ?? '' }},
                                    {{ $shipping->city_town ?? '' }} <br>
                                    {{ $shipping->address ?? '' }},
                                    {{ $shipping->post_code ?? '' }}
                                </p>
                                <h5 style="font-weight: bold;">Order Details</h5>
                                <hr>
                                <table class="table table-sm table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Invoice</th>
                                            <th>{{ $order->invoice }}</th>
                                        </tr>
                                        <tr>
                                            <th>Total Price</th>
                                            <th>{{ $order->order_price }} BDT</th>
                                        </tr>
                                        <tr>
                                            <th>Partial Payment</th>
                                            <th>{{ $order->partial_payment }} BDT</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- my account end   -->
{{-- Shipping Address Update Modal --}}
<div class="modal fade" id="bill-address-update" tabindex="-1" role="dialog" aria-hidden="true">
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
                            <form action="{{ route('user.update-address',['type'=>'billing']) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="pay-here" value="yes">
                        <input type="hidden" name="invoice" value="{{ $order->invoice }}" >
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="full_name" class="form-control" value="{{ $billing->full_name ?? Auth::user()->name }}">
                        </div>
                        <div class="form-group mt-3">
                            <label>Mobile</label>
                            <input type="text" name="mobile" class="form-control" value="{{ $billing->mobile ?? Auth::user()->mobile }}">
                        </div>
                        <div class="form-group mt-3">
                            <label>Email(Optional)</label>
                            <input type="text" name="email" class="form-control" id="s_email" value="{{ $billing->email ?? Auth::user()->email }}">
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group mt-3">
                                    <label>District</label>
                                    <select name="district" class="form-control">
                                        <option value="{{ $billing->district_name->id ?? '' }}">{{ $billing->district_name->name ?? 'Select District' }}</option>
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
                                    value="{{ $billing->city_town ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mt-3">
                                    <label>Post Code</label>
                                    <input type="number" name="post_code" class="form-control"
                                    value="{{ $billing->post_code ?? '' }}">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group mt-3">
                                    <label>Address</label>
                                    <textarea name="address" class="form-control">{{ $billing->address ?? '' }}</textarea>
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