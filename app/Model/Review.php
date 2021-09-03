<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function images(){
        return $this->hasMany(ReviewImage::class);
    }
}
