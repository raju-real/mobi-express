<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CouponRequest;
use App\Model\Coupon;
use App\Model\CouponGroup;
use App\Model\CouponGroupUser;
use App\Model\CouponValidUser;
use App\Model\Order;
use App\Model\User;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    public function index(){
        $coupons = Coupon::latest()->get();
        return view('admin.coupon.index',compact('coupons'));
    }

    public function create(){
        $title = 'Add Coupon';
        $route = route('admin.coupon.store');
        $groups = CouponGroup::latest()->get();
        return view('admin.coupon.addEdit',compact('title','route','groups'));
    }

    public function store(CouponRequest $request){
        $coupon = new Coupon();
        $coupon->coupon_code = $request->coupon_code;
        $coupon->discount_type = $request->discount_type;
        $coupon->discount = $request->discount;
        $coupon->minimum_cost = $request->minimum_cost ? $request->minimum_cost : 0;
        $coupon->up_to = $request->up_to ?? 0;
        $startDate = Carbon::parse($request->start_date)->startOfDay();
        $endDate = Carbon::parse($request->end_date)->endOfDay();
        if($startDate > $endDate){
            Toastr::error('Invalid Date Range');
            return redirect()->back();
        }
        $coupon->used_limit = $request->used_limit ? $request->used_limit : 1;
        $coupon->start_date = $startDate;
        $coupon->end_date = $endDate;
        $coupon->status = $request->status;
        $coupon->valid_for = $request->valid_for;
        if($request->valid_for == 2){
            $users = User::whereNotIn('id',Order::pluck('user_id'))->select('id')->get();
            foreach($users as $user){
                $identify = ['user_id'=>$user->id,'coupon_code'=>$request->coupon_code];
                $data = ['user_id'=>$user->id,'coupon_code'=>$request->coupon_code];
                CouponValidUser::updateOrInsert($identify,$data);
            }
        } elseif($request->valid_for == 3){
            $coupon->user_group = $request->user_group;
            $group = CouponGroup::find($request->user_group);
            $users = CouponGroupUser::where('coupon_group_id',$group->id)->get();
            foreach($users as $user){
                $identify = ['user_id'=>$user->user_id,'coupon_code'=>$request->coupon_code];
                $data = ['user_id'=>$user->user_id,'coupon_code'=>$request->coupon_code];
                CouponValidUser::updateOrInsert($identify,$data);
            }
        }
        $coupon->save();
        Toastr::success('New Coupon Added Successfully');
        return redirect(route('admin.coupon.index'));
    }

    public function edit($id){
        $coupon = Coupon::findOrFail($id);
        $route = route('admin.coupon.update',$coupon->id);
        $groups = CouponGroup::latest()->get();
        $title = 'Edit Coupon';
        return view('admin.coupon.addEdit',compact('coupon','route','groups','title'));
    }

    public function update(CouponRequest $request,$id){
        //return 'working on it';
        $coupon = Coupon::findOrFail($id);
        $coupon->coupon_code = $request->coupon_code;
        $coupon->discount_type = $request->discount_type;
        $coupon->discount = $request->discount;
        $coupon->minimum_cost = $request->minimum_cost ? $request->minimum_cost : 0;
        $coupon->up_to = $request->up_to ?? 0;
        // $startDate = date('Y-m-d', strtotime($request->start_date));
        // $endDate = date('Y-m-d', strtotime($request->end_date));
        $startDate = Carbon::parse($request->start_date)->startOfDay();
        $endDate = Carbon::parse($request->end_date)->endOfDay();
        if($startDate > $endDate){
            Toastr::error('Invalid Date Range');
            return redirect()->back();
        }
        $coupon->used_limit = $request->used_limit ? $request->used_limit : 1;
        $coupon->start_date = $startDate;
        $coupon->end_date = $endDate;
        $coupon->status = $request->status;
        $coupon->valid_for = $request->valid_for;
        if($request->valid_for == 2){
            $users = User::whereNotIn('id',Order::pluck('user_id'))->select('id')->get();
            foreach($users as $user){
                $identify = ['user_id'=>$user->id,'coupon_code'=>$request->coupon_code];
                $data = ['user_id'=>$user->id,'coupon_code'=>$request->coupon_code];
                CouponValidUser::updateOrInsert($identify,$data);
            }
        } elseif($request->valid_for == 3){
            $coupon->user_group = $request->user_group;
            $group = CouponGroup::find($request->user_group);
            $users = CouponGroupUser::where('coupon_group_id',$group->id)->get();
            foreach($users as $user){
                $identify = ['user_id'=>$user->user_id,'coupon_code'=>$request->coupon_code];
                $data = ['user_id'=>$user->user_id,'coupon_code'=>$request->coupon_code];
                CouponValidUser::updateOrInsert($identify,$data);
            }
        }
        $coupon->save();
        Toastr::info('Coupon Updated Successfully');
        return redirect(route('admin.coupon.index'));
    }

    public function destroy($id){
        $coupon = Coupon::findOrFail($id);
        CouponValidUser::whereIn('coupon_code',array($coupon->coupon_code))->delete();
        $coupon->delete();
        Toastr::error('Coupon Delete Successfully');
        return redirect(route('admin.coupon.index'));
    }
}
