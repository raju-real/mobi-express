<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\ContactUs;
use App\Model\District;
use App\Model\Order;
use App\Model\OrderProduct;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
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

    // Commonly Controll Order
    public function orders(){
        $districtIds = Order::distinct()->pluck('district_id');
        $districts = District::whereIn('id',$districtIds)->orderBy('name','asc')->get();
        $data = Order::query();
        $title = 'Order List';
        $search = request()->get('search');
        if(isset($search)){
            $invoice = request()->get('invoice'); 
            $from_date = request()->get('from_date');
            $to_date = request()->get('to_date');
            $from  = date('Y-m-d', strtotime($from_date));
            $to  = date('Y-m-d', strtotime($to_date));
            $payment_method = request()->get('payment_method');
            $payment_status = request()->get('payment_status');
            $order_status = request()->get('order_status');
            $mobile = request()->get('mobile');
            $district = request()->get('district');
            $city_town = request()->get('city_town');

            if(isset($invoice)){
                $data->where('invoice',$invoice);
            }
            if (isset($from_date) && !isset($to_date)) {
                $data->whereDate('created_at',date($from));
            }
            if (isset($to_date) && !isset($from_date)) {
                $data->whereDate('created_at','<=',date($to));
            }
            if (isset($from_date) AND isset($to_date)) {
                $data->whereBetween('created_at', [$from, $to]);
            }
            if(isset($payment_method)){
                $data->where('payment_method',$payment_method);
            }
            if(isset($payment_status)){
                $data->where('payment_status',$payment_status);
            }
            if(isset($order_status)){
                $data->where('order_status',$order_status);
            }
            if(isset($mobile)){
                $data->where('mobile',$mobile);
            }
            if(isset($district)){
                $data->where('district_id',$district);
            }
            if(isset($city_town)){
                $data->where('city_town',"LIKE","%$city_town%");
            }
        } else{
            $today = Carbon::today()->toDateString();
            //$data->whereDate('created_at',$today)->get();
            $data->where('order_status',0)->get();
        }
        $orders = $data->get();
        return view('admin.orders.order_list',compact('orders','title','districts'));
    }

    public function orderDetails(){
        $invoice = request()->get('invoice');
        $order = Order::with(['products'=>function($query){
            $query->select('id','order_id','product_id','order_price','quantity','total_price');
            $query->with(['product'=>function($query){
                $query->select('id','name','unit_price','discount_price','size_id','color_id');
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
        //return view('admin.orders.pdf_invoice',compact('order','contact'));
        $file = PDF::loadView('admin.orders.pdf_invoice',compact('order','contact'));
         return $file->stream('admin.orders.pdf_invoice',compact('order','contact'));
        return $file->download($invoice . '.pdf');
    }
}
