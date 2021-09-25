<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Model\Promotion;
use App\Model\PromotionProduct;
use App\Model\Product;
Use Alert;

class PromotionController extends Controller
{
    public function index(){
        $promotions = Promotion::latest()
            ->orderBy('serial','ASC')
            ->paginate(20);
        return view('admin.promotion.index',compact('promotions'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required',
            'image'=>'required',
            'serial'=>'required',
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
        $promotion->serial = $request->serial;
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
        $promotion->serial = $request->serial;
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
        $promotion_id = $id;
        $products = PromotionProduct::where('promotion_id',$id)->paginate(20);
        return view('admin.promotion.promotion_products',compact('products','promotion_id'));
    }

    public function createPromotionProduct($id){
        $promotion = Promotion::find($id);
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        return view('admin.promotion.create_promotion_products',compact('promotion','products'));
    }

    public function storePromotionProduct(Request $request){
        $this->validate($request,
            [
                'promotion_id' => 'required',
                'product_id' => 'required',
                'discount' => 'required',
                'status' => 'required'
            ]);
        $where = [
            'promotion_id'=>$request->promotion_id,
            'product_id'=>$request->product_id
        ];
            
        if (sizeof(PromotionProduct::where($where)->get()) > 0) {
            toast('Product Already Added On This Promotion','error');
            return redirect()->back();

        } else {
            $product = new PromotionProduct();
            $product->promotion_id = $request->promotion_id;
            $product->product_id = $request->product_id;
            $product->discount_type = $request->discount_type;
            $product->status = $request->status;
            $findProduct = Product::findOrFail($request->product_id);
            $product->unit_price = $findProduct->unit_price;

            $result = (($findProduct->unit_price - $request->discount)*100) /
            $findProduct->unit_price;
            $product->percentage = round($result);
            $product->discount_price = $request->discount;
            // Change price to product
            $findProduct->discount_price = $request->discount;
            $findProduct->percentage = round($result);
            $findProduct->save();    
            $product->save();
            toast('Product Successfully Added','success');
            return redirect()->back();
        }
    }

    public function editPromotionProduct($id){
        $promotion = Promotion::find($id);
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        return view('admin.promotion.create_promotion_products',compact('promotion','products'));
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
//      $result = ($findProduct->unit_price * $request->offer_price) /100;
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
