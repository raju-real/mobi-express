<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use App\Model\Product;
use App\Model\Category;
use App\Model\SubCategory;
use App\Model\Brand;
use App\Model\Color;
use App\Model\Unit;
use App\Model\Size;
use App\Model\ProductImage;
use Alert;

class ProductController extends Controller
{
    public function index(){   
        $limit = request()->get('limit');
        $data = Product::query();
        $category_id = request()->get('category_id');
        $subcategory_id = request()->get('subcategory_id');
        $stock_status = request()->get('stock_status');
        $name = request()->get('name');
        $most_view = request()->get('most_view');
        if(isset($name) && !empty($name)){
            $data->where('name','like',"%{$name}%");
        }
        if(isset($category_id) && !empty($category_id)){
            $data->where('category_id',$category_id);
        }
        if(isset($subcategory_id) && !empty($subcategory_id)){
            $data->where('subcategory_id',$subcategory_id);
        }
        if(isset($stock_status)){
            $data->where('stock_status',$stock_status);
        }
        if(isset($most_view)){
            $data->orderBy('view_count','DESC');
        }
        $products = $data->paginate($limit);
        $categories = Category::all();
        return view('admin.product.index',compact('products','categories'));
    }

    public function create()
    {
        $categories = Category::all();
        $subcategories = SubCategory::all();
        $brands = Brand::all();
        $colors = Color::all();
        $units = Unit::all();
        $sizes = Size::all();
        return view('admin.product.create',compact('categories','subcategories','brands','colors','units','sizes'));
    }

    public function store(Request $request){
        $this->validate($request,[
            'name' => 'required',
            'category_id' => 'required',
            'product_details' => 'required',
            'unit_price' => 'required',
            'images' => 'required'
        ]);

        $product =  new Product();
        $product->category_id = (int)$request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->brand_id = $request->brand_id;
        $product->product_code = $request->product_code;
        $product->name = $request->name;
        $product->slug = strtolower(Str::slug($request->name));
        $product->short_description = $request->short_description;
        $product->product_details = $request->product_details;
        $product->specification = $request->specification;
        $product->unit_price = $request->unit_price;
        $product->discount_price = $request->discount_price ?? 0;
        // if($request->discount_price){
        //     $product->discount_price = $request->discount_price;
        //     $result = (($request->unit_price - $request->discount_price)*100)/$request->unit_price;
        //     $product->percentage = round($result);
        // } else{
        //     $product->discount_price = 0;
        // }
        $product->stock_status = $request->stock_status;
        $product->quantity = $request->quantity;
        $product->special_note = $request->special_note;
        $product->video_link = $request->video_link;
        $product->save();
        $product->units()->sync($request->units);
        if($request->sizes)$product->sizes()->sync($request->sizes);
        if($request->colors)$product->colors()->sync($request->colors);
        if($request->hasfile('images'))
        {
            foreach($request->file('images') as $image)
            {
                $imageName = time().$image->getClientOriginalName();
                $image_resize = Image::make($image->getRealPath());
                $image_resize->resize(600, 600);
                $image_resize->filesize(100);
                $image_resize->save('images/product/' .$imageName);
                $data[] = $imageName;
                $images = new ProductImage();
                $images->product_id = $product->id;
                $images->image = 'images/product/'.$imageName;
                //return 253;
                $images->save();
            }
        }

        Alert::success('Product Successfully Added');
        return redirect()->back();
    }

    public function show($slug)
    {
        $product = Product::where('slug',$slug)->first();
        return view('admin.product.show',compact('product'));
    }

    public function edit($slug)
    {
        $product = Product::where('slug',$slug)->first();
        $categories = Category::all();
        $subcategories = SubCategory::all();
        $brands = Brand::all();
        $colors = Color::all();
        $units = Unit::all();
        $sizes = Size::all();
        return view('admin.product.edit',compact('product','categories','subcategories','brands','colors','units','sizes'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'name' => 'required',
            'category_id' => 'required',
            'product_details' => 'required',
            'unit_price' => 'required'
        ]);
        $product = Product::findOrFail($id);
        $product->category_id = (int)$request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->brand_id = $request->brand_id;
        $product->product_code = $request->product_code;
        $product->name = $request->name;
        $product->slug = strtolower(Str::slug($request->name));
        $product->short_description = $request->short_description;
        $product->product_details = $request->product_details;
        $product->specification = $request->specification;
        $product->unit_price = $request->unit_price;
        $product->discount_price = $request->discount_price ?? 0;
        // $product->discount_price = $request->discount_price;
        // if($request->discount_price){
        //     $product->discount_price = $request->discount_price;
        //     $result = (($request->unit_price - $request->discount_price)*100)/$request->unit_price;
        //     $product->percentage = round($result);
        // } else{
        //     $product->discount_price = 0;
        // }
        $product->stock_status = $request->stock_status;
        $product->quantity = $request->quantity;
        $product->special_note = $request->special_note;
        $product->video_link = $request->video_link;
        if($request->hasfile('images'))
        {
            foreach($request->file('images') as $image)
            {
                $imageName = time().$image->getClientOriginalName();
                $image_resize = Image::make($image->getRealPath());
                $image_resize->resize(600, 600);
                $image_resize->filesize(100);
                $image_resize->save('images/product/' .$imageName);
                $data[] = $imageName;
                $images = new ProductImage();
                $images->product_id = $product->id;
                $images->image = 'images/product/'.$imageName;
                //return 253;
                $images->save();
            }
        }
        $product->save();
        $product->units()->sync($request->units);
        if($request->sizes)$product->sizes()->sync($request->sizes);
        if($request->colors)$product->colors()->sync($request->colors);
        
        Alert::info('Product Successfully Updated');
        return redirect()->route('admin.product.index');

    }

    public function removeImage($id){
        $image = ProductImage::findOrFail($id);
        $slug = Product::where('id',$image->product_id)->first()->slug;
        if(file_exists($image->image) AND !empty($image->image)){
        unlink($image->image);
        }
        $image->delete();
        return redirect()->route('admin.product.edit',$$slug);
    }

    public function destroy($id)
    {
        if (file_exists('images/category/' . $category->image) and !empty($category->image)) {
            unlink('images/category/' . $category->image);
        }
        return redirect()->route('admin.product.index')->with(['message' => 'Product Deleted Successfully', 'type' => 'danger']);

    }
}
