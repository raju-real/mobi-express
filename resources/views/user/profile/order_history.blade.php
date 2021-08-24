@extends('user.layouts.app')
@section('title','My Acount')

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
                        <h3>Orders</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Sl.no</th>
                                        <th>Invoice</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Total</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($orders as $order)
                                    <tr>
                                        <td>{{ $loop->index + 1 }}</td>
                                        <td>{{ $order->invoice }}</td>
                                        <td>
                                            {{ $order->created_at->format('D,M Y') }}
                                        </td>
                                        <td>
                                            @if($order->order_status == 0)
                                                <span>Pending</span>
                                            @elseif($order->order_status == 1)
                                                <span>Processing</span>
                                            @elseif($order->order_status == 3)
                                                <span>Delivered</span> 
                                            @elseif($order->order_status == 4)
                                                <span>Cancled</span>       
                                            @endif
                                        </td>
                                        <td>
                                            {{ $order->order_price }} BDT
                                        </td>
                                        <td><a href="{{ route('user.order_details',['invoice'=>$order->invoice]) }}" class="view">view</a></td>
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