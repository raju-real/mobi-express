<?php

namespace App\Http\Controllers\User;

use App\Model\Cart;
use App\Model\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use App\Http\Controllers\Controller;
use App\Model\Orderproduct;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
Use Redirect;

class UserOrderController extends Controller
{
    public function placeOrder(Request $request){
        $request->validate([
            'division_id' => 'required',
            'district_id' => 'required',
            'upazila_id' => 'required',
            'postal_code' => 'required',
            'address' => 'required',
            'payment' => 'required',
        ]);

        // Save Order
        $order = new Order();
        $order->user_id         = Auth::id();
        $order->order_number    = Order::getOrderNumber();
        $order->invoice         = Order::getInvoiceNumber();
        $order->division_id     = $request->division_id;
        $order->district_id     = $request->district_id;
        $order->upazila_id      = $request->upazila_id;
        $order->postal_code     = $request->postal_code;
        $order->address         = $request->address;
        $carts = Cart::where('session_id',Session::get('session_id'))->get();
        $orderPrice = 0;
        foreach ($carts as $cart) {
            $orderPrice += $cart->total_price;
        }
        $order->order_price = $orderPrice;
        $deliveryCharge = 100;
        $vat            = 0;
        $order->delivery_charge = $deliveryCharge;
        $order->vat             = $vat;
        $order->total_price     = $orderPrice + $deliveryCharge + $vat;
        $order->order_status    = 'Pending';
        $order->payment_status  = 'Cash On Delivery';
        $order->save();

        // Save Order Product
        foreach($carts as $cart){
            $order_product = new Orderproduct();
            $order_product->order_id = $order->id;
            $order_product->product_id = $cart->product_id;
            $order_product->quantity = $cart->quantity;
            $order_product->unit_price = $cart->unit_price;
            $order_product->total_price = $cart->total_price;
            $order_product->save();
            //$cart->delete();
        }

        // redirect for payment
        if($request->payment == 'Pay Now'){
            if($request->payment_status == 'online_payment'){
                return Redirect::route('user.pay')->withInput(['order_id' => $order->id]);
            } elseif($request->payment_status == 'bkash_payment'){
                return 'bkash_payment';
            }
        }

        return redirect()->route('user.dashboard')->with(['message' => 'Order Placed Successfully','type' => 'success']);
    }

    public function payment($order_id){
        
    }
}
