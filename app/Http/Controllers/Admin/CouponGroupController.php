<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\CouponGroup;
use App\Model\CouponGroupUser;
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
            CouponGroupUser::updateOrInsert($data,$data);
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
        
    }
}
