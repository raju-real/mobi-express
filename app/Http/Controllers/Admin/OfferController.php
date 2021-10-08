<?php

namespace App\Http\Controllers\Admin;

use Alert;
use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\SpecialOffer;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;

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
        $offer->discount_price = $request->discount_price ?? 0;
        $startDate = Carbon::parse($request->start_date)->startOfDay();
        $endDate = Carbon::parse($request->end_date)->endOfDay();
        if($startDate > $endDate){
            Toastr::info('Invalid Date Range','error');
            return redirect()->back();
        }
        $offer->start_date = $startDate;
        $offer->end_date = $endDate;
        $offer->status = $request->status;
        // Save at product
        $product = Product::findOrFail($request->product_id);
        if($request->status == 1){
            if($request->discount_price > $product->unit_price){
                Toastr::info('Invalid Discount Price','error');
                return redirect()->back();
            }
            $product->update(['discount_price'=>$request->discount_price]);
        } elseif($request->status == 0){
            $product->update(['discount_price'=>0]);
        }
        $offer->save();
        Toastr::info('Offer Product Aadded Successfully','success');
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
        $startDate = Carbon::parse($request->start_date)->startOfDay();
        $endDate = Carbon::parse($request->end_date)->endOfDay();
        if($startDate > $endDate){
            Toastr::info('Invalid Date Range','error');
            return redirect()->back();
        }
        $offer->start_date = $startDate;
        $offer->end_date = $endDate;
        $offer->status = $request->status;
        // Save at product
        $product = Product::findOrFail($request->product_id);
        if($request->status == 1){
            if($request->discount_price > $product->unit_price){
                Toastr::info('Invalid Discount Price','error');
                return redirect()->back();
            }
            $product->update(['discount_price'=>$request->discount_price]);
        } elseif($request->status == 0){
            $product->update(['discount_price'=>0]);
        }
        $offer->save();
        Toastr::info('Offer Product Updated Successfully','info');
        return redirect()->route('admin.offer.index');
    }

    public function destroy($id){
        SpecialOffer::find($id)->delete();
        Toastr::info('Offer Product Delete Successfully','error');
        return redirect()->route('admin.offer.index');
    }
}
