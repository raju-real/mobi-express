<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CouponUserUsed extends Model
{
    protected $fillable = ['order_id','user_id','coupon_code','user_used'];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
