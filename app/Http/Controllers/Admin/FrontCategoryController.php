<?php

namespace App\Http\Controllers\Admin;

use Alert;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\FrontCategory;
use App\Model\FrontCategoryProduct;
use App\Model\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Brian2694\Toastr\Facades\Toastr;

class FrontCategoryController extends Controller
{
    public function index(){
        $frontCategories = FrontCategory::with('category')->get();
        $allCategories = Category::all();
        return view('admin.bind_product.front_categories',compact('frontCategories','allCategories'));
    }

    public function store(Request $request){
        $this->validate($request,['category_id'=>'required','status'=>'required']);
        $front_category = new FrontCategory();
        $front_category->category_id = $request->category_id;
        $category = Category::find($request->category_id);
        $front_category->category_slug = $category->slug;
        $front_category->status = $request->status;
        $front_category->save();
        Toastr::success('Front Category Added Successfully');
        return redirect(route('admin.front-category.index'));
    }

    public function update(Request $request,$id){
        $this->validate($request,['category_id'=>'required','status'=>'required']);
        $front_category = FrontCategory::findOrFail($id);
        $front_category->category_id = $request->category_id;
        $category = Category::find($request->category_id);
        $front_category->category_slug = $category->slug;
        $front_category->status = $request->status;
        $front_category->save();
        Toastr::info('Front Category Update Successfully');
        return redirect(route('admin.front-category.index'));
    }

    public function destroy($id){
        $front_category = FrontCategory::findOrFail($id);
        FrontCategoryProduct::whereIn('front_category_id',[$front_category->id])->delete();
        $front_category->delete();
        Toastr::warning('Front Category Delete Successfully');
        return redirect(route('admin.front-category.index'));
    }

    public function products(){
        $category_slug = request()->get('front-category');
        $front_category = FrontCategory::where('category_slug',$category_slug)
            ->first();
        $f_products = FrontCategoryProduct::where('front_category_id',$front_category->id)
            ->orderBy('serial','asc')
            ->get();
        return view('admin.bind_product.front_category_products',
            compact('f_products','front_category'));
    }

    public function addProductFrom(){
        $front_category = FrontCategory::where('category_slug',request()->get('front-category'))->first();
        $category = Category::find($front_category->category_id);
        $currentProducts = FrontCategoryProduct::all();
        $products = Product::where('category_id',$category->id)
            ->whereNotIn('id',$currentProducts->pluck('product_id'))
            ->get();
        return view('admin.bind_product.front_cat_product_add_edit',compact('products','category'));
    }

    public function editProduct($id){
        $fornt_category_product = FrontCategoryProduct::find($id);
        $front_category = FrontCategory::find($fornt_category_product->front_category_id);
        $currentProducts = FrontCategoryProduct::all();
        $category = Category::find($front_category->category_id);
        $products = Product::where('category_id',$category->id)
            ->whereNotIn('id',$currentProducts->pluck('product_id'))
            ->get();
        return view('admin.bind_product.front_cat_product_add_edit',compact('products','category','fornt_category_product'));
    }

    public function addProduct(Request $request){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);
        $front_category = FrontCategory::where('category_slug',request()->get('category_slug'))->first();
        if(FrontCategoryProduct::where('product_id',$request->product_id)->where('front_category_id',$front_category->id)->exists()){
            toast('Product Already Added','error');
            return redirect()->back();
        }
        $product = new FrontCategoryProduct();
        $product->product_id = $request->product_id;
        $product->front_category_id = $front_category->id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        Toastr::success('Successfully Added');
        return redirect()->route('admin.front-category-products',['front-category'=>$front_category->category_slug]);
    }

    public function updateProduct(Request $request,$id){
        $this->validate($request,[
            'product_id'=>'required',
            'serial'=>'required'
        ]);

        $product = FrontCategoryProduct::find($id);
        $product->product_id = $request->product_id;
        $product->serial = $request->serial;
        $product->status = $request->status;
        $product->save();
        $front_category = FrontCategory::find($product->front_category_id);
        Toastr::info('Successfully Update');
        return redirect()->route('admin.front-category-products',['front-category'=>$front_category->category_slug]);
    }

    public function deleteProduct($id){
        $fornt_category_product = FrontCategoryProduct::find($id);
        $front_category = FrontCategory::find($fornt_category_product->front_category_id);
        $fornt_category_product->delete();
        Toastr::error('Successfully Delete');
        return redirect()->route('admin.front-category-products',['front-category'=>$front_category->category_slug]);
    }


}
