@extends('user.layouts.app')
@section('title','Order Details -'.$order->invoice)

@push('css')
<style>
    .left{
        text-align: left;
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
                        <li>Order Details</li>
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
                        <h3>Orders</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;">Invoice</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">{{ $order->invoice }}</th>
                                    </tr>
                                    <tr>
                                        <th style="text-align: left;">Status</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">
                                            @if($order->order_status == 0)
                                                <span>Pending</span>
                                            @elseif($order->order_status == 1)
                                                <span>Processing</span>
                                            @elseif($order->order_status == 3)
                                                <span>Delivered</span> 
                                            @elseif($order->order_status == 4)
                                                <span>Cancled</span>       
                                            @endif
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="text-align: left;">Total Price</th>
                                        <th style="text-align: left;">:</th>
                                        <th style="text-align: left;">
                                            {{ $order->order_price }} BDT
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="vertical-align: top;text-align: left;">Products</th>
                                        <th style="vertical-align: top;">:</th>
                                        <th>
                                            <table class="table table-responsive table-bordered table-striped">
                                                <thead>
                                                    <tr style="border-bottom: 1px solid grey;">
                                                        <th style="text-align: left;">
                                                            Product
                                                        </th>
                                                        <th style="text-align: left;">
                                                            Size
                                                        </th>
                                                        <th style="text-align: left;">
                                                            Color
                                                        </th>
                                                       
                                                        <th style="text-align: left;">
                                                            Price
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach($order->products as $order_product)
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            {{ $order_product->product->name }} x
                                                            {{ $order_product->quantity }}
                                                        </td>
                                                        <td style="text-align: left;">
                                                            {{ $order_product->size_id != null ? $order_product->size->name :'None' }}
                                                        </td>
                                                        <td style="text-align: left;">
                                                            {{ $order_product->color_id != null ? $order_product->color->name : 'None' }}
                                                        </td>
                                                        <td style="text-align: left;">
                                                            {{ $order_product->total_price }} BDT
                                                        </td>
                                                    </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </th>
                                    </tr>
                                </thead>
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