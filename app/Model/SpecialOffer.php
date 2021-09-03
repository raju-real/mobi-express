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
        $newDate =Carbon::parse($date->start_date)->addDays(2);
        return $newDate;
    }
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
