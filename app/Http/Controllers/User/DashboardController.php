<?php

namespace App\Http\Controllers\User;

use Alert;
use App\Http\Controllers\Controller;
use App\Model\BillingAddress;
use App\Model\District;
use App\Model\MobileOtp;
use App\Model\Order;
use App\Model\Review;
use App\Model\ReviewImage;
use App\Model\ShippingAddress;
use App\Model\SslCommerzTransaction;
use App\Model\User;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use URL;

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
            ->paginate(10);
        return view('user.profile.order_history',compact('orders'));
    }

    public function orderDetails(){
        $invoice = request()->get('invoice');
        $order = Order::with(
            [
                'products'=>function($query){
                    $query->select('id','product_id','order_id','order_price','quantity','total_price','size_id','color_id');
                    $query->with(['product'=>function($query){
                        $query->select('id','name','slug');
                    }]);
                },
                'online_payment' => function($query){
                    $query->select('invoice','transaction_id','transaction_time','transaction_amount','currency','status','card_issuer','card_brand','name','mobile','city_town','post_code','address');
                },
                'district' => function($query){
                    $query->select('id','name');
                }
            ])
            ->where('user_id',Auth::id())
            ->where('invoice',$invoice)
            ->latest()
            ->select('id','invoice','created_at','order_status','order_price','payment_method','name','mobile','city_town','post_code','address','district_id')
            ->first();
        if(isset($order)){
            //return $order;
            return view('user.profile.order_details',compact('order'));
        } else {
            Toastr::info('Invalid Invoice Number','error');
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
        Toastr::info('Profile Update Successfully','success');
        return redirect()->route('user.profile');
    }

    public function addressBook(){
        $shipping = ShippingAddress::with('district_name')
            ->where('user_id',Auth::id())->first();
        if(empty($shipping)){
            ShippingAddress::insert(['user_id'=>Auth::id()]);
        }
        $billing = BillingAddress::with('district_name')
            ->where('user_id',Auth::id())->first();
        $districts = District::orderBy('name','asc')->get();
        return view('user.profile.address_book',compact('shipping','billing','districts'));
    }

    public function updateBillingAddress(Request $request){
        $identify = ['user_id'=>Auth::id()];
        $data = [
            'user_id' => Auth::id(),
            'full_name' => $request->full_name,
            'mobile' => $request->mobile,
            'email' => $request->email,
            'district' => $request->district,
            'city_town' => $request->city_town,
            'post_code' => $request->post_code,
            'address' => $request->address,
            'updated_at' => Carbon::now()
        ];
        if(request()->get('type') === 'shipping'){
            if($request->district == 1){
                $data['delivery_charge'] = 60;
                $data['delivery_time'] = 5;
            } else{
                $data['delivery_charge'] = 90;
                $data['delivery_time'] = 10;
            }
            ShippingAddress::updateOrInsert($identify,$data);
        } elseif(request()->get('type') === 'billing'){
            BillingAddress::updateOrInsert($identify,$data);
        }
        
        Toastr::info('Address Update Successfully');
        if(!empty(request()->get('checkout')) AND request()->get('checkout') === "yes"){
            return redirect()->route('checkout');
        } elseif(!empty(request()->get('pay-here')) AND request()->get('pay-here') === "yes"){
            $invoice = request()->get('invoice');
            return redirect()->route('pay-here',['invoice'=>$invoice]);
        }
        return redirect()->route('user.address-book');
    }

    public function myReviews(){
        $reviews = Review::with(['product'=>function($q){
            $q->select('id','name','slug');
        }])
            ->where('user_id',Auth::id())->latest()->paginate(15);
        return view('user.profile.reviews',compact('reviews'));
    }

    public function editReview($id){
        $review = Review::with('images')->findOrFail($id);
        return view('user.profile.edit_review',compact('review'));
    }

    public function removeReviewImage($id){
        $image = ReviewImage::find($id);
        if(file_exists($image->image) AND !empty($image->image)){
            unlink($image->image);
        }
        $image->delete();
        return response()->json(['status'=>'success']);
    }

    public function updateReview(Request $request,$id){
        $this->validate($request,[
            //'rating'=>'required',
            'review'=>'required'
        ]);
        $review = Review::findOrFail($id);
        $review->rating = $request->rating ?? $review->rating;
        $review->review = $request->review ?? $review->rating;
        $review->save();
        if($request->hasfile('images')){
            foreach($request->file('images') as $image){
                $imageName = time().$image->getClientOriginalName();
                $image_resize = Image::make($image->getRealPath());
                $image_resize->resize(300, 250);
                $image_resize->filesize(100);
                $image_resize->save('images/review/' .$imageName);
                $data[] = $imageName;
                $image = new ReviewImage();
                $image->review_id = $review->id;
                $image->image = 'images/review/'.$imageName;
                $image->save();
            }
        }

        Alert::success('Review Update Successfully');
        return redirect()->route('user.my-reviews');
    }

    public function deleteReview($id){
        $review = Review::findOrFail($id);
        $images = ReviewImage::where('review_id',$id)->get();
        foreach($images as $image){
            if(file_exists($image->image) AND !empty($image->image)){
                unlink($image->image);
            }
            $image->delete();
        }
        $review->delete();
        Alert::success('Review Deleted Successfully');
        return redirect()->route('user.my-reviews');
    }

    public function accountSetting(){
        $user = Auth::user();
        return view('user.profile.account_setting',compact('user'));
    }

    public function changePassword(Request $request){
        $this->validate($request,[
            'old_password' => 'required',
            'new_password' => 'required:min:6',
            'confirm_password' => 'required|same:new_password'
        ]);
        $old_password = $request->old_password;
        $new_password = $request->new_password;
        $confirm_password = $request->confirm_password;
        $current_password = Auth::user()->password;
        if(Hash::check($old_password, $current_password)){
            Auth::user()->update(['password'=>Hash::make($new_password)]);
            Toastr::success('Password Successfully Changed');
            Auth::logout();
            return redirect()->route('login');
        } else{
            Toastr::error('Current Password Not Matched');
            return redirect()->back();
        }
    }

    public function shipping(){
        $shipping = ShippingAddress::with('district_name')
            ->where('user_id',Auth::id())->first();
        return $shipping;    
    }

    // Change Mobile Number
    public function sendOtp(){
        $mobile = request()->get('mobile');
        if(User::where('mobile',$mobile)->exists()){
            return response()->json([
                'status' => 'exists',
                'message' => 'Mobile Already Used'
            ]); 
        } else{
            $otp = MobileOtp::getOtpCode();
            $o = "Verification";
            $c = 'Code Is ';
            $message='Your https://mobixpress.com.bd'.' '.$o.' '.$c.$otp;
            //$this->sendOtpMessage($mobile,$message);
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
        }
        
    }

    public function checkOtp(){
        $mobile = request()->get('mobile');
        $otp_code = request()->get('otp_code');
        if(MobileOtp::where(['mobile'=>$mobile,'otp_code'=>$otp_code])->exists()){
            $user = Auth::user();
            $user->mobile = $mobile;
            $user->save();
            Auth::logout();
            return response()->json([
                'status' => 'success',
                'mobile' => $mobile,
                'message' => 'Mobile Number Changed Successfully'
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
}
