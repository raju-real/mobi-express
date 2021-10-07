<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\SslCommerzTransaction as Transaction;
use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index(){
        return view('admin.dashboard');
    }

    public function users(){
        $data = User::query();
        $name = request()->get('name');
        $mobile = request()->get('mobile');
        $email = request()->get('email');
        $gender = request()->get('gender');
        $status = request()->get('status');
        if(isset($name)){
            $data->where('name','LIKE',"%{$name}%");
        }
        if(isset($mobile)){
            $data->where('mobile',$mobile);
        }
        if(isset($email)){
            $data->where('email',$email);
        }
        if(isset($gender)){
            $data->where('gender',$gender);
        }
        if(isset($status)){
            $data->where('status',$status);
        }
        $users = $data->latest()->get();
        return view('admin.user.index',compact('users'));
    }

    public function userDetails(){
        $mobile = request()->get('mobile');
        $user = User::where('mobile',$mobile)->first();
        if(isset($user)){
            return view('admin.user.show',compact('user'));
        } else{
            return redirect()->back();
        }
    }

    public function changeUserStatus(){
        $id = request()->get('id');
        $status = request()->get('status');
        $user = User::find($id);
        $user->status = $status;
        $user->save();
        return redirect()->back();
    }

    public function transactionHistory(){
        $data = Transaction::query();
        $invoice = request()->get('invoice');
        $transaction_id = request()->get('transaction_id');
        $from_date = request()->get('from_date');
        $to_date = request()->get('to_date');
        $status = request()->get('status');
        $transactions = $data->latest()->paginate(100);
        return view('admin.reports.transaction_history',compact('transactions'));
    }
}
