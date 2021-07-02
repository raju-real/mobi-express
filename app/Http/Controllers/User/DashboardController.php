<?php

namespace App\Http\Controllers\User;

use App\Model\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Alert;

class DashboardController extends Controller
{
    public function index(){
        $user = Auth::user();
        $orders = Order::with('products')->where('user_id',Auth::id())
            ->latest()
            ->get();
        return view('user.profile.dashboard',compact('user','orders'));
    }

    public function orderHistory(){
        $orders = Order::where('user_id',Auth::id())
            ->latest()
            ->select('invoice','created_at','order_status','total_price')
            ->get();
        return view('user.profile.order_history',compact('orders'));
    }

    public function orderDetails(){
        $invoice = request()->get('invoice');
        $order = Order::with(['products'=>function($query){
                $query->select('id','product_id','order_id','order_price','quantity','total_price');
                $query->with(['product'=>function($query){
                    $query->select('id','name');
                }]);
            }])
            ->where('user_id',Auth::id())
            ->where('invoice',$invoice)
            ->latest()
            ->select('id','invoice','created_at','order_status','total_price')
            ->first();
        if(isset($order)){
            return view('user.profile.order_details',compact('order'));
        } else {
            toast('Invalid Invoice Number','error');
            return redirect()->route('user.dashboard');
        }   
        
    }
}
