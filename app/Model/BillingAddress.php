<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class BillingAddress extends Model
{
    protected $fillable = ['full_name','mobile','email','district','city_town','post_code','address'];

    public function district_name(){
        return $this->belongsTo(District::class,'district','id');
    }
}
