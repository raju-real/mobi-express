<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    public function products(){
        return $this->hasMany(PromotionProduct::class)->where('status',1);
    }
}
