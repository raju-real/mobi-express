<?php

namespace App\Http\Controllers\Admin;

use Alert;
use App\Http\Controllers\Controller;
use App\Model\ProductUnit;
use App\Model\Unit as unit;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class UnitController extends Controller
{
    public function index(){
        $units = unit::all();
        return view('admin.attributes.unit',compact('units'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $unit = new unit();
        $unit->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $unit->slug = $slug;
        $unit->save();
        toast('Unit Added Successfully','success');
        return redirect()->route('admin.unit.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $unit = unit::find($id);
        $unit->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $unit->slug = $slug;
        $unit->save();
        toast('Unit Update Successfully','info');
        return redirect()->route('admin.unit.index');

    }

   
    public function destroy($id){
        $unit = unit::find($id);
        ProductUnit::whereIn('unit_id',[$id])->delete();
        $unit->delete();
        Toastr::warning('Unit Delete Successfully','warning');
        return redirect()->route('admin.unit.index');
    }
}
