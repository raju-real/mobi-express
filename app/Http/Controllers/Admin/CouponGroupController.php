<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Coupon;
use App\Model\CouponGroup;
use App\Model\CouponGroupUser;
use App\Model\CouponValidUser;
use App\Model\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CouponGroupController extends Controller
{
    public function index(){
        $groups = CouponGroup::with('users')->latest()->get();
        return view('admin.coupon.groups',compact('groups'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $group = new CouponGroup();
        $group->name = $request->name;
        $group->slug = strtolower(Str::slug($request->name));
        $group->save();
        Toastr::success('group Added Successfully');
        return redirect()->route('admin.coupon-group.index');
    }

    public function show($slug)
    {
        $group = CouponGroup::where('slug',$slug)->first();
        $members = CouponGroupUser::with('user')->where('coupon_group_id',$group->id)->get();
        //return $users;
        return view('admin.coupon.group_users',compact('members','group'));
    }

    public function addGroupUser(Request $request){
        $this->validate($request,['coupon_group_id'=>'required','mobile'=>'required']);
        $user = User::where('mobile',$request->mobile)->first();
        if(isset($user)){
            $data = [
                'coupon_group_id'=>$request->coupon_group_id,
                'user_id' => $user->id
            ];
            

            // Assing User To Coupon
            $bind_coupon = $request->bind_coupon;
            $coupon_code = $request->coupon_code;
            if(isset($request) AND $request->bind_coupon == "Yes" AND isset($coupon_code)){
                if (Coupon::where('coupon_code',$coupon_code)->exists()) {
                    if(!CouponValidUser::where('user_id',$user->id)->where('coupon_code',$coupon_code)->exists()){
                        CouponGroupUser::updateOrInsert($data,$data);
                        $couponUser = ['user_id'=>$user->id,'coupon_code'=>$coupon_code];
                        CouponValidUser::updateOrInsert($couponUser,$couponUser);

                    } else {
                        Toastr::error('User Already Binded By This Coupon');
                        return redirect()->back();
                    }
                } else{
                    Toastr::error('Invalid Coupon Code');
                    return redirect()->back();
                }
            } else{
                CouponGroupUser::updateOrInsert($data,$data);
            }
            Toastr::success('User Added Successfully');
            return redirect()->back();
        } else{
            return redirect()->back()->with('message','User Not Found By This Mobile');
        }
        
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $group = CouponGroup::find($id);
        $group->name = $request->name;
        $group->slug = strtolower(Str::slug($request->name));
        $group->save();
        Toastr::info('group Update Successfully');
        return redirect()->route('admin.coupon-group.index');

    }

   
    public function destroy($id){
        CouponGroupUser::findOrFail($id)->delete();
        Toastr::success('User Deleted Successfully');
        return redirect()->back();
    }
}
