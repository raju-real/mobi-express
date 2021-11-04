@extends('admin.layouts.app')
@section('title','Dashboard')
@push('css')
<style type="text/css">
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
    .fail{
        border: 1.5px solid red;
        border-radius: 10px;
        padding: 2px 10px;
    }
</style>
@endpush

@section('content')
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-success color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ $todayOrders->count() }}
                </h2>
                <div class="m-b-5">Today Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-warning color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',0)->count() }}
                </h2>
                <div class="m-b-5">Pending Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-primary color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',1)->count() }}
                </h2>
                <div class="m-b-5">Processing Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-info color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',2)->count() }}
                </h2>
                <div class="m-b-5">Picked Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-info color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',3)->count() }}
                </h2>
                <div class="m-b-5">Shipped Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-success color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',4)->count() }}
                </h2>
                <div class="m-b-5">Delivered Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-danger color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',5)->count() }}
                </h2>
                <div class="m-b-5">Cancled Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-warning color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">
                    {{ App\Model\Order::where('order_status',6)->count() }}
                </h2>
                <div class="m-b-5">Returned Orders</div><i class="ti-shopping-cart widget-stat-icon"></i>
            </div>
        </div>
    </div>
    
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-warning color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">{{ App\Model\User::count() }}</h2>
                <div class="m-b-5">Total Users</div><i class="ti-user widget-stat-icon"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="ibox bg-primary color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">{{ App\Model\User::whereDate('created_at',\Carbon\Carbon::today())->count() }}</h2>
                <div class="m-b-5">Today Registered</div><i class="ti-user widget-stat-icon"></i>
            </div>
        </div>
    </div>
    {{-- <div class="col-lg-3 col-md-6">
        <div class="ibox bg-warning color-white widget-stat">
            <div class="ibox-body">
                <h2 class="m-b-5 font-strong">$1570</h2>
                <div class="m-b-5">TOTAL INCOME</div><i class="fa fa-money widget-stat-icon"></i>
                <div><i class="fa fa-level-up m-r-5"></i><small>22% higher</small></div>
            </div>
        </div>
    </div> --}}
</div>
                          
<div class="row">
    <div class="col-lg-12">
        <div class="ibox">
            <div class="ibox-head">
                <div class="ibox-title">Today Orders</div>
                {{-- <div class="ibox-tools">
                    <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                    <a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-ellipsis-v"></i></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item">option 1</a>
                        <a class="dropdown-item">option 2</a>
                    </div>
                </div> --}}
            </div>
            <div class="ibox-body">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Invoice</th>
                            <th>From</th>
                            <th>Customer</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Payment</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($todayOrders as $order)
                        <tr>
                            <td>
                                <a href="{{ route('admin.order.show',['invoice'=>$order->invoice]) }}">{{ $order->invoice }}</a>
                            </td>
                            <td>{{ $order->district->name }}</td>
                            <td>{{ $order->user->name }}</td>
                            <td>{{ $order->order_price }} BDT</td>
                            <td>
                                @if($order->order_status == 0)
                                    <span class="badge badge-warning">Pending</span>
                                @elseif($order->order_status == 1)
                                    <span class="badge badge-primary">Processing</span>
                                @elseif($order->order_status == 2)
                                    <span class="badge badge-info">Picked</span>
                                @elseif($order->order_status == 3)
                                    <span class="badge badge-success">Shipped</span>
                                @elseif($order->order_status == 4)
                                    <span class="badge badge-success">Delivered</span>

                                @elseif($order->order_status == 5)
                                    <span class="badge badge-danger">Cancled</span> 
                                @elseif($order->order_status == 6)
                                    <span class="badge badge-warning">Returned</span>   
                                @else 
                                    <span class="badge badge-secendary">Un known</span>
                                @endif
                            </td>
                            <td>
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
                                        
                                        @endif                  
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')

@endpush