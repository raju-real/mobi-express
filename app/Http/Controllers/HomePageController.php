<?php

namespace App\Http\Controllers;
use App\Model\Cart;
use App\Model\Category;
use App\Model\Division;
use App\Model\Favorite;
use App\Model\FeaturedProduct;
use App\Model\Order;
use App\Model\OrderPrice;
use App\Model\OrderProduct;
use App\Model\Product;
use App\Model\Promotion;
use App\Model\PromotionProduct;
use App\Model\SpecialOffer;
use App\Model\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;
Use Alert;

class HomePageController extends Controller
{
    public function searchProduct(){
        $output="";
        $category_id = request()->get('category_id');
        $product_name = request()->get('product_name');
        if(isset($category_id)){
            $products = Product::where('category_id',$category_id)
            ->where('name','LIKE',"$product_name%")
            ->get();
        } else{
            $products = Product::where('name','LIKE',"{$product_name}%")
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

    public function promotionProducts(){
        $promotion = Promotion::where('status',1)->get();
        $promotion_products = PromotionProduct::whereIn('promotion_id',$promotion->pluck('id'))->get();
        return $promotion_products;
    }

    // public function index(){
    //     $data = Product::query();
    //     $promotion = Promotion::where('status',1)->get();
    //     $promotion_products = PromotionProduct::whereIn('promotion_id',$promotion->pluck('id'));
    //     $data->whereNotIn('id',$promotion_products->pluck('product_id'));
    //     $data->orderBy('updated_at','DESC');
    //     $data->whereNotNull('discount_price');
    //     $featuredProducts = $data->take(20)->get();
    //     //return $featuredProducts;
    //     $categories = Category::all();
    //     $offers = SpecialOffer::with('product')->get();
    //     return view('welcome',compact('featuredProducts','categories','offers'));
    // }

    public function index(){
        $categories = Category::all();
        $offers = SpecialOffer::with('product')->get();
        $featuredProducts = FeaturedProduct::with('product')
            ->orderBy('serial','asc')->take(20)->get();
        // Best Selling Product
        $orderProducts = OrderProduct::all();    
        $bestSellingProducts = Product::whereIn('id',$orderProducts->pluck('product_id'))->distinct()->take(20)->get();    
        return view('welcome',compact('featuredProducts','bestSellingProducts','categories','offers'));
    }

    public function featuredProducts(){
        $ids = FeaturedProduct::orderBy('serial','asc')
        ->select('id')
        ->get();
        $products = Product::whereIn('id',$ids->pluck('id'))
            ->paginate(20);
        $title = 'Featured Products';    
        $pageTitle = 'Featured Products';
        return view('pages.vendor_products',compact('products','title','pageTitle'));
    }

    public function productDetails($slug){
        $product = Product::with('images','sizes','units','colors')
            ->where('slug',$slug)->first();
        $regularProducts = $this->getProducts(); 
        $releatedProducts = $regularProducts->where('category_id',$product->category_id)->take(20);
        //return $releatedProducts;
        return view('pages.product_details',compact('product','releatedProducts'));
    }

    public function categoryProducts($slug){
        $category = Category::where('slug',$slug)->first();
        $promotionProducts = $this->promotionProducts();
        $products = Product::whereNotIn('id',$promotionProducts->pluck('product_id'))
            ->where('category_id',$category->id)
            ->paginate(20);
        $title = $category->name;    
        $pageTitle = 'Category/'.$category->name;
        $image = $category->image;
        //return $products;
        return view('pages.vendor_products',compact('products','title','pageTitle','image'));
    }

    public function subcategoryProducts($slug){
        $subcategory = SubCategory::where('slug',$slug)->first();
        $promotionProducts = $this->promotionProducts();
        $products = Product::whereNotIn('id',$promotionProducts->pluck('product_id'))
            ->where('subcategory_id',$subcategory->id)
            ->paginate(20);
        $title = $subcategory->name;    
        $pageTitle = 'Subcategory/'.$subcategory->name;
        $image = $subcategory->image;
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
        // $carts = Cart::with('product')->where('session_id', Session::get('session_id'))->get();
        return view('pages.carts');
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

    public function applyCoupon($coupon_code){
        $session_id = Session::get('session_id');
        $identify = [
            'session_id'=>$session_id,
            'user_id'=>Auth::id()
        ];
        $order_price = OrderPrice::where($identify)->first();
        //$coupon = Coupon::where('coupon_code',$coupon_code)->first();
        return 150;
        return $coupon_code;
        
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

                $coupon_code = $request->coupon_code;
                if(isset($coupon_code)){
                    $orderPrice = $this->applyCoupon($coupon_code);
                } else{
                    $orderPrice = $totalPrice;
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
                return view('pages.checkout', compact('carts','order_price'));
            } else{
                Alert::error('Your Cart Is Empty');
                return redirect()->route('carts');
            }
            
        } else {
            session()->put('current_url', URL::current());
            return redirect()->route('login');
        }
    }

    public function submitOrder(Request $request){
        if(Auth::check()){
            //return $request;
            $session_id = Session::get('session_id');
            $identify = [
                    'session_id'=>$session_id,
                    'user_id'=>Auth::id()
                ];
            
            // Find order price
            $order_price = OrderPrice::where($identify)->first();

            // Save order info to order table
            $order_info = new Order();
            // Order Info
            $order_info->user_id = Auth::id();
            $order_info->order_number = Order::getOrderNumber();
            $order_info->invoice  = Order::getInvoiceNumber();
            $order_info->delivery_charge = $order_price->delivery_charge;
            $order_info->vat = $order_price->vat;
            $order_info->tax = $order_price->tax;
            $order_info->total_price = $order_price->total_price;
            $order_info->product_discount_price = $order_price->product_discount_price;
            $order_info->order_price = $order_price->order_price;
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
            $order_info->district = $request->district;
            $order_info->city_town = $request->city_town;
            $order_info->address = $request->address;
            $order_info->note = $request->note;
            $order_info->save();

            // Find Cart & Save Order Product
            $carts = Cart::where($identify)->get();
            foreach($carts as $cart){
                $order_product = new OrderProduct();
                $order_product->order_id = $order_info->id;
                $order_product->product_id = $cart->product_id;
                $order_product->order_price = $cart->order_price;
                $order_product->quantity = $cart->quantity;
                $order_product->total_price = $cart->total_price;
                $order_product->save();
                // Delete Cart
                $cart->delete();
            }

            Alert::success('Your Order Placed Successfully');
            return redirect(route('user.dashboard'));

        } else {
            Session::put('current_url',route('checkout'));
            return redirect()->route('login');
        }
    }


}
