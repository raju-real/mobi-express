<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\VoucherProduct;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class VoucherProductController extends Controller
{
    public function index(){
        $v_products = VoucherProduct::with(['product'=>function($query){
            $query->select('id','name');
        }])->orderBy('serial','asc')->get();
        return view('admin.bind_product.voucher_product',compact('v_products'));
    }

    public function create(){
        $currentProducts = VoucherProduct::all();
        $products = Product::whereNotIn('id',$currentProducts->pluck('product_id'))
            ->where('discount_price',0)
            ->get();
        return view('admin.bind_product.voucher_product_add_edit',compact('products'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        if(VoucherProduct::where('product_id',$request->product_id)->exists()){
            toast('Product Already Added','error');
            return redirect()->back();
        }
        $product = new VoucherProduct();
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        Toastr::success('Successfully Added On VoucherProduct');
        return redirect()->route('admin.voucher-product.index');
    }

    public function edit($id){
        $v_p = VoucherProduct::findOrFail($id);
        $currentProducts = VoucherProduct::all();
        $products = Product::whereNotIn('id',$currentProducts->pluck('product_id'))
            ->where('discount_price',0)
            ->get();
        return view('admin.bind_product.voucher_product_add_edit',compact('products','v_p'));
    }

    public function update(Request $request,$id){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        
        $product = VoucherProduct::findOrFail($id);
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        Toastr::info('Successfully Update VoucherProduct');
        return redirect()->route('admin.voucher-product.index');
    }

    public function destroy($id){
        VoucherProduct::findOrFail($id)->delete();
        Toastr::error('Successfully Delete VoucherProduct');
        return redirect()->route('admin.voucher-product.index');

    }
}
