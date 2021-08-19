<?php

namespace App\Http\Controllers\User;

use App\Model\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Alert;

class DashboardController extends Controller
{
    public function index(){
        $user = Auth::user();
        $orders = Order::with('products')->where('user_id',Auth::id())
            ->latest()
            ->get();
        return view('user.profile.dashboard',compact('user','orders'));
    }

    public function orderHistory(){
        $orders = Order::where('user_id',Auth::id())
            ->latest()
            ->select('invoice','created_at','order_status','total_price')
            ->get();
        return view('user.profile.order_history',compact('orders'));
    }

    public function orderDetails(){
        $invoice = request()->get('invoice');
        $order = Order::with(['products'=>function($query){
                $query->select('id','product_id','order_id','order_price','quantity','total_price');
                $query->with(['product'=>function($query){
                    $query->select('id','name');
                }]);
            }])
            ->where('user_id',Auth::id())
            ->where('invoice',$invoice)
            ->latest()
            ->select('id','invoice','created_at','order_status','total_price')
            ->first();
        if(isset($order)){
            return view('user.profile.order_details',compact('order'));
        } else {
            toast('Invalid Invoice Number','error');
            return redirect()->route('user.dashboard');
        }   
    }

    public function profile(){
        $user = Auth::user();
        return view('user.profile.profile',compact('user'));
    }

    public function passChangeForm(){
        $user = Auth::user();
        return view('user.profile.change_password',compact('user'));
    }

    public function editProfile(){
        $user = Auth::user();
        return view('user.profile.edit_profile',compact('user'));
    }

    public function updateProfile(Request $request){
        $user = Auth::user();
        if($request->file('image') != null) {
            $this->validate($request,['image'=>'mimes:jpg,png,jpeg']);
            if(file_exists($user->image) AND !empty($user->image)){
                unlink($user->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(100, 100);
            $image_resize->save('images/user/' .$imageName);
            $user->image = 'images/user/'.$imageName;
        } 
        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();
        toast('Profile Update Successfully','success');
        return redirect()->route('user.profile');
    }
}
