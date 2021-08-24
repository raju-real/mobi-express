<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\Cart;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class OrderPrice extends Model
{
    protected $appends = ['coupon_apply','voucher_apply'];

    public function getCouponApplyAttribute(){
        $session_id = Session::get('session_id');
        $identify = ['session_id'=>$session_id,'user_id'=>Auth::id()];
        $carts = Cart::where($identify)->get();
        $discount_amount = $carts->sum('total_discount_price');
        if($discount_amount == 0){
            return true;
        } else {
            return false;
        }
    }

    public function getVoucherApplyAttribute(){
        $session_id = Session::get('session_id');
        $identify = ['session_id'=>$session_id,'user_id'=>Auth::id()];
        $voucherProducts = VoucherProduct::select('product_id')
            ->get()
            ->pluck('product_id');
        $carts = Cart::where($identify)
            ->whereNotIn('product_id',$voucherProducts)
            ->select('product_id')
            ->get()
            ->pluck('product_id');
        
        if(sizeof($carts) > 0){
            return false;
        } else{
            return true;
        }
    }
}
