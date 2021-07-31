<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\NewArrivals;
use App\Model\Product;
use Alert;

class NewArrivalsController extends Controller
{
    public function index(){
        $new_arrivals = NewArrivals::with(['product'=>function($query){
            $query->select('id','name');
        }])->orderBy('serial','asc')->get();
        return view('admin.bind_product.new_arrivals',compact('new_arrivals'));
    }

    public function create(){
        $products = Product::all();
        return view('admin.bind_product.new_arrivals_add_edit',compact('products'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        if(NewArrivals::where('product_id',$request->product_id)->exists()){
            toast('Product Already Added','error');
            return redirect()->back();
        }
        $product = new NewArrivals();
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        Alert::success('Successfully Added On NewArrivals');
        return redirect()->route('admin.new-arrivals.index');
    }

    public function edit($id){
        $f_p = NewArrivals::findOrFail($id);
        $products = Product::all();
        return view('admin.bind_product.new_arrivals_add_edit',compact('products','f_p'));
    }

    public function update(Request $request,$id){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        
        $product = NewArrivals::findOrFail($id);
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        Alert::info('Successfully Update NewArrivals');
        return redirect()->route('admin.new-arrivals.index');
    }

    public function destroy($id){
        NewArrivals::findOrFail($id)->delete();
        Alert::error('Successfully Delete NewArrivals');
        return redirect()->route('admin.new-arrivals.index');

    }
}
