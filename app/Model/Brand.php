<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    public function products(){
    	return $this->hasMany(Product::class,'subcategory_id','id');
    }
}
