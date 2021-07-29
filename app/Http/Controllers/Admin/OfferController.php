<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\SpecialOffer;
use Illuminate\Http\Request;
use Alert;

class OfferController extends Controller
{
    public function index(){
        $offers = SpecialOffer::with('product')->get();
        return view('admin.special_offer.index',compact('offers'));
    }

    public function create(){
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        return view('admin.special_offer.create',compact('products'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'product_id'=>'required|unique:special_offers',
            'discount_price'=>'required',
            'start_date'=>'required',
            'end_date'=>'required'
        ]);
        $offer = new SpecialOffer();
        $offer->product_id = $request->product_id;
        $offer->discount_price = $request->discount_price;
        $startDate = date('Y-m-d', strtotime($request->start_date));
        $endDate = date('Y-m-d', strtotime($request->end_date));
        if($startDate > $endDate){
            toast('Invalid Date Range','error');
            return redirect()->back();
        }
        $offer->start_date = $startDate;
        $offer->end_date = $endDate;
        $offer->status = $request->status;
        // Save at product
        $product = Product::findOrFail($request->product_id);
        if($request->discount_price > $product->unit_price){
            toast('Invalid Discount Price','error');
            return redirect()->back();
        }
        $product->discount_price = $request->discount_price;
        $result = (($product->unit_price - $request->discount_price)*100)/$product->unit_price;
        $product->percentage = round($result);
        $product->save();
        $offer->save();
        toast('Offer Product Aadded Successfully','success');
        return redirect()->route('admin.offer.create');
    }

    public function edit($id){
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        $offer = SpecialOffer::findOrFail($id);    
        return view('admin.special_offer.edit',compact('products','offer'));
    }

    public function update(Request $request,$id){
        $this->validate($request,[
            'product_id'=>'required',
            'discount_price'=>'required',
            'start_date'=>'required',
            'end_date'=>'required'
        ]);
        $offer = SpecialOffer::findOrFail($id);
        $offer->product_id = $request->product_id;
        $offer->discount_price = $request->discount_price;
        $startDate = date('Y-m-d', strtotime($request->start_date));
        $endDate = date('Y-m-d', strtotime($request->end_date));
        if($startDate > $endDate){
            toast('Invalid Date Range','error');
            return redirect()->back();
        }
        $offer->start_date = $startDate;
        $offer->end_date = $endDate;
        $offer->status = $request->status;
        // Save at product
        $product = Product::findOrFail($request->product_id);
        if($request->discount_price > $product->unit_price){
            toast('Invalid Discount Price','error');
            return redirect()->back();
        }
        $product->discount_price = $request->discount_price;
        $result = (($product->unit_price - $request->discount_price)*100)/$product->unit_price;
        $product->percentage = round($result);
        $product->save();
        $offer->save();
        toast('Offer Product Updated Successfully','info');
        return redirect()->route('admin.offer.index');
    }

    public function destroy($id){
        SpecialOffer::find($id)->delete();
        toast('Offer Product Delete Successfully','error');
        return redirect()->route('admin.offer.index');
    }
}
