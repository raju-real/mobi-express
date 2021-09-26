<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Category;
use App\Model\Product;
use App\Model\SubCategory;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
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
        $category->slug = strtolower(Str::slug($request->name));
        if(isset($request->image) && $request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());              
            $image_resize->resize(987.75, 215.5);
            $image_resize->save('images/category/' .$imageName);
            $category->image = 'images/category/'.$imageName;
        }
        $category->serial = $request->serial;
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
        $category->slug = strtolower(Str::slug($request->name));
        if($file = $request->file('image')) {
            if(file_exists($category->image) AND !empty($category->image)){
                unlink($category->image);
            }
            $image = $request->file('image');
            $name = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());              
            $image_resize->resize(987.75, 215.5);
            $image_resize->save('images/category/' .$name);
            $imageName = 'images/category/'.$name;
            
        } else{
                $imageName = $category->image;
        }
        $category->image = $imageName;  
        $category->serial = $request->serial;  
        $category->save();
        toast('Category Update Successfully','info');
        return redirect()->route('admin.category.index');

    }

   
    public function destroy($id){
        $category = Category::find($id);
        if(SubCategory::where('category_id',$id)->exists()){
            return redirect()->route('admin.category.index')
                ->with('message','This category added on subcategory,update or delete first');
        } elseif(Product::where('category_id',$id)->exists()){
            return redirect()->route('admin.category.index')
                ->with('message','This category added on product,update or delete first');
        } else {
            if(file_exists($category->image) AND !empty($category->image)){
                unlink($category->image);
            }
            $category->delete();
            Toastr::warning('Category Successfully Delete','success');
        }
        return redirect()->route('admin.category.index');
    }
}
