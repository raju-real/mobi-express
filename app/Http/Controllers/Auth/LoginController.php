<?php

namespace App\Http\Controllers\Auth;

use URL;
use App\Model\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    //protected $redirectTo;

    public function showLoginFrom()
    {
        return view('auth.login');
    }

    public function userRegister(Request $request){
        $this->validate($request,[
            'name'=>'required',
            'mobile'=>'required|unique:users',
            'password'=>'required',
            'confirm_password'=>'required|same:password'
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->mobile = $request->mobile;
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
            'password' => $request->password])) {
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
