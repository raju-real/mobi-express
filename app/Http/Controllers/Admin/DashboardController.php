<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Admin;
use App\Model\Order;
use App\Model\SslCommerzTransaction as Transaction;
use App\Model\User;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class DashboardController extends Controller
{
    public function index(){
        $todayOrders = Order::whereDate('created_at',Carbon::today())->get();
        return view('admin.dashboard',compact('todayOrders'));
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
        //return request()->all();
        $data = Transaction::query();
        $invoice = request()->get('invoice');
        $transaction_id = request()->get('transaction_id');
        $from_date = request()->get('from_date');
        $to_date = request()->get('to_date');
        $status = request()->get('status');
        $from  = date('Y-m-d', strtotime($from_date));
        $to  = date('Y-m-d', strtotime($to_date));
        if(isset($invoice)){
            $data->where('invoice',$invoice);
        }
        if(isset($transaction_id)){
            $data->where('transaction_id',$transaction_id);
        }
        if (isset($from_date) && !isset($to_date)) {
            $data->whereDate('transaction_time',date($from));
        }
        if (isset($to_date) && !isset($from_date)) {
            $data->whereDate('transaction_time','<=',date($to));
        }
        if (isset($from_date) AND isset($to_date)) {
            $data->whereBetween('transaction_time', [$from, $to]);
        }
        if(isset($status)){
            $data->where('status',$status);
        }
        $transactions = $data->orderBy('created_at','desc')->paginate(100);
        return view('admin.reports.transaction_history',compact('transactions'));
    }

    public function transactionDetails(){
        $transaction = Transaction::where('transaction_id',request()->get('transaction_id'))->firstOrFail();
        //return $transaction;
        return view('admin.reports.transaction_details',compact('transaction'));
    }

    public function admins(){
        $data = Admin::query();
        $data->where('role_id',2);
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
        $admins = $data->latest()->get();
        return view('admin.admin.index',compact('admins'));
    }

    public function createAdmin(){
        $title = 'Add Admin';
        $route = route('admin.admins.store');
        return view('admin.admin.addEdit',compact('title','route'));
    }

    public function storeAdmin(Request $request){
        $this->validate($request,[
            'name' => 'required',
            'email' => 'required|unique:admins',
            'mobile' => 'required|unique:admins',
            'password' => 'required',
            'status' => 'required'
        ]);
        $admin = new Admin();
        $admin->role_id = 2;
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->mobile = $request->mobile;
        $admin->password = Hash::make($request->password);
        if(isset($request->image) && $request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(100,100);
            $image_resize->save('images/admin/' .$imageName);
            $admin->image = 'images/admin/'.$imageName;
        }

        $admin->order_management = $request->order_management ? 1 : 0;
        $admin->report_management = $request->report_management ? 1: 0;
        $admin->product_management = $request->product_management ? 1: 0;
        $admin->product_attribute_management = $request->product_attribute_management ? 1: 0;
        $admin->product_binding_management = $request->product_binding_management ? 1: 0;
        $admin->promotion_management = $request->promotion_management ? 1: 0;
        $admin->offer_management = $request->offer_management ? 1: 0;
        $admin->voucher_management = $request->voucher_management ? 1: 0;
        $admin->coupon_management = $request->coupon_management ? 1: 0;
        $admin->web_basic_management = $request->web_basic_management ? 1: 0;
        $admin->district_management = $request->district_management ? 1: 0;
        $admin->user_management = $request->user_management ? 1: 0;
        $admin->status = $request->status;
        $admin->save();
        Toastr::info('New Admin Added Successfully');
        return redirect()->route('admin.admins.index');
    }

    public function editAdmin(){
        $mobile = request()->get('mobile');
        $admin = Admin::where('mobile',$mobile)->first();
        $title = 'Edit Admin';
        $route = route('admin.admin.update',$admin->id);
        return view('admin.admin.addEdit',compact('admin','title','route'));
    }

    public function updateAdmin(Request $request,$id){
        $admin = Admin::findOrFail($id);
        $admin->role_id = 2;
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->mobile = $request->mobile;
        if(isset($request->password)){
            $admin->password = Hash::make($request->password);
        }

        if($file = $request->file('image')) {
            if(file_exists($admin->image) AND !empty($admin->image)){
                unlink($admin->image);
            }
            $image = $request->file('image');
            $name = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(100,100);
            $image_resize->save('images/admin/' .$name);
            $imageName = 'images/admin/'.$name;

        } else{
                $imageName = $admin->image;
        }
        $admin->image = $imageName;
        $admin->order_management = $request->order_management ? 1 : 0;
        $admin->report_management = $request->report_management ? 1: 0;
        $admin->product_management = $request->product_management ? 1: 0;
        $admin->product_attribute_management = $request->product_attribute_management ? 1: 0;
        $admin->product_binding_management = $request->product_binding_management ? 1: 0;
        $admin->promotion_management = $request->promotion_management ? 1: 0;
        $admin->offer_management = $request->offer_management ? 1: 0;
        $admin->voucher_management = $request->voucher_management ? 1: 0;
        $admin->coupon_management = $request->coupon_management ? 1: 0;
        $admin->web_basic_management = $request->web_basic_management ? 1: 0;
        $admin->district_management = $request->district_management ? 1: 0;
        $admin->user_management = $request->user_management ? 1: 0;
        $admin->status = $request->status;
        $admin->save();
        Toastr::success('Admin Info Update Successfully');
        return redirect()->route('admin.admins.index');
    }

    public function shwoAdmin(){
        $admin = Admin::where('mobile',request()->get('mobile'))->first();
        $title = 'Admin Details-'.$admin->name;
        return view('admin.admin.show',compact('admin','title'));
    }
}
