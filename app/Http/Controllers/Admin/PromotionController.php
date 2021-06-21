<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Model\Promotion;
use App\Model\PromotionProduct;
Use Alert;

class PromotionController extends Controller
{
    public function index(){
        $promotions = Promotion::latest()->paginate(20);
        return view('admin.promotion.index',compact('promotions'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required',
            'image'=>'required',
            'status'=>'required'
        ]);
        $promotion = new Promotion();
        $promotion->name = $request->name;
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(353.72, 191.19);
            $image_resize->save('images/promotion/' .$imageName);
        }

        $promotion->image = 'images/promotion/'.$imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $promotion->slug = $slug;
        $promotion->status = $request->status;
        $promotion->save();
        toast('Promotion Added Successfully','success');
        return redirect()->route('admin.promotion.index');
    }

    public function update(Request $request, $id)
    {
        $promotion = Promotion::find($id);
        if($file = $request->file('image')) {
            if(($promotion->image) AND !empty($promotion->image)){
                unlink($promotion->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(353.72, 191.19);
            $image_resize->save('images/promotion/' .$imageName);
            $imageName = 'images/promotion/' .$imageName;
        } else{
            $imageName = $promotion->image;
        }
        $promotion->name = $request->name;
        $promotion->image = $imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $promotion->slug = $slug;
        $promotion->status = $request->status;
        $promotion->save();
        toast('Promotion Updated Successfully','info');
        return redirect()->route('admin.promotion.index');
    }

    public function destroy($id)
    {
        $promotion = Promotion::find($id);
        if(file_exists($promotion->image) AND !empty($promotion->image)){
            unlink($promotion->image);
        }
        PromotionProduct::whereIn('promotion_id',[$promotion->id])->delete();
        $promotion->delete();
        toast('Promotion Successfully Deleted','error');
        return redirect()->route('admin.promotion.index');
    }

    public function promotionProducts($id){
        $products = PromotionProduct::where('promotion_id',$id)->paginate(20);
        return view('admin.promotion.promotion_products',compact('products'));
    }

    public function promotionProductStore(Request $request)
    {
        $this->validate($request,
            ['promotion_id' => 'required',
                'product_id' => 'required',
                'offer_price' => 'required',
                'status' => 'required'
            ]);

        $product = new Promotionproduct();
        $product->promotion_id = $request->promotion_id;
        $product->product_id = $request->product_id;
        $product->offer_price = $request->offer_price;
        $product->status = $request->status;
        $findProduct = Product::findOrFail($request->product_id);
        $result = (($findProduct->unit_price - $request->offer_price)*100)
            /$findProduct->unit_price;
//        $result = ($findProduct->unit_price * $request->offer_price) / 100;
        $product->percentage = round($result).'%';

        $check = Promotionproduct::where('promotion_id', $request->promotion_id)
            ->where('product_id', $request->product_id)
            ->get();
        if (sizeof($check) > 0) {
            Toastr::info('Product Already Added On This Promotion');
            return redirect()->back();

        } else {
            $product->save();
            Toastr::success('Product Successfully Added');
            return redirect()->back();
        }
    }

        public function promotionProductUpdate(Request $request,$id){
            $this->validate($request,[
                'promotion_id'=>'required',
                'product_id'=>'required',
                'offer_price'=>'required',
                'status'=>'required'
            ]);

            $product = Promotionproduct::find($id);
            $product->promotion_id = $request->promotion_id;
            $product->product_id = $request->product_id;
            $product->offer_price = $request->offer_price;
            $findProduct = Product::findOrFail($request->product_id);
            $result = (($findProduct->unit_price - $request->offer_price)*100)
                /$findProduct->unit_price;
//            $result = ($findProduct->unit_price * $request->offer_price) /100;
            $product->percentage = round($result).'%';
            $product->status = $request->status;
            $product->save();
            Toastr::success('Product Successfully Updated');
            return redirect()->back();
        }

        public function promotionProductDestroy($id){
            $product = Promotionproduct::find($id);
            $product->delete();
            Toastr::error('Product Successfully Removed');
            return redirect()->back();
        }

}
