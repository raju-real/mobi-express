<?php

namespace App\Http\Controllers\Admin;

use Alert;
use App\Http\Controllers\Controller;
use App\Model\AboutUs;
use App\Model\ContactUs;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class AboutContactController extends Controller
{
    public function aboutUs(){
        $about = AboutUs::first();
        return view('admin.basic.about_us',compact('about'));
    }

    public function updateAboutUs(Request $request){
        $about = AboutUs::first();
        if($request->file('image') != null) {
            $this->validate($request,['image'=>'mimes:jpg,png,jpeg']);
            if(file_exists($about->image) AND !empty($about->image)){
                unlink($about->image);
            }
            $image = $request->file('image');
            $imageName = time().$image->getClientOriginalName();
            $image_resize = Image::make($image->getRealPath());
            $image_resize->resize(1770, 900);
            $image_resize->save('images/basic/' .$imageName);
            $about->image = 'images/basic/'.$imageName;
        } 
        if(isset($request->about_us)){
            $about->about_us = $request->about_us;
        }
        $about->save();
        Alert::success('Successfully Update');
        return redirect(route('admin.about-us'));
    }

    public function contactUs(){
        $contact = ContactUs::first();
        return view('admin.basic.contact_us',compact('contact'));
    }

    public function updateContactUs(Request $request){
        $contact = ContactUs::first();
        if(isset($request->mobile)){
            $contact->mobile = $request->mobile;
        }
        if(isset($request->email)){
            $contact->email = $request->email;
        }
        if(isset($request->phone)){
            $contact->phone = $request->phone;
        }
        if(isset($request->map_link)){
            $contact->map_link = $request->map_link;
        }
        if(isset($request->office_info)){
            $contact->office_info = $request->office_info;
        }
        if(isset($request->address)){
            $contact->address = $request->address;
        }
        $contact->save();
        Alert::success('Contact Update Successfully');
        return redirect(route('admin.contact-us'));
    }
}
