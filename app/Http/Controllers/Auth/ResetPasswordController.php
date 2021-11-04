<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Model\MobileOtp;
use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ResetPasswordController extends Controller
{
    public function resetPasswordForm(){
        return view('auth.reset-password');
    }

    public function sendOtp(){
        $mobile = request()->get('mobile');
        if(User::where('mobile',$mobile)->exists()){
            $otp = MobileOtp::getOtpCode();
            $o = "Verification";
            $c = 'Code Is ';
            $message='Your https://mobixpress.com.bd'.' '.$o.' '.$c.$otp;
            MobileOtp::sendOtp($mobile,$message);
            $identify = ['mobile'=>$mobile];
            $data = ['mobile'=>$mobile,'otp_code'=>$otp];
            MobileOtp::updateOrInsert($identify,$data);
            return response()->json([
                'status' => 'success',
                'mobile' => $mobile,
                //'otp_code' => $otp,
                'message' => 'Otp Code Sent To Your Mobile'
            ]);
        } else{
            return response()->json([
                'status' => 'exists',
                'message' => 'Mobile Not Registered Or Invalid'
            ]);
        }
    }

    public function resetPassword(Request $request){
        $where = ['mobile'=>$request->mobile,'otp_code'=>$request->otp_code];
        if(MobileOtp::where($where)->exists()){
            User::where('mobile',$request->mobile)->update(['password'=>Hash::make($request->password)]);
            $name = "Login Now";
            $url =  route('login');
            $output ='<a'.' href='.'"'.$url .'"'
            .'>'
            .'<u style="color: red;">'
            .$name
            .'</u>'
            .'</a>';
            return response()->json([
                'status' => 'success',
                'message' => 'Password Changed Successfully,'.$output
            ]);
        } else{
            return response()->json([
                'status' => 'failed',
                'message' => 'Mobile And Otp Code Missmatched'
            ]);
        }
    }
}
