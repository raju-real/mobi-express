<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SpecialOffer extends Model
{
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
