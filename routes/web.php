<?php
//https://bootsnipp.com/tags/ecommerce?page=1       Design Helper
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Model\Product;
include 'admin.php'; // Admin Routes
include 'user.php'; // User Routes

//Auth::routes();


// Basic Activity Routes
Route::get('/','HomePageController@index')->name('home');
Route::get('search-product','HomePageController@searchProduct')
    ->name('search-product');
Route::any('product-details/{slug}','HomePageController@productDetails')
    ->name('product-details');
Route::get('featured-products','HomePageController@featuredProducts')   
    ->name('featured-products');
Route::get('best-selling-products','HomePageController@bestSellingProducts')
    ->name('best-selling-products'); 
Route::get('new-arrivals','HomePageController@newArrivals')
    ->name('new-arrivals');        
Route::get('voucher-products','HomePageController@voucherProducts')   
    ->name('voucher-products');
Route::get('offer-products','HomePageController@offerProducts')   
    ->name('offer-products');           
Route::get('products/category/{slug}','HomePageController@categoryProducts')    
    ->name('category-products');
Route::get('products/subcategory/{slug}','HomePageController@subcategoryProducts')->name('subcategory-products'); 
Route::get('products/brand/{slug}','HomePageController@brandProducts')    
    ->name('brand-products');
Route::get('campaign','HomePageController@campaign')->name('campaign');    
Route::get('products/campaign/{slug}','HomePageController@promotionProducts')    
    ->name('campaign-products');
Route::any('add-to-cart','HomePageController@addToCart')
    ->name('add-to-cart');
Route::any('remove-cart-product','HomePageController@removeCartProduct')
    ->name('remove-cart-product');
Route::any('add-to-favorite','HomePageController@addToFavorite')
    ->name('add-to-favorite');
Route::any('remove-list-product','HomePageController@removeFavoriteProduct')
    ->name('remove-list-product');    
Route::get('wishlists','HomePageController@wishlists')->name('wishlists');
Route::get('carts','HomePageController@shoppingCart')->name('carts');
Route::get('increment-cart-product/{id}','HomePageController@incrementCartProduct')
    ->name('increment-cart-product'); 
Route::get('decrement-cart-product/{id}','HomePageController@decrementCartProduct')
    ->name('decrement-cart-product');
Route::any('checkout','HomePageController@checkout')->name('checkout');  
Route::delete('remove-coupon','HomePageController@removeCoupon')
    ->name('remove-coupon');  
Route::any('submit-order','HomePageController@submitOrder')
    ->name('submit-order');  
Route::post('submit-review','HomePageController@submitReview')->name('submit-review');

include 'operation.php';

Route::get('/product/{category_id}',function($category_id){
    $products = Product::where('category_id',$category_id)->take(20)->get();
    return view('pages.ajax_products',compact('products'));
});


// Website basic routes
Route::get('about-us',function(){
    return view('pages.about_us');
})->name('about-us');
Route::get('contact-us',function(){
    return view('pages.contact_us');
})->name('contact-us');
Route::get('terms-condition',function(){
    return view('pages.terms_condition');
})->name('terms-condition');
Route::get('privacy-policy',function(){
    return view('pages.privacy_policy');
})->name('privacy-policy');
Route::get('return-policy',function(){
    return view('pages.return_policy');
})->name('return-policy');
Route::get('refund-policy',function(){
    return view('pages.refund_policy');
})->name('refund-policy');
Route::get('delivery-information',function(){
    return view('pages.delivery_information');
})->name('delivery-information');
Route::post('send-message','HomePageController@sendMessage')
    ->name('send-message');
Route::post('user-subscribe','HomePageController@subscribe')
    ->name('user-subscribe');





