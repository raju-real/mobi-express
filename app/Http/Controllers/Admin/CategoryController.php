<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\SubCategory;
use App\Model\Product;
Use Alert;

class CategoryController extends Controller
{
    public function index(){
        $categories = Category::with('products')->get();
        return view('admin.attributes.category',compact('categories'));
    }

    public function store(Request $request){
        $request->validate(['name' => 'required']);
        $category = new Category();
        $category->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $category->slug = $slug;
        $category->save();
        toast('Category Added Successfully','success');
        return redirect()->route('admin.category.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['name' => 'required']);
        $category = Category::find($id);
        $category->name = $request->name;
        $slug = strtolower(preg_replace('/\s+/', '-', $request->name));
        $category->slug = $slug;
        $category->save();
        toast('Category Update Successfully','info');
        return redirect()->route('admin.category.index');

    }

   
    public function destroy($id){
        $category = Category::find($id);
        if(SubCategory::where('category_id',$id)->exists()){
            alert()->error('ErrorAlert','This category added on subcategory,update or delete first');
        } elseif(Product::where('category_id',$id)->exists()){
            alert()->error('ErrorAlert','This category added on product,update or delete first');
        } else{
            $category->delete();
        }
        toast('Category Successfully Delete','warning');
        return redirect()->route('admin.category.index');
    }
}
