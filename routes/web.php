<?php
//https://bootsnipp.com/tags/ecommerce?page=1       Design Helper
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Auth::routes();
Route::get('logout',function(){
    Auth::logout();
    return redirect()->route('home');
});

Route::get('/','HomePageController@index')->name('home');
Route::post('user-register', 'Auth\RegisterController@userRegister')->name('user-register');
Route::get('login', 'Auth\LoginController@showLoginFrom')->name('login');
Route::post('user-login', 'Auth\LoginController@userLogin')->name('user-login');
Route::get('product_details/{slug}', 'HomePageController@productDetails')->name('product_details');
Route::post('add_to_cart', 'HomePageController@addToCart')->name( 'add_to_cart');
Route::post('add_to_favorite', 'HomePageController@addToFavorite')->name('add_to_favorite');
Route::get('carts', 'HomePageController@shoppingCart')->name('carts');
Route::get('increment_cart_product/{cart_id}', 'HomePageController@incrementCartProduct')->name('increment_cart_product');
Route::get('decrement_cart_product/{cart_id}', 'HomePageController@decrementCartProduct')->name('decrement_cart_product');
Route::get('remove_cart_product/{cart_id}', 'HomePageController@removeCartProduct')->name('remove_cart_product');
Route::get('checkout', 'HomePageController@checkout')->name('checkout');

include 'admin.php'; // Admin Routes
include 'user.php'; // User Routes

