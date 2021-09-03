<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Coupon;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;

class CouponController extends Controller
{
    public function index(){
        $coupons = Coupon::latest()->get();
        return view('admin.single_page.coupon',compact('coupons'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'coupon_code' => 'required',
            'valid_for' => 'required',
            'discount_type' => 'required',
            'discount' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
            'status' => 'required'
        ]);

        $coupon = new Coupon();
        $coupon->coupon_code = $request->coupon_code;
        $coupon->valid_for = $request->valid_for;
        $coupon->discount_type = $request->discount_type;
        $coupon->discount = $request->discount;
        $coupon->minimum_cost = $request->minimum_cost ? $request->minimum_cost : 0;
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
        $coupon->save();
        Toastr::success('New Coupon Added Successfully');
        return redirect(route('admin.coupon.index'));
    }

    public function update(Request $request, $id){
        $this->validate($request,[
            'coupon_code' => 'required',
            'valid_for' => 'required',
            'discount_type' => 'required',
            'discount' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
            'status' => 'required'
        ]);
         
        $coupon = Coupon::findOrFail($id);
        $coupon->coupon_code = $request->coupon_code;
        $coupon->valid_for = $request->valid_for;
        $coupon->discount_type = $request->discount_type;
        $coupon->discount = $request->discount;
        $coupon->minimum_cost = $request->minimum_cost ? $request->minimum_cost : 0;
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
        $coupon->save();
        Toastr::info('Coupon Update Successfully');
        return redirect(route('admin.coupon.index'));
    }

    public function destroy($id){
        Coupon::findOrFail($id)->delete();
        Toastr::error('Coupon Delete Successfully');
        return redirect(route('admin.coupon.index'));
    }
}
