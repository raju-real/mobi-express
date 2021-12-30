<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Order extends Model
{
    protected static function getPaymentAmount($invoice, $payment_type,$partial_amount){
        if($payment_type == 1){
            return Order::where('invoice',$invoice)->first()->order_price;
        } elseif($payment_type == 2){
            return $partial_amount;
        } else {
            return Order::where('invoice',$invoice)->first()->order_price;
        }
    }

    public function products(){
        return $this->hasMany(OrderProduct::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function district(){
        return $this->belongsTo(District::class,'district_id','id');
    }

    public function online_payment(){
        return $this->belongsTo(SslCommerzTransaction::class,'invoice','invoice');
    }

    public static function getOrderNumber()
    {
        $latestOrderNumber = Order::latest('id')->whereNotNull('order_number')->first();
        $newOrderNumber = str_pad(1, 6, "0", STR_PAD_LEFT);
        if ($latestOrderNumber) {
            $lastOrderNumber = $latestOrderNumber->order_number;
            if ($lastOrderNumber != null) {
                $newSerialNumber = $lastOrderNumber + 1;
                $newOrderNumber = str_pad($newSerialNumber, 6, "0", STR_PAD_LEFT);;
            } else {
                $newOrderNumber = str_pad(1, 6, "0", STR_PAD_LEFT);
            }
        }
        if (Order::where('order_number', $newOrderNumber)->exists()) {
            Order::getOrderNumber();
        }
        return $newOrderNumber;
    }

    public static function getInvoiceNumber()
    {
        $orderInvoice = "MX-" . mt_rand(10000000, 99999999);
        if (Order::where('invoice', $orderInvoice)->exists()) {
            Order::getInvoiceNumber();
        }
        return $orderInvoice;
    }

    public static function getAmount($order_id){
        $totalPrice = 0;
        $order = Order::findOrFail($order_id);
        if($order->exists()){
            $totalPrice = $order->total_price;
        }
        return $totalPrice;
    }

    public static function sendMessage($mobile,$message){
        $url = "http://66.45.237.70/api.php";
        $data= array(
            'username'=>"egrocery",
            'password'=>"49FT2DWZ",
            'number'=>$mobile,
            'message'=>$message
        );

        $ch = curl_init(); // Initialize cURL
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $smsresult = curl_exec($ch);
        $p = explode("|",$smsresult);
        $sendstatus = $p[0];
    }
}
