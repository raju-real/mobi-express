<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Slider;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use Alert;

class SliderController extends Controller
{
    public function index(){
        $sliders = Slider::all();
        return view('admin.slider.index',compact('sliders'));
    }

    public function store(Request $request)
    {
        $this->validate($request,['title' => 'required','image' => 'required']);
        $slider = new Slider();
        if($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(1349, 418);
            $image_resize->save('images/slider/' .$imageName);
        }

        $slider->title = $request->title;
        $slider->image = 'images/slider/'.$imageName;
        $slider->slug = strtolower(Str::slug($request->title));
        $slider->status = $request->status;
        $slider->save();
        toast('Slider Image Successfully Added','success');
        return redirect()->route('admin.slider.index');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $slider = Slider::find($id);
        if($file = $request->file('image')) {
            if(file_exists($slider->image) AND !empty($slider->image)){
                unlink($slider->image);
            }
            $image = $request->file('image');
            $name = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(1349, 418);
            $image_resize->save('images/slider/' .$name);
            $imageName = 'images/slider/'.$name;
        } else{
            $imageName = $slider->image;
        }
        $slider->title = $request->title;
        $slider->image = $imageName;
        $slider->slug = strtolower(Str::slug($request->title));
        $slider->status = $request->status;
        $slider->save();
        toast('Slider Image Successfully Updated','info');
        return redirect()->route('admin.slider.index');
    }

    public function destroy($id)
    {
        $slider = Slider::find($id);
        if(file_exists($slider->image) AND !empty($slider->image)){
            unlink($slider->image);
        }
        $slider->delete();
        toast('Slider Image Successfully Deleted','error');
        return redirect()->route('admin.slider.index');
    }

    // Slider Product Activity

    public function sliderProducts ($id){
        $slider = Slider::find($id);
        $products = Product::latest()->get();
        $sliderProducts = Sliderproduct::with('product')
            ->where('slider_id',$id)->get();
        return view('super.slider.slider_products',
            compact('sliderProducts','products','slider'));
    }

    public function sliderProductStore(Request $request)
    {
        $this->validate($request,
            [
                'slider_id' => 'required',
                'product_id' => 'required',
                'status' => 'required'
            ]);

        $product = new Sliderproduct();
        $product->slider_id = $request->slider_id;
        $product->product_id = $request->product_id;
        $product->offer_price = $request->offer_price;
        $product->status = $request->status;
        $check = Sliderproduct::where('slider_id', $request->slider_id)
            ->where('product_id', $request->product_id)->get();
        if (sizeof($check) > 0) {
            Toastr::info('Product Already Added On This Slider');
            return redirect()->back();

        } else {
            $product->save();
            Toastr::success('Product Successfully Added');
            return redirect()->back();
        }
    }

    public function sliderProductUpdate(Request $request,$id){
        $this->validate($request,[
            'slider_id'=>'required',
            'product_id'=>'required',
            'status'=>'required'
        ]);

        $product = Sliderproduct::find($id);
        $product->slider_id = $request->slider_id;
        $product->product_id = $request->product_id;
        $product->offer_price = $request->offer_price;
        $product->status = $request->status;
        $product->save();
        toast('Product Successfully Updated','success');
        return redirect()->route('super.slider_product',$request->slider_id);
    }

    public function sliderProductDestroy($id){
        $product = Sliderproduct::find($id);
        $product->delete();
        Toastr::error('Product Successfully Removed');
        return redirect()->back();
    }
}
