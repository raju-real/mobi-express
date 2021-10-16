<?php

namespace App\Model;

use App\Model\SpecialOffer;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class SpecialOffer extends Model
{
    protected $appends = ['count_down_end_date'];

    public function getCountDownEndDateAttribute(){
        $date = SpecialOffer::find($this->id);
        $newDate =Carbon::parse($date->end_date)->format("Y/m/d");
        return $newDate;
    }
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
