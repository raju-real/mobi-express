<?php
//https://bootsnipp.com/tags/ecommerce?page=1       Design Helper
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Model\Product;
include 'admin.php'; // Admin Routes
include 'user.php'; // User Routes

Auth::routes();
Route::get('logout',function(){
    Auth::logout();
    return redirect()->route('home');
});

// Basic Activity Routes
Route::get('/','HomePageController@index')->name('home');
Route::any('product-details/{slug}','HomePageController@productDetails')->name('product-details');
Route::any('add-to-cart','HomePageController@productDetails')
    ->name('add-to-cart');
Route::any('add-to-favorite','HomePageController@productDetails')
    ->name('add-to-favorite');
Route::get('products/category/{slug}','HomePageController@categoryProducts')    
    ->name('category-products');
Route::get('products/subcategory/{slug}','HomePageController@subcategoryProducts')->name('subcategory-products');    

include 'operation.php';




