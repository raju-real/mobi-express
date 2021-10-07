<?php

namespace App\Http\Controllers;
use Alert;
use App\Model\Brand;
use App\Model\Cart;
use App\Model\Category;
use App\Model\Coupon;
use App\Model\CouponUserUsed;
use App\Model\Division;
use App\Model\Favorite;
use App\Model\FeaturedProduct;
use App\Model\FrontCategory;
use App\Model\NewArrivals;
use App\Model\Order;
use App\Model\OrderPrice;
use App\Model\OrderProduct;
use App\Model\Product;
use App\Model\Promotion;
use App\Model\PromotionProduct;
use App\Model\Review;
use App\Model\ReviewImage;
use App\Model\ShippingAddress;
use App\Model\SpecialOffer;
use App\Model\SubCategory;
use App\Model\Subscriber;
use App\Model\UserMessage;
use App\Model\VoucherProduct;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class HomePageController extends Controller
{
     public function index(){
        // Promotions
        $promotions = Promotion::orderBy('serial','asc')->where('status',1)
        ->get();
        $categories = Category::inRandomOrder()->take(5)->get();
        $offers = SpecialOffer::with('product')
            ->where('start_date','<=',Carbon::today())
            ->where('end_date','>=',Carbon::today())
            ->where('status',1)->get();
        // Featured Product
        $featuredProducts = FeaturedProduct::with(['product'=>function($query){
            $query->published();
        }])->orderBy('serial','asc')->take(20)->get();
        // Best Selling Product
        $orderProducts = OrderProduct::latest()->take(20)
            ->get()->unique('product_id');
        $bestSellingProducts = Product::whereIn('id',$orderProducts->pluck('product_id'))
            ->published()->get();
        // New Arrivals
        $newArrivals = NewArrivals::with(['product'=>function($query){
                $query->published();
            }])
            ->orderBy('serial','asc')->take(20)->get();
        // Popular Product
        $popularProducts = Review::with(['product'=>function($query){
                $query->published();
            }])
            ->orderBy('rating','desc')
            ->inRandomOrder()
            ->take(5)->get()->unique('product_id');
        $frontCategories = FrontCategory::with('category')
            ->inRandomOrder()->take(3)->get();
        $products = Product::published()->take(20)->get();
        return view('welcome',compact('featuredProducts','bestSellingProducts','categories','offers','popularProducts','frontCategories','newArrivals','promotions','products'));
    }

    public function searchProduct(){
        $output="";
        $category_id = request()->get('category_id');
        $product_name = request()->get('product_name');
        if(isset($category_id)){
            $products = Product::where('category_id',$category_id)
            ->published()
            ->where('name','LIKE',"$product_name%")
            ->get();
        } else{
            $products = Product::where('name','LIKE',"{$product_name}%")
                ->published()
                ->get();
        }

        $output = '';
        foreach($products as $product){
            $name = "'".$product->name."'";
            $url =  route('product-details',$product->slug);
            $output.='<a'.' href='.'"'.$url .'"'
            .'>'
            .$product->name
            .'</a>';
        }
        return response()->json(['data'=>$output]);
        //return Response($output);
    }

    public  function getProducts($take=null,$paginate=null){
        $promotion = Promotion::where('status',1)->get();
        $data = Product::query();
        $promotion_products = PromotionProduct::whereIn('promotion_id',$promotion->pluck('id'));
        $data->whereNotIn('id',$promotion_products->pluck('product_id'));
        $products = [];
        if($take != null){
            $products = $data->take($take)->get();
        } elseif($paginate != null){
            $products = $data->paginate($paginate);
        } else{
            $products = $data->get();
        }
        return $products;
    }

    public function voucherProducts(){
        $ids = VoucherProduct::select('product_id')->get();
        $products = Product::whereIn('id',$ids->pluck('product_id'))
            ->paginate(20);
        $title = 'Voucher Products';
        $pageTitle = 'Voucher Products';
        return view('pages.vendor_products',compact('products','title','pageTitle'));
    }

    public function featuredProducts(){
        $ids = FeaturedProduct::select('product_id')->get();
        $products = Product::whereIn('id',$ids->pluck('product_id'))
            ->published()
            ->paginate(20);
        $title = 'Featured Products';
        $pageTitle = 'Featured Products';
        return view('pages.vendor_products',compact('products','title','pageTitle'));
    }

    public function bestSellingProducts(){
        $ids = OrderProduct::latest()->take(20)->get()
            ->unique('product_id');
        $products = Product::whereIn('id',$ids->pluck('product_id'))
            ->published()
            ->paginate(20);    
        $title = 'Best Selling Products';
        $pageTitle = 'Best Selling Products';
        return view('pages.vendor_products',compact('products','title','pageTitle'));
    }

    public function productDetails($slug){
        $product = Product::with('images','sizes','units','colors','reviews')
            ->published()
            ->where('slug',$slug)->first();
        $productKey = 'product_' . $product->id;

        if (!Session::has($productKey)) {
            $product->increment('view_count');
            Session::put($productKey,1);
        }
        $releatedProducts = Product::where('category_id',$product->category_id)->take(20)->get();
        return view('pages.product_details',compact('product','releatedProducts'));
    }

    public function categoryProducts($slug){
        $category = Category::where('slug',$slug)->first();
        // $promotionProducts = $this->promotionProducts();
        // $products = Product::whereNotIn('id',$promotionProducts->pluck('product_id'))
        //     ->where('category_id',$category->id)
        //     ->paginate(20);
        $products = Product::where('category_id',$category->id)
            ->paginate(20);
        $title = $category->name;
        $pageTitle = 'Category/'.$category->name;
        $image = $category->image;
        //return $products;
        return view('pages.vendor_products',compact('products','title','pageTitle','image'));
    }

    public function campaign(){
        $campaigns = Promotion::where('status',1)->latest()->get();
        return view('pages.campaign',compact('campaigns'));
    }

    public function promotionProducts($slug){
        $promotion = Promotion::where('slug',$slug)->first();
        $promotionProducts = PromotionProduct::where('promotion_id',$promotion->id)->get();
        $products = Product::whereIn('id',$promotionProducts->pluck('product_id'))
            ->paginate(20);
        $title = $promotion->name;
        $pageTitle = 'Promotion/'.$promotion->name;
        $image = $promotion->image;
        //return $products;
        return view('pages.vendor_products',compact('products','title','pageTitle','image'));
    }

    public function subcategoryProducts($slug){
        $subcategory = SubCategory::where('slug',$slug)->first();
        //$promotionProducts = $this->promotionProducts();
        $products = Product::where('subcategory_id',$subcategory->id)
            ->paginate(20);
        $title = $subcategory->name;
        $pageTitle = 'Subcategory/'.$subcategory->name;
        $image = $subcategory->image;
        //return $products;
        return view('pages.vendor_products',compact('products','title','pageTitle','image'));
    }

    public function brandProducts($slug){
        $brand = Brand::where('slug',$slug)->first();
        $products = Product::where('brand_id',$brand->id)
            ->paginate(20);
        $title = $brand->name;
        $pageTitle = 'Brand/'.$brand->name;
        $image = $brand->image;
        //return $products;
        return view('pages.vendor_products',compact('products','title','pageTitle','image'));
    }

    public function addToCart(){
        if(empty(Session::get('session_id'))){
            Session::put('session_id', Str::random(40));
        }
        $session_id       = Session::get('session_id');
        $product_id       = request()->get('product_id');
        $product          = Product::find($product_id);
        if(Cart::where('session_id',$session_id)->where('product_id',$product_id)->exists()){
            return response()->json([
                'message' => 'Product Already Added To Cart',
                'type' => 'danger'
            ]);

        }
        $cart = new Cart();
        $cart->session_id = $session_id;
        $cart->product_id = $product_id;
        $cart->unit_price = $product->unit_price;
        $order_price = $product->discount_price != null ? $product->discount_price : $product->unit_price;
        $quantity = '';
        if(!empty(request()->get('quantity'))){
            $quantity = request()->get('quantity');
        } else{
            $quantity = 1;
        }
        $cart->quantity   = $quantity;
        $cart->order_price = $order_price;
        $cart->total_price = $order_price * $quantity;
        if($product->discount_price > 0){
            $discount = $product->unit_price - $product->discount_price;
            $cart->total_discount_price = $discount * $quantity;
        }
        if(!empty(request()->get('color_id'))){
            $cart->color_id = request()->get('color_id');
        }
        if(!empty(request()->get('size_id'))){
            $cart->size_id = request()->get('size_id');
        }
        $cart->save();
        return response()->json([
            'message'=>'Product Successfully Added To Cart',
            'type'=>'success'
        ]);
    }

    public function shoppingCart(){
        $carts = Cart::with('product')->where('session_id', Session::get('session_id'))->get();
        return view('pages.carts',compact('carts'));
    }

    public function incrementCartProduct($cart_id){
        $cart = Cart::find($cart_id);
        if(isset($cart)){
            $quantity = $cart->quantity + 1;
            $totalPrice = $cart->order_price * $quantity;
            $cart->quantity = $quantity;
            $cart->total_price = $totalPrice;
            if($cart->total_discount_price > 0){
                $cart->total_discount_price = ($cart->unit_price - $cart->order_price) * $quantity;
            }
            $cart->save();
            return response()->json(['message' => 'Product Quantity Updated', 'type' => 'success']);
        } else {
            return response()->json(['message' => 'Invalid Product', 'type' => 'danger']);
        }
    }

    public function decrementCartProduct($cart_id){
        $cart = Cart::find($cart_id);
        if (isset($cart)) {
            $quantity = $cart->quantity - 1;
            if($quantity < 1){
                $cart->delete();
                return response()->json(['message' => 'Product Removed From Cart', 'type' => 'danger']);
            }
            $totalPrice = $cart->order_price * $quantity;
            $cart->quantity = $quantity;
            $cart->total_price = $totalPrice;
            if($cart->total_discount_price > 0){
                $cart->total_discount_price = ($cart->unit_price - $cart->order_price) * $quantity;
            }
            $cart->save();
            return response()->json(['message' => 'Product Quantity Updated', 'type' => 'warning']);
        } else {
            return response()->json(['message' => 'Invalid Product', 'type' => 'danger']);
        }
    }

    public function removeCartProduct(){
        $cart_id = request()->get('cart_id');
        $cart = Cart::find($cart_id);
        if(isset($cart)){
            $cart->delete();
            return response()->json(['message' => 'Product Removed From Cart', 'type' => 'danger']);
        } else{
            return response()->json(['message' => 'Invalid Product', 'type' => 'danger']);
        }
    }

    public function addToFavorite(Request $request){
        $request->validate(['product_id'=>'required']);
        if(Auth::check()){
            $user_id = Auth::id();
            if (Favorite::where('user_id', $user_id)->where('product_id', $request->product_id)->exists()) {
                return response()->json(['message' => 'Product Already Added To Favorite List', 'type' => 'error']);
            }
            $favorite = new Favorite();
            $favorite->product_id = $request->product_id;
            $favorite->user_id = $user_id;
            $favorite->save();
            return response()->json(['message' => 'Product Successfully Added To Favorite List', 'type' => 'success']);
        } else {
            return response()->json(['message' => 'Please Login First', 'type' => 'error','redirect' => "{{ route('login') }}"]);
        }
    }

    public function wishlists(){
        if(Auth::check()){
            $wishlists = Favorite::with(['product'=>function($query){
                $query->select('id','name','slug','quantity','unit_price','discount_price');
            }])
            ->latest()->get();
            return view('pages.wishlists',compact('wishlists'));
        } else {
            if(!empty(Session::get('current_url'))){
                Session::forget('current_url');
            }
            session()->put('current_url', URL::current());
            return redirect()->route('login');
        }

    }

    public function removeFavoriteProduct(){
        $list_id = request()->get('list_id');
        $list = Favorite::find($list_id);
        if(isset($list)){
            $list->delete();
            return response()->json(['message' => 'Product Removed From Wishlist', 'type' => 'danger']);
        } else{
            return response()->json(['message' => 'Invalid Product', 'type' => 'danger']);
        }
    }

    protected function checkUserValidity($coupon_code){
        $coupon = Coupon::where('coupon_code',$coupon_code)->first();
        if($coupon->valid_for == 1){
            return true;
        } elseif($coupon->valid_for == 2){
            return true;
        } else{
            return false;
        }
    }

    protected function checkUserUsedTime($coupon_code){
        $coupon = Coupon::where('coupon_code',$coupon_code)->first();
        $used = CouponUserUsed::where('coupon_code',$coupon_code)
        ->where('user_id',Auth::id())->first();
        if(isset($used)){
            if($used->user_used < $coupon->used_limit){
                return true;
            } else{
                return false;
            }
        } else{
            return true;
        }
    }

    protected function getDiscountAmount($coupon_code){
        $coupon = Coupon::where('coupon_code',$coupon_code)->first();
        if($coupon->discount_type == 1){
            return $coupon->discount;
        } elseif($coupon->discount_type == 2){
            $session_id = Session::get('session_id');
            $identify = [
                'session_id'=>$session_id,
                'user_id'=>Auth::id()
            ];
            $order_price = OrderPrice::where($identify)->first();
            $discount_amount = ($order_price->order_price * $coupon->discount)/100;
            return (int) $discount_amount ;
        } else {
            return "invalid";
        }
    }


    protected function applyCoupon($coupon_code){
        $session_id = Session::get('session_id');
        $identify = [
            'session_id'=>$session_id,
            'user_id'=>Auth::id()
        ];
        $result = '';
        $coupon = Coupon::where('coupon_code',$coupon_code)->first();
        if(isset($coupon)){
            if(($coupon->start_date <= Carbon::today()) AND ($coupon->end_date >= Carbon::today()) AND $coupon->status == 1){
                $user_validation = $this->checkUserValidity($coupon_code);
                if($user_validation == true){
                    $used_time = $this->checkUserUsedTime($coupon_code);
                    if($used_time == true){
                        $orderPrice = OrderPrice::where($identify)->first();
                        if($orderPrice->order_price > $coupon->minimum_cost){
                            $coupon_discount_amount = $this->getDiscountAmount($coupon_code);
                            if($coupon_discount_amount != "invalid"){
                                $orderPrice->order_price = $orderPrice->order_price - $coupon_discount_amount;
                                $orderPrice->coupon_discount = $coupon_discount_amount;
                                $orderPrice->coupon_code = $coupon_code;
                                $orderPrice->save();
                                $result = 'Coupon Applied Successfully';
                            } else{
                                $result = "Invalid Coupon";
                            }
                        } else{
                            $result = "Minimum Cost ".$coupon->minimum_cost;
                        }
                    } else {
                        $result = 'You Already Used This Coupon';
                    }
                } else{
                    $result = 'You Are Not Valid For This Coupon';
                }
            } else{
                $result = 'Coupon Expired';
            }
        } else {
            $result = 'Invalid Coupon Code';
        }

        return $result;

    }

    public function checkout(Request $request){
        if (Auth::check()) {
            if(!empty(Session::get('current_url'))){
                Session::forget('current_url');
            }
            $session_id = Session::get('session_id');
            // put user id on cart
            Cart::where('session_id',$session_id)
                ->update(['user_id'=>Auth::id()]);

            $carts = Cart::with(['product'=>function($query){
                $query->select('id','name');
            }])->where('session_id',$session_id)->get();

            if(sizeof($carts)>0){
                // Set Order Price
                $identify = [
                    'session_id'=>$session_id,
                    'user_id'=>Auth::id()
                ];
                $totalPrice = $carts->sum('total_price');
                $productDiscountPrice = $carts->sum('total_discount_price');
                $checkCurrent = OrderPrice::where($identify)->first();
                if(isset($checkCurrent) AND $checkCurrent->coupon_code != null){
                    $orderPrice = $checkCurrent->order_price;
                } else {
                    $orderPrice = $totalPrice;
                    Session::forget('coupon_message');
                }

                $data = [
                    'session_id' => $session_id,
                    'user_id' => Auth::id(),
                    'total_price' => $totalPrice,
                    'order_price'=> $orderPrice,
                    'product_discount_price' => $productDiscountPrice
                ];

                OrderPrice::updateOrInsert($identify,$data);
                $order_price = OrderPrice::where($identify)->first();
                // Apply Coupon
                $coupon_code = request()->get('coupon_code');
                if(isset($coupon_code)){
                    $currentOrderPrice = OrderPrice::where($identify)->first();
                    if($currentOrderPrice->coupon_code == null){
                        $result = $this->applyCoupon($coupon_code);
                        Session::put('coupon_message',$result);
                    } else{
                        Session::forget('coupon_message');
                    }
                }
                $shipping = ShippingAddress::with('district_name')
                    ->where('user_id',Auth::id())->first();
                return view('pages.checkout', compact('carts','order_price','shipping'));
            } else{
                Alert::error('Your Cart Is Empty');
                return redirect()->route('carts');
            }

        } else {
            session()->put('current_url', URL::current());
            return redirect()->route('login');
        }
    }

    public function removeCoupon(){
        $coupon_code = request()->get('coupon_code');
        if(Coupon::where('coupon_code',$coupon_code)->exists()){
            $session_id = Session::get('session_id');
            $identify = [
                'session_id'=>$session_id,
                'user_id'=>Auth::id()
            ];
            $orderPrice = OrderPrice::where($identify)
                ->where('coupon_code',$coupon_code)->first();
            if(isset($orderPrice)){
                $orderPrice->order_price = $orderPrice->order_price + $orderPrice->coupon_discount;
                $orderPrice->coupon_code = null;
                $orderPrice->coupon_discount = 0;
                $orderPrice->save();
                Session::put('coupon_message','Coupon Removed Successfully');
                return redirect(route('checkout'));
            } else{
                Session::put('coupon_message','Coupon Not Found');
                return redirect(route('checkout'));
            }
        } else{
            Session::put('coupon_message','Invalid Coupon');
            return redirect(route('checkout'));
        }
    }

    public function submitOrder(Request $request){
        $this->validate($request,[
            'name' => 'required',
            'mobile' => 'required|min:11',
            'district_id' => 'required',
            'city_town' => 'required',
            'address' => 'required',
            'payment_method' => 'required'
        ]);
        if(Auth::check()){
            $session_id = Session::get('session_id');
            $identify = [
                    'session_id'=>$session_id,
                    'user_id'=>Auth::id()
                ];

            // Find order price
            $order_price = OrderPrice::where($identify)->first();

            // Save order info to order table
            $order_info = new Order();
            $order_info->user_id = Auth::id();
            $order_info->order_number = Order::getOrderNumber();
            $order_info->invoice  = Order::getInvoiceNumber();
            $order_info->delivery_charge = $order_price->delivery_charge;
            $order_info->vat = $order_price->vat;
            $order_info->tax = $order_price->tax;
            $order_info->total_price = $order_price->total_price;
            $order_info->payment_method = $request->payment_method;
            $order_info->product_discount_price = $order_price->product_discount_price;
            $order_info->order_price = $order_price->order_price;
            $order_info->partial_payment = ($order_price->order_price * 30) / 100;
            $order_info->due_amount = $order_price->order_price;
            if($order_price->coupon_code != null){
                $order_info->has_coupon = 'yes';
                $order_info->coupon_code = $order_price->coupon_code;
                $order_info->coupon_discount_amount = $order_price->coupon_discount;
                $order_info->total_discount_amount = $order_price->product_discount_price + $order_price->coupon_discount;
            } else{
                $order_info->total_discount_amount = $order_price->product_discount_price;
                $order_info->coupon_discount_amount = 0;
            }

            // Basic Info
            $order_info->name = $request->name;
            $order_info->mobile = $request->mobile;
            $order_info->email = $request->email;
            $order_info->district_id = $request->district_id;
            $order_info->city_town = $request->city_town;
            $order_info->address = $request->address;
            $order_info->note = $request->note;
            $order_info->save();

            // Find Cart & Save Order Product
            $carts = Cart::where($identify)->get();
            foreach($carts as $cart){
                $order_product = new OrderProduct();
                $order_product->user_id = Auth::id();
                $order_product->order_id = $order_info->id;
                $order_product->product_id = $cart->product_id;
                $order_product->size_id = $cart->size_id;
                $order_product->color_id = $cart->color_id;
                $order_product->order_price = $cart->order_price;
                $order_product->quantity = $cart->quantity;
                $order_product->total_price = $cart->total_price;
                $order_product->save();
                // Delete Cart
                $cart->delete();
            }

            // Save coupon user used
            if($order_price->coupon_code != null){
                $coupon_user = CouponUserUsed::where('coupon_code',$order_price->coupon_code)
                    ->where('user_id',Auth::id())->first();
                if(isset($coupon_user)){
                    $coupon_user->update(['user_used'=>$coupon_user->user_used + 1]);
                } else{
                    $new = new CouponUserUsed();
                    $new->order_id = $order_info->id;
                    $new->user_id = Auth::id();
                    $new->coupon_code = $order_price->coupon_code;
                    $new->user_used = 1;
                    $new->save();
                }
            }

            // Delete Order Price
            $order_price->delete();
            if($request->payment_method == 1){
                Alert::success('Your Order Placed Successfully');
                return redirect(route('user.order-history'));
            } elseif($request->payment_method == 3){
                Alert::success("Order Placed Successfully, Pay Here");
                return redirect()->route('pay-here',['invoice'=>$order_info->invoice]);
            }
            

        } else {
            Session::put('current_url',route('checkout'));
            return redirect()->route('login');
        }
    }

    public function sendMessage(Request $request){
        $this->validate($request,[
            'name'=>'required',
            'mobile'=>'required',
            'subject'=>'required',
            'message'=>'required'
        ]);
        $message = new UserMessage();
        $message->name = $request->name;
        $message->mobile = $request->mobile;
        $message->email = $request->email;
        $message->subject = $request->subject;
        $message->message = $request->message;
        $message->save();
        return redirect()->route('contact-us')->with('message','Your message sent successfully. Our admin will contact with you');
    }

    public function subscribe(Request $request){
        $this->validate($request,['email'=>'required|unique:subscribers']);
        $subscriber = new Subscriber();
        $subscriber->email = $request->email;
        $subscriber->save();
        Alert::success('Successfully Subscribed');
        return redirect()->route('home');
    }

    public function submitReview(Request $request){
        $product = Product::where('id',$request->product_id)->select('id','slug')->first();
        if(Auth::check()){
            $this->validate($request,[
            'rating'=>'required',
            'review'=>'required',
            'product_id'=>'required'
            ]);
            if(OrderProduct::where('user_id',Auth::id())
                ->where('product_id',$product->id)
                ->exists()){
                $review = new Review();
                $review->user_id = Auth::id();
                $review->product_id = $product->id;
                $review->rating = $request->rating;
                $review->review = $request->review;
                $review->save();
                if($request->hasfile('images')){
                    foreach($request->file('images') as $image){
                        $imageName = time().$image->getClientOriginalName();
                        $image_resize = Image::make($image->getRealPath());
                        $image_resize->resize(300, 250);
                        $image_resize->filesize(100);
                        $image_resize->save('images/review/' .$imageName);
                        $data[] = $imageName;
                        $image = new ReviewImage();
                        $image->review_id = $review->id;
                        $image->image = 'images/review/'.$imageName;
                        $image->save();
                    }
                }

                Alert::success('Thank You For Your Review');
                return redirect()->back()->with('message','');
            } else{
                Alert::info('Product Not Found On Your Order List');
                return redirect()->back();
            }

        } else{
            Session::put('current_url',route('product-details',['slug'=>$product->slug]));
            return redirect(route('login'));
        }

    }


}
