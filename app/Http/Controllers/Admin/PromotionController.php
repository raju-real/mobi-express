<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Promotion;
use App\Model\PromotionProduct;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
Use Alert;

class PromotionController extends Controller
{
    public function index(){
        $promotions = Promotion::orderBy('serial','asc')
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
            //$image_resize->resize(353.72, 191.19);
            $image_resize->save('images/promotion/' .$imageName);
        }

        $promotion->image = 'images/promotion/'.$imageName;
        $slug = preg_replace('/\s+/', '-', $request->name);
        $promotion->slug = $slug;
        $promotion->serial = $request->serial;
        $promotion->status = $request->status;
        $promotion->save();
        Toastr::info('Promotion Added Successfully','success');
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
            //$image_resize->resize(353.72, 191.19);
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
        Toastr::info('Promotion Updated Successfully','info');
        return redirect()->route('admin.promotion.index');
    }

    public function destroy($id)
    {
        $promotion = Promotion::find($id);
        if(file_exists($promotion->image) AND !empty($promotion->image)){
            unlink($promotion->image);
        }
        $products = PromotionProduct::where('promotion_id',$id)->pluck('product_id');
        Product::whereIn('id',$products)->update(['discount_price'=>0]);
        PromotionProduct::whereIn('promotion_id',[$promotion->id])->delete();
        $promotion->delete();
        Toastr::info('Promotion Successfully Deleted','error');
        return redirect()->route('admin.promotion.index');
    }

    public function promotionProducts($slug){
        $promotion = Promotion::where('slug',$slug)->first();
        $promotionProducts = PromotionProduct::with('product')->where('promotion_id',$promotion->id)->get();
        return view('admin.promotion.promotion_products',compact('promotionProducts','promotion'));
    }

    public function createPromotionProduct($slug){
        $promotion = Promotion::where('slug',$slug)->first();
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        return view('admin.promotion.create_edit_promotion_products',compact('promotion','products'));
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
            Toastr::info('Product Already Added On This Promotion','error');
            return redirect()->back();

        } else {
            $product = new PromotionProduct();
            $product->promotion_id = $request->promotion_id;
            $product->product_id = $request->product_id;
            $product->status = $request->status;
            $findProduct = Product::findOrFail($request->product_id);
            if($request->status == 0){
                $findProduct->update(['discount_price'=>0]);
            } else{
                $product->unit_price = $findProduct->unit_price;
                if($request->discount > $product->unit_price){
                    Toastr::info('Invalid Price','error');
                    return redirect()->back();
                }
                // Change price to product
                $findProduct->discount_price = $request->discount;
                $findProduct->save();
            }
            $product->unit_price = $findProduct->unit_price;
            $product->discount_price = $request->discount;
            $product->save();
            Toastr::info('Product Successfully Added','success');
            return redirect()->back();
        }
    }

    public function editPromotionProduct($id){
        $promotionProduct = PromotionProduct::find($id);
        $product = Product::find($promotionProduct->product_id);
        $promotion = Promotion::find($promotionProduct->promotion_id);
        $products = Product::where('discount_price','==',0)
            ->select('id','name','unit_price')
            ->get();
        return view('admin.promotion.create_edit_promotion_products',compact('promotion','product','products','promotionProduct'));
    }

    public function promotionProductUpdate(Request $request,$id){
        $this->validate($request,[
            'product_id'=>'required',
            'discount'=>'required',
            'status'=>'required'
        ]);

        $promotionProduct = PromotionProduct::find($id);
        $promotion = Promotion::find($promotionProduct->promotion_id);
        $promotionProduct->product_id = $request->product_id;
        $product = Product::find($request->product_id);
        if($request->discount > $product->unit_price){
            Toastr::info('Invalid Price','error');
            return redirect()->back();
        }

        $promotionProduct->unit_price = $product->unit_price;
        $promotionProduct->discount_price = $request->discount;
        $promotionProduct->status = $request->status;

        if($request->status == 0){
            $product->update(['discount_price'=>0]);
        } else{
            $product->update(['discount_price'=>$request->discount]);
        }
        $promotionProduct->save();

        Toastr::info('Product Successfully Updated');
        return redirect()->route('admin.promotion-products',$promotion->slug);
    }

    public function changePromotionProductStatus(){
        $promotionProductId = request()->get('id');
        $promotion_slug = request()->get('slug');
        PromotionProduct::findOrFail($promotionProductId)->update(['status'=>request()->get('status')]);
        Toastr::info('Status Changed Successfully');
        return redirect()->route('admin.promotion-products',$promotion_slug);
        return response()->json(['status'=>'success']);
    }

    public function updatePromotionProductStatus(){
        $promotion_id = request()->get('promotion_id');
        $promotion_slug = Promotion::findOrFail($promotion_id)->slug;
        $action = request()->get('action');
        if($action === 'active-all'){
            // PromotionProduct::whereIn('promotion_id',[$promotion_id])->update(['status'=>1]);
            $promotionProducts = PromotionProduct::whereIn('promotion_id',[$promotion_id])->get();
            foreach($promotionProducts as $p_p){
                Product::where('id',$p_p->product_id)->update(['discount_price'=>$p_p->discount_price]);
                PromotionProduct::where('id',$p_p->id)->update(['status'=>1]);
            }
        } elseif($action === 'in-active-all'){
             PromotionProduct::whereIn('promotion_id',[$promotion_id])->update(['status'=>0]);
             $products = PromotionProduct::whereIn('promotion_id',[$promotion_id])->pluck('product_id');
             Product::whereIn('id',$products)->update(['discount_price'=>0]);
        }

        Toastr::info('Status Update Successfully');
        return redirect()->route('admin.promotion-products',$promotion_slug);
    }

    public function promotionProductDestroy($id){
        $promotionProduct = Promotionproduct::find($id);
        Product::find($promotionProduct->product_id)->update(['discount_price'=>0]);
        $promotionProduct->delete();
        Toastr::error('Product Successfully Removed');
        return redirect()->back();
    }

}
