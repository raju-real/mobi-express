<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Unit as unit;
use Alert;

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
        $unit->delete();
        toast('Unit Delete Successfully','warning');
        return redirect()->route('admin.unit.index');
    }
}
