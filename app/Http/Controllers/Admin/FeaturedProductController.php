<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\FeaturedProduct;
use App\Model\Product;
use Illuminate\Http\Request;
use Alert;

class FeaturedProductController extends Controller
{
    public function index(){
        $f_products = FeaturedProduct::with(['product'=>function($query){
            $query->select('id','name');
        }])->orderBy('serial','asc')->get();
        return view('admin.bind_product.featured_product',compact('f_products'));
    }

    public function create(){
        $products = Product::all();
        return view('admin.bind_product.featured_product_add_edit',compact('products'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        if(FeaturedProduct::where('product_id',$request->product_id)->exists()){
            toast('Product Already Added','error');
            return redirect()->back();
        }
        $product = new FeaturedProduct();
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        toast('Successfully Added On FeaturedProduct','success');
        return redirect()->route('admin.featured-products.index');
    }

    public function edit($id){
        $f_p = FeaturedProduct::findOrFail($id);
        $products = Product::all();
        return view('admin.bind_product.featured_product_add_edit',compact('products','f_p'));
    }

    public function update(Request $request,$id){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        
        $product = FeaturedProduct::findOrFail($id);
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        toast('Successfully Update FeaturedProduct','info');
        return redirect()->route('admin.featured-products.index');
    }

    public function destroy($id){
        FeaturedProduct::findOrFail($id)->delete();
        toast('Successfully Delete FeaturedProduct','error');
        return redirect()->route('admin.featured-products.index');

    }
}
