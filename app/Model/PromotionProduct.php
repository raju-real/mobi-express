<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PromotionProduct extends Model
{
    protected $fillable = ['status'];
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
