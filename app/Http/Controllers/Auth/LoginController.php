<?php

namespace App\Http\Controllers\Auth;

use URL;
use App\Model\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    use AuthenticatesUsers;


    protected $redirectTo;

    // public function _construct()
    // {
    //     $this->redirectTo =url()->previous();
    // }

    public function showLoginFrom()
    {
        return view('auth.login');
    }

    public function userLogin(Request $request)
    {
        
    }

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
