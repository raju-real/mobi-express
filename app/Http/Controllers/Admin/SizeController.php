<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Size as size;
use Alert;

class SizeController extends Controller
{
    public function index(){
        $sizes = size::all();
        return view('admin.attributes.size',compact('sizes'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $size = new size();
        $size->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $size->slug = $slug;
        $size->save();
        toast('Size Added Successfully','success');
        return redirect()->route('admin.size.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $size = size::find($id);
        $size->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $size->slug = $slug;
        $size->save();
        toast('Size Update Successfully','info');
        return redirect()->route('admin.size.index');

    }

   
    public function destroy($id){
        $size = size::find($id);
        $size->delete();
        toast('Size Delete Successfully','warning');
        return redirect()->route('admin.size.index');
    }
}
