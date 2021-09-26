<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\ContactUs;
use App\Model\Order;
use App\Model\OrderProduct;
use Illuminate\Http\Request;
use PDF;

class OrderController extends Controller
{
    public function pendingOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',0)->paginate($limit);
        $title = 'Pending Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function processingOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',1)->paginate($limit);
        $title = 'Processing Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function pickedOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',2)->paginate($limit);
        $title = 'Picked Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function shippedOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',3)->paginate($limit);
        $title = 'Shipped Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function deliveredOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',4)->paginate($limit);
        $title = 'Delivered Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function returnedOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',6)->paginate($limit);
        $title = 'Returned Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function cancledOrders($limit=15){
        $limit = request()->get('limit');
        $orders = Order::where('order_status',5)->paginate($limit);
        $title = 'Cancled Orders';
        return view('admin.orders.orders',compact('orders','title'));
    }

    public function searchOrder($limit=15){
        $query = request()->get('query');
        $orders = Order::where('invoice','LIKE',"%{$query}%")
            ->orWhere('mobile','LIKE',"%{$query}%")
            ->paginate($limit);
        $title = 'Search Result'; 
        return view('admin.orders.orders',compact('orders','title'));

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
        if(isset($order)){
            return view('admin.orders.show',compact('order'));
        } else{
            toast('Invalid Invoice Number');
            return redirect()->back();
        }
        
    }

    public function changeOrderStatus(){
        $invoice = request()->get('invoice');
        $order_status = request()->get('order_status');
        Order::where('invoice',$invoice)->update(['order_status'=>$order_status]);
        return redirect()->route('admin.order.show',['invoice'=>$invoice]);
    }

    public function invoice(){
        $invoice = request()->get('invoice');
        $order = Order::with('district')->where('invoice',$invoice)->first();
        if(isset($order)){
            return view('admin.orders.invoice1',compact('order'));
        } else{
            Toastr::error('No Order Found');
            return redirect()->back();
        }
    }

    public function downloadInvoice(){
        $invoice = request()->get('invoice');
        $order = Order::where('invoice',$invoice)->first();
        $contact = ContactUs::first();
        return view('admin.orders.m_pdf_invoice',compact('order','contact'));
        $invoice = PDF::loadView('admin.orders.m_pdf_invoice',compact('order','contact'));
        $invoice->setPaper('A4', 'portrait');
        $invoice_name = $order->invoice;
        //$invoice->save('assets/common/invoice' . '/' . $invoice_name.'.pdf');
        return $invoice->download($invoice_name . '.pdf');
    }
}
