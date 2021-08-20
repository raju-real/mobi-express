<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class FrontCategory extends Model
{
    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function categoryProducts(){
        return $this->hasMany(FrontCategoryProduct::class);
    }
}
