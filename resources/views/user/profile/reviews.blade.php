@extends('user.layouts.app')
@section('title','My Reviews')

@push('css')
<style type="text/css">
    .left-text{
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
                        <li>My Reviews</li>
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
                        <h3>reviews</h3>
                        @if(Session::has('message'))
                        <div class="alert alert-warning" role="alert">
                            <strong>{{ Session::get('message') }}</strong>
                        </div>
                        @endif
                        <div class="table-responsive" >
                            <table class="table text-nowrap">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;font-weight: normal;">Sl.no</th>
                                        <th style="text-align: left;font-weight: normal;">Invoice</th>
                                        <th style="text-align: left;font-weight: normal;">Date</th>
                                        <th style="text-align: left;font-weight: normal;">Status</th>
                                        <th style="text-align: left;font-weight: normal;">Total</th>
                                        <th style="text-align: left;font-weight: normal;">Payment Method</th>
                                        <th style="text-align: left;font-weight: normal;">Paid</th>
                                        <th style="text-align: left;font-weight: normal;">Due</th>
                                        <th style="text-align: left;font-weight: normal;">Order Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($reviews as $order)
                                    <tr>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{ $loop->index + 1 }}
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">{{ $order->invoice }}</td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{ $order->created_at->format('d-m-Y') }}
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            @if($order->order_status == 0)
                                                <span>Pending</span>
                                            @elseif($order->order_status == 1)
                                                <span>Processing</span>
                                            @elseif($order->order_status == 2)
                                                <span>Picked</span>
                                            @elseif($order->order_status == 3)
                                                <span>Shipped</span>
                                            @elseif($order->order_status == 4)
                                                <span>Delivered</span>

                                            @elseif($order->order_status == 5)
                                                <span>Cancled</span> 
                                            @elseif($order->order_status == 6)
                                                <span>Returned</span>   
                                            @else 
                                                <span>Un known</span>
                                            @endif
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{ $order->order_price }} BDT
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">
                                            {{-- @if($order->payment_status == 0)
                                                <a href="{{ route('pay-here',['invoice'=>$order->invoice]) }}" style="color: blue;">Pay Now</a>
                                            @elseif($order->payment_status == 1)
                                                <span>Paid</span>
                                                <a href="{{ route('user.payment-details',['invoice'=>$order->invoice]) }}" style="color: green;">
                                                    Details
                                                </a>
                                            @endif  --}}  
                                            @if($order->payment_method == 1) 
                                            <span class="cash">
                                                    {{ 'Cash On Delivery' }}
                                                </span>
                                            @elseif($order->payment_method == 3) 
                                                @if($order->payment_status == 1)
                                                <span class="online">
                                                    {{ 'Online Payment' }}
                                                </span>
                                                @elseif($order->payment_status == 2)
                                                <span class="fail">Payment Failed</span>    
                                                <a class="pay" href="{{ route('pay-here',['invoice'=>$order->invoice]) }}">Pay Now</a>
                                                @endif                  
                                            @endif
                                        </td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">{{ $order->paid_amount }} BDT</td>
                                        <td style="text-align: left;min-width: fit-content;font-weight: normal;">{{ $order->due_amount }} BDT</td>
                                        <td style="text-align: left;font-weight: normal;">
                                            <a href="{{ route('user.order-details',['invoice'=>$order->invoice]) }}" class="">Details
                                            </a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $reviews->links() }}
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