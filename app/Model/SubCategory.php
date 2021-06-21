<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    protected $table = 'sub_categories';

    protected $fillable = ['category_id','name','slug'];

    public function products(){
    	return $this->hasMany(Product::class,'subcategory_id','id');
    }

    public function category(){
    	return $this->belongsTo(Category::class);
    }
}
