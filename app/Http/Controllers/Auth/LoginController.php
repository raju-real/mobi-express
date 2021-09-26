<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Model\MobileOtp;
use App\Model\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use URL;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    //protected $redirectTo;

    public function showLoginFrom()
    {
        return view('auth.login');
    }

    public function sendOtp(){
        $mobile = request()->get('mobile');
        if(User::where('mobile',$mobile)->exists()){
            return response()->json([
                'status' => 'exists',
                'message' => 'You Are Already Registered'
            ]); 
        } else{
            $otp = MobileOtp::getOtpCode();
            $o = "Otp";
            $c = 'Code';
            $message='Your https://mobixpress.com.bd'.' '.$o.' '.$c.' is '.$otp;
            //$this->sendOtpMessage($mobile,$message);
            $identiry = ['mobile'=>$mobile];
            $data = ['mobile'=>$mobile,'otp_code'=>$otp];
            MobileOtp::updateOrInsert($identiry,$data);
            return response()->json([
                'status' => 'success',
                'mobile' => $mobile,
                'otp_code' => $otp,
                'message' => 'Otp Code Sent To Your Mobile'
            ]);
        }
        
    }

    public function checkOtp(){
        $mobile = request()->get('mobile');
        $otp_code = request()->get('otp_code');
        if(MobileOtp::where(['mobile'=>$mobile,'otp_code'=>$otp_code])->exists()){
            return response()->json([
                'status' => 'success',
                'mobile' => $mobile,
                'message' => 'Successfully Verified'
            ]);
        } else{
            return response()->json([
                'status' => 'failed',
                'mobile' => $mobile,
                'message' => 'Invalid Otp Code Or Mobile'
            ]);
        }
    }

    protected function sendOtpMessage($mobile_number,$message){
        $url = "http://66.45.237.70/api.php";
        $data= array(
            'username'=>"egrocery",
            'password'=>"49FT2DWZ",
            'number'=>$mobile_number,
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

    public function userRegister(Request $request){
        return $request;
        $this->validate($request,[
            'name'=>'required',
            'reg_mobile'=>'required|unique:users',
            'password'=>'required',
            'confirm_password'=>'required|same:password'
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->mobile = $request->reg_mobile;
        $user->email = $request->reg_email ?? Null;
        $user->password = Hash::make($request->password);
        $user->save();
        $user_id = $user->id;
        $post = array('password' => $user->password, 'mobile' => $user->mobile);
        Auth::loginUsingId($user_id);
        
        if (Auth::check()) {
            if (!empty(session()->get('current_url'))) {
                return redirect(session()->get('current_url'));
            } else{
                return redirect()->route('user.dashboard');
            }
        }
    }

    public function userLogin(Request $request){
        $this->validate($request,['mobile'=>'required','password'=>'required']);
        if (Auth::guard()->attempt(['mobile' => $request->mobile,
            'password' => $request->password,'status'=>1])) {
            if (Auth::check()) {
                if (!empty(session()->get('current_url'))) {
                    return redirect(session()->get('current_url'));
                } else{
                    return redirect()->route('user.dashboard');
                }
            }
            } else {
                Toastr::error('Mobile Or Password Missmatched');
                return redirect()->back();
        }

        // if unsuccessful, then redirect back to the login with the form data
        return redirect()->back()->withInput($request->only('mobile', 'remember'));

        // JWT LOGIN
         // $validator = Validator::make($request->all(), [
        //     'mobile' => 'required',
        //     'password' => 'required|string|min:6',
        // ]);

        // if ($validator->fails()) {
        //     return response()->json(['message' => 'Mobile And Password Field Required']);
        // }

        // if (!$token = Auth::guard()->attempt($validator->validated())) {
        //     return response()->json(['message' => 'Mobile And Password Missmatched']);
        // }

        // return $this->createNewToken($token);
    }

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
