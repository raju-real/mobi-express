<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public function group(){
        return $this->belongsTo(CouponGroup::class,'user_group','id');
    }
}
