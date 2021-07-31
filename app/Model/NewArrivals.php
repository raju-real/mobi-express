<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class NewArrivals extends Model
{
    protected $table = "new_arrivals_products";

    public function product(){
        return $this->belongsTo(Product::class);
    }
}
