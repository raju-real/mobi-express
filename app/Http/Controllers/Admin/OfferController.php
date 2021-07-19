<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\SpecialOffer;
use Illuminate\Http\Request;

class OfferController extends Controller
{
    public function index(){
        $products = SpecialOffer::all();
        return view('admin.special_offer.index',compact('products'));
    }

    public function create(){
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        return view('admin.special_offer.create',compact('products'));
    }
}
