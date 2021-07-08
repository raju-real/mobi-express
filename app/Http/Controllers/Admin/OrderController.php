<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Order;
use App\Model\OrderProduct;

class OrderController extends Controller
{
    public function pendingOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',0)->paginate($limit);
        $route = 'pending-orders';
        $title = 'Pending Orders';
        return view('admin.orders.orders',compact('orders','route','title'));
    }

    public function receivedOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',1)->paginate($limit);
        $route = 'received-orders';
        $title = 'Received Orders';
        return view('admin.orders.orders',compact('orders','route','title'));
    }

    public function processingOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',2)->paginate($limit);
        $route = 'processing-orders';
        $title = 'Processing Orders';
        return view('admin.orders.orders',compact('orders','route','title'));
    }

    public function deliveredOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',3)->paginate($limit);
        $route = 'delivered-orders';
        $title = 'Delivered Orders';
        return view('admin.orders.orders',compact('orders','route','title'));
    }

    public function cancledOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',4)->paginate($limit);
        $route = 'cancled-orders';
        $title = 'Cancled Orders';
        return view('admin.orders.orders',compact('orders','route','title'));
    }

    public function orderDetails(){
        $invoice = request()->get('invoice');
        $order = Order::with(['products'=>function($query){
            $query->select('id','order_id','product_id','order_price','quantity','total_price');
            $query->with(['product'=>function($query){
                $query->select('id','name','unit_price','discount_price');
            }]);
        }])
            ->where('invoice',$invoice)->first();
        return $order;
    }
}
