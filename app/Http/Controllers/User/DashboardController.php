<?php

namespace App\Http\Controllers\User;

use Alert;
use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\SslCommerzTransaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

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
            ->select('invoice','created_at','order_status','order_price','payment_status')
            ->get();
        return view('user.profile.order_history',compact('orders'));
    }

    public function orderDetails(){
        $invoice = request()->get('invoice');
        $order = Order::with(['products'=>function($query){
                $query->select('id','product_id','order_id','order_price','quantity','total_price','size_id','color_id');
                $query->with(['product'=>function($query){
                    $query->select('id','name');
                }]);
            }])
            ->where('user_id',Auth::id())
            ->where('invoice',$invoice)
            ->latest()
            ->select('id','invoice','created_at','order_status','order_price')
            ->first();
        if(isset($order)){
            return view('user.profile.order_details',compact('order'));
        } else {
            toast('Invalid Invoice Number','error');
            return redirect()->route('user.order-history');
        }   
    }

    public function paymentDetails(){
        try {
            $invoice = request()->get('invoice');
            $payment = SslCommerzTransaction::where('user_id',Auth::id())
                ->where('invoice',$invoice)->first();
            if(isset($payment)){
                return $payment;
            } else{
                Alert::error('Invalid Invoice Number');
                return redirect()->route('user.order-history');
            }
        } catch (Exception $e) {
            return $e->getMessage();
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
