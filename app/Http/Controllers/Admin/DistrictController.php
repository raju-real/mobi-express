<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\District as district;
use Alert;

class DistrictController extends Controller
{
    public function index(){
        $districts = district::all();
        return view('admin.basic.district',compact('districts'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $district = new district();
        $district->name = $request->name;
        $district->save();
        Alert::Success('District Added Successfully');
        return redirect()->route('admin.district.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $district = district::find($id);
        $district->name = $request->name;
        $district->save();
        Alert::Info('district Update Successfully');
        return redirect()->route('admin.district.index');

    }

   
    public function destroy($id){
        $district = district::find($id);
        $district->delete();
        Alert::Warning('district Delete Successfully');
        return redirect()->route('admin.district.index');
    }
}
