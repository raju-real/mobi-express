<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use App\Model\Category;
use App\Model\SubCategory;
use App\Model\Product;
Use Alert;

class SubCategoryController extends Controller
{
    public function index(){
        $categories = Category::all();
        $subcategories = SubCategory::all();
        return view('admin.attributes.subcategory',compact('categories','subcategories'));
    }

    public function store(Request $request){
        $request->validate(['category_id'=>'required','name' => 'required']);
        $subcategory = new SubCategory();
        $subcategory->category_id = $request->category_id;
        $subcategory->name = $request->name;
        $subcategory->slug = strtolower(Str::slug($request->name));
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());              
            $image_resize->resize(987.75, 215.5);
            $image_resize->save('images/subcategory/' .$imageName);
        }
        $subcategory->image = 'images/subcategory/'.$imageName;
        $subcategory->save();
        toast('SubCategory Added Successfully','success');
        return redirect()->route('admin.subcategory.index');
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id){
        $request->validate(['category_id'=>'required','name' => 'required']);
        $subcategory = SubCategory::find($id);
        $subcategory->name = $request->name;
        $subcategory->category_id = $request->category_id;
        $subcategory->slug = strtolower(Str::slug($request->name));
        if($file = $request->file('image')) {
            if(file_exists($subcategory->image) AND !empty($subcategory->image)){
                unlink($subcategory->image);
            }
            $image = $request->file('image');
            $name = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());              
            $image_resize->resize(987.75, 215.5);
            $image_resize->save('images/subcategory/' .$name);
            $imageName = 'images/subcategory/'.$name;
            
        } else{
            $imageName = $subcategory->image;
        }
        $subcategory->image = $imageName;
        $subcategory->save();
        toast('SubCategory Update Successfully','info');
        return redirect()->route('admin.subcategory.index');

    }

   
    public function destroy($id){
        $subcategory = SubCategory::find($id);
     	if(Product::where('category_id',$id)->exists()){
            alert()->error('ErrorAlert','This subcategory added on product,update or delete first');
        } else{
            $subcategory->delete();
        }
        toast('Category Successfully Delete','warning');
        return redirect()->route('admin.subcategory.index');
    }
}
