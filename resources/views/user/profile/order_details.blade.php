@extends('user.layouts.app')
@section('title',$order->invoice)

@push('css')
<style type="text/css">
    .left-text{
        text-align: left;
    }
    .online{
        border: 1.5px solid green;
        border-radius: 10px;
        padding: 2px 10px;
    }
    .cash{
        border: 1.5px solid blue;
        border-radius: 10px;
        padding: 2px 10px;
    }
    .card {
        background-color: white;
        border: none;
        box-shadow: 2px 2px 3px 0px rgba(0, 0, 0, 0.2), 
        0px 1px 1px 2px rgba(0, 0, 0, 0.14), 
        0px 2px 1px -1px rgba(0, 0, 0, 0.12);
    }    
        
    .card-body {
        font-weight: 300px;
    }
    .review{
        border: 1.5px solid white;
        border-radius: 10px;
        padding: 2px 10px;
        box-shadow: 2px 2px 3px 0px rgba(0, 0, 0, 0.2), 
        0px 1px 1px 2px rgba(0, 0, 0, 0.14), 
        0px 2px 1px -1px rgba(0, 0, 0, 0.12);
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
                        <li>Order History</li>
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
                        <h3>Order Details</h3>
                        <hr>
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Shipping Details</h4>
                                <div class="card">
                                    <div class="card-body">
                                        <p>
                                            {{ $order->name ?? '' }} <br>
                                            {{ $order->mobile ?? '' }}<br>
                                            {{ $order->district->name ?? '' }},
                                            {{ $order->city_town ?? '' }} <br>
                                            {{ $order->address ?? '' }},
                                            {{ $order->post_code ?? '' }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h4>Payment Details</h4>
                                <div class="card">
                                    <div class="card-body">
                                        @if($order->payment_method == 1)
                                            <p>
                                                Payment Method : 
                                                <span class="cash">
                                                    {{ 'Cash On Delivery' }}
                                                </span>
                                            </p>
                                        @elseif($order->payment_method == 2)    
                                            {{ 'Voucher Payment' }}
                                        @elseif($order->payment_method == 3)
                                            {{-- <p>
                                                Payment Method : 
                                                <span class="online">
                                                    {{ 'Online Payment' }}
                                                </span>
                                            </p> --}}
                                            <p>
                                                Payment Method: 
                                                {{ $order->online_payment->card_issuer ?? '' }} <br>
                                                Transaction Id: 
                                                {{ $order->online_payment->transaction_id ?? '' }} <br>
                                                Amount:
                                                    {{ $order->online_payment->transaction_amount ?? '' }} 
                                                    {{ $order->online_payment->currency ?? '' }} <br>
                                                Status:
                                                {{ $order->online_payment->status ?? '' }}    
                                            </p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            @if($order->payment_method == 3)
                                <div class="col-md-4">
                                    <h4>Billing Details</h4>
                                    <div class="card">
                                        <div class="card-body">
                                            <p>
                                                {{ $order->online_payment->name ?? '' }} <br>
                                                {{ $order->online_payment->mobile ?? '' }}<br>
                                                {{ $order->online_payment->city_town ?? '' }} <br>
                                                {{ $order->online_payment->address ?? '' }},
                                                {{ $order->online_payment->post_code ?? '' }}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        </div>
                        <hr>
                        <div class="table-responsive" >
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;font-weight: normal;">Sl.no</th>
                                        <th style="text-align: left;font-weight: normal;">Product</th>
                                        <th style="text-align: left;font-weight: normal;">Size</th>
                                        <th style="text-align: left;font-weight: normal;">Color</th>
                                        <th style="text-align: left;font-weight: normal;">Price</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($order->products as $order_product)
                                    <tr>
                                        <td style="text-align: left;font-weight: normal;">
                                            {{ $loop->index + 1 }}
                                        </td>
                                        <td style="text-align: left;font-weight: normal;">
                                            {{ $order_product->product->name }}  X
                                            {{ $order_product->quantity }}
                                        </td>
                                        <td style="text-align: left;font-weight: normal;">
                                            {{ $order_product->size_id != null ? $order_product->size->name :'None' }}
                                        </td>
                                        <td style="text-align: left;font-weight: normal;">
                                            {{ $order_product->color_id != null ? $order_product->color->name : 'None' }}
                                        </td>
                                        <td style="text-align: left;font-weight: normal;">
                                            {{ $order_product->total_price }} BDT
                                        </td>
                                        <td style="text-align: left;font-weight: normal;">
                                            <a href="{{ route('product-details',$order_product->product->slug) }}" class="review">Submit Review</a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<!-- my account end   -->
@endsection

@push('js')

@endpush