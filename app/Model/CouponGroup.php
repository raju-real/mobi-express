<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CouponGroup extends Model
{
    protected $table = "coupon_groups";

    public function users(){
        return $this->hasMany(CouponGroupUser::class);
    }
}
