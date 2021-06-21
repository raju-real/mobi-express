<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Color as color;
use Alert;

class ColorController extends Controller
{
    public function index(){
        $colors = color::all();
        return view('admin.attributes.color',compact('colors'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $color = new color();
        $color->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $color->slug = $slug;
        $color->save();
        toast('color Added Successfully','success');
        return redirect()->route('admin.color.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $color = color::find($id);
        $color->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $color->slug = $slug;
        $color->save();
        toast('color Update Successfully','info');
        return redirect()->route('admin.color.index');

    }

   
    public function destroy($id){
        $color = color::find($id);
        $color->delete();
        toast('color Delete Successfully','warning');
        return redirect()->route('admin.color.index');
    }
}
