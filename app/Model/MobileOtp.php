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

    public static function sendOtp($mobile,$message){
        $url = "http://66.45.237.70/api.php";
        $data= array(
            'username'=>"egrocery",
            'password'=>"49FT2DWZ",
            'number'=>$mobile,
            'message'=>$message
        );

        $ch = curl_init(); // Initialize cURL
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $smsresult = curl_exec($ch);
        $p = explode("|",$smsresult);
        $sendstatus = $p[0];
    }
}
