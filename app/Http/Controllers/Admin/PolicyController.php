<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Policy;
use Illuminate\Http\Request;
use Alert;

class PolicyController extends Controller
{
    public function index(){
        $policy = Policy::first();
        return view('admin.basic.policy',compact('policy'));
    }

    public function edit(){
        $policy_type = request()->get('policy');
        $policy = Policy::first();
        return view('admin.basic.policy_edit',compact('policy','policy_type'));
    }

    public function update(Request $request, $id){
        $policy = Policy::first();
        if(isset($request->privacy_policy)){
            $policy->privacy_policy = $request->privacy_policy;
        } elseif(isset($request->terms_condition)){
            $policy->terms_condition = $request->terms_condition;
        } elseif(isset($request->return_policy)){
            $policy->return_policy = $request->return_policy;
        } elseif(isset($request->refund_policy)){
            $policy->refund_policy = $request->refund_policy;
        } elseif(isset($request->delivery_information)){
            $policy->delivery_information = $request->delivery_information;
        }        
        $policy->save();
        Alert::success('Policy Update Successfully');
        return redirect(route('admin.policy.index'));
    }
}
