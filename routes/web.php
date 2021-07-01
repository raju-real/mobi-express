<?php
//https://bootsnipp.com/tags/ecommerce?page=1       Design Helper
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Model\Product;
include 'admin.php'; // Admin Routes
include 'user.php'; // User Routes

//Auth::routes();
Route::get('logout',function(){
    Auth::logout();
    return redirect()->route('home');
});

// Basic Activity Routes
Route::get('/','HomePageController@index')->name('home');
Route::get('search-product','HomePageController@searchProduct')
    ->name('search-product');
Route::any('product-details/{slug}','HomePageController@productDetails')
    ->name('product-details');
Route::get('products/category/{slug}','HomePageController@categoryProducts')    
    ->name('category-products');
Route::get('products/subcategory/{slug}','HomePageController@subcategoryProducts')->name('subcategory-products');  
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
Route::get('increment-cart-product/{id}','HomePageController@incrementCartProduct')->name('increment-cart-product'); 
Route::get('decrement-cart-product/{id}','HomePageController@decrementCartProduct')->name('decrement-cart-product');
Route::any('checkout','HomePageController@checkout')->name('checkout');  

include 'operation.php';




