<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Model\Cart;
use App\Model\Division;
use App\Model\Favorite;
use App\Model\Product;
use App\Model\Category;
use App\Model\SubCategory;
use App\Model\Promotion;
use App\Model\PromotionProduct;
Use Alert;

class HomePageController extends Controller
{
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

    public function index(){
        $data = Product::query();
        $promotion = Promotion::where('status',1)->get();
        $promotion_products = PromotionProduct::whereIn('promotion_id',$promotion->pluck('id'));
        $data->whereNotIn('id',$promotion_products->pluck('product_id'));
        $data->orderBy('updated_at','DESC');
        $data->whereNotNull('discount_price');
        $featuredProducts = $data->take(20)->get();
        //return $featuredProducts;
        $categories = Category::all();
        return view('welcome',compact('featuredProducts','categories'));
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
        $quantity         = 1;
        $cart->quantity   = $quantity;
        $cart->order_price = $order_price;
        $cart->total_price = $order_price * $quantity;
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

    public function checkout(){
        if (Auth::check()) {
            if(!empty(Session::get('url'))){
                Session::forget('url');
            }
            $carts = Cart::with('product')->where('session_id', Session::get('session_id'))->get();
            if(sizeof($carts)>0){
                return view('pages.checkout', compact('carts'));
            } else{
                return redirect()->route('carts')->with(['message' => 'Your Cart Is Empty', 'type'=> 'danger']);
            }
            
        } else {
            session()->put('url', URL::current());
            return redirect()->route('login');
        }
    }


}
