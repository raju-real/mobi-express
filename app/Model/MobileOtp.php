<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class MobileOtp extends Model
{
    protected $fillable = ['mobile','otp_code'];

    public static function getOtpCode(){
        $otp_code = mt_rand(100000, 999999);
        if(MobileOtp::where('otp_code',$otp_code )->exists()){
            MobileOtp::getOtpCode();
        }
        return $otp_code;
    }
}
