<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Product;
use App\Model\Brand as brand;
Use Alert;

class BrandController extends Controller
{
    public function index(){
        $brands = brand::with('products')->get();
        return view('admin.attributes.brand',compact('brands'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $brand = new brand();
        $brand->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $brand->slug = $slug;
        $brand->save();
        toast('Brand Added Successfully','success');
        return redirect()->route('admin.brand.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $brand = brand::find($id);
        $brand->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $brand->slug = $slug;
        $brand->save();
        toast('Brand Update Successfully','info');
        return redirect()->route('admin.brand.index');

    }

   
    public function destroy($id){
        $brand = brand::find($id);
        if(Product::where('brand_id',$id)->exists()){
            alert()->error('ErrorAlert','This brand added on product,update or delete first');
        } else{
            $brand->delete();
        }
        toast('Brand Delete Successfully','warning');
        return redirect()->route('admin.brand.index');
    }
}
