<?php

namespace App\Http\Controllers;
use App\Model\Cart;
use App\Model\Division;
use App\Model\Favorite;
use App\Model\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class HomePageController extends Controller
{
    public function index(){
        $products = Product::all();
        return view('welcome',compact('products'));
    }

    public function productDetails($slug){
        $product = Product::where('slug',$slug)->first();
        return view('pages.product_details',compact('product'));
    }

    public function addToCart(Request $request){
        if(empty(Session::get('session_id'))){
            Session::put('session_id', Str::random(20));
        }
        $session_id       = Session::get('session_id');
        $product_id       = $request->product_id;
        $product          = Product::find($product_id);
        if(Cart::where('session_id',$session_id)->where('product_id',$product_id)->exists()){
            //return redirect()->route('product_details', $product->slug)->with(['message' => 'Product Already Added To Cart', 'type' => 'danger']);
            return response()->json([
                'message' => 'Product Already Added To Cart',
                'type' => 'danger'
            ]);

        }
        $cart = new Cart();
        $cart->session_id = $session_id;
        $cart->product_id = $product_id;
        $unit_price       = $product->discount_price != null ? $product->discount_price : $product->unit_price;
        $cart->unit_price = $unit_price;
        $quantity         = $request->quantity;
        $cart->quantity   = $quantity;
        $cart->total_price = $unit_price * $quantity;
        $cart->save();
        //return redirect()->route('product_details', $product->slug)->with(['message' => 'Product Successfully Added To Cart', 'type' => 'success']);
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
            $totalPrice = $cart->unit_price * $quantity;
            $cart->quantity = $quantity;
            $cart->total_price = $totalPrice;
            $cart->save();
            // return redirect()->route('carts')->with(['message'=>'Product Quantity Updated','type'=>'success']);
            return response()->json(['message' => 'Product Quantity Updated', 'type' => 'success']);
        } else {
            // return redirect()->route('carts')->with(['message' => 'Invalid Product', 'type' => 'danger']);
            return response()->json(['message' => 'Invalid Product', 'type' => 'danger']);
        }
    }

    public function decrementCartProduct($cart_id){
        $cart = Cart::find($cart_id);
        if (isset($cart)) {
            $quantity = $cart->quantity - 1;
            if($quantity < 1){
                $cart->delete();
                // return redirect()->route('carts')->with(['message' => 'Product Removed From Cart', 'type' => 'danger']);
                return response()->json(['message' => 'Product Removed From Cart', 'type' => 'danger']);
            }
            $totalPrice = $cart->unit_price * $quantity;
            $cart->quantity = $quantity;
            $cart->total_price = $totalPrice;
            $cart->save();
            // return redirect()->route('carts')->with(['message' => 'Product Quantity Updated', 'type' => 'warning']);
            return response()->json(['message' => 'Product Quantity Updated', 'type' => 'warning']);
        } else {
            // return redirect()->route('carts')->with(['message' => 'Invalid Product', 'type' => 'danger']);
            return response()->json(['message' => 'Invalid Product', 'type' => 'danger']);
        }
    }


    public function removeCartProduct($cart_id){
        $cart = Cart::find($cart_id);
        if(isset($cart)){
            $cart->delete();
            // return redirect()->route('carts')->with(['message' => 'Product Removed From Cart', 'type' => 'danger']);
            return response()->json(['message' => 'Product Removed From Cart', 'type' => 'danger']);
        } else{
            // return redirect()->route('carts')->with(['message' => 'Invalid Product', 'type' => 'danger']);
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
            $divisions = Division::all();
            $carts = Cart::with('product')->where('session_id', Session::get('session_id'))->get();
            if(sizeof($carts)>0){
                return view('pages.checkout', compact('carts','divisions'));
            } else{
                return redirect()->route('carts')->with(['message' => 'Your Cart Is Empty', 'type'=> 'danger']);
            }
            
        } else {
            session()->put('url', URL::current());
            return redirect()->route('login');
        }
    }

}
