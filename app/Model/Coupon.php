<?php

namespace App\Model;

use App\Model\CouponUserUsed;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $guarded = [];

    // Append Extra Filed To Return
    protected $appends = array('total_used');

    public function getTotalUsedAttribute(){
        return CouponUserUsed::where('coupon_code',$this->coupon_code)->sum('user_used');
    }

    public function group(){
        return $this->belongsTo(CouponGroup::class,'user_group','id');
    }
}
