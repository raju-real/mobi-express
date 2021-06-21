<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	protected $fillable = ['name','slug'];

    public function products(){
    	return $this->hasMany(Product::class);
    }

    public function subcategories(){
    	return $this->hasMany(SubCategory::class);
    }
}
