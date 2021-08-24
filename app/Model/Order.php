<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function products(){
        return $this->hasMany(OrderProduct::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function district(){
        return $this->belongsTo(District::class,'district_id','id');
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
        $orderInvoice = "ME-" . mt_rand(10000000, 99999999);
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
}
