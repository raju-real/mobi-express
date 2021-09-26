<?php

use Illuminate\Support\Facades\Route;

Route::get('send-otp','Auth\LoginController@sendOtp')->name('send-otp');
Route::get('check-otp','Auth\LoginController@checkOtp')->name('check-otp');
Route::get('login','Auth\LoginController@showLoginFrom')->name('login');
Route::post('register','Auth\LoginController@userRegister')->name('register');
Route::post('login','Auth\LoginController@userLogin')->name('login');

Route::group(['as' => 'user.', 'prefix' => 'user', 'namespace' => 'User', 'middleware' => 'auth'], function () {
    Route::get('dashboard','DashboardController@index')
        ->name('dashboard');
    Route::get('order-history', 'DashboardController@orderHistory')
        ->name('order-history');
    Route::get('order-details', 'DashboardController@orderDetails')
        ->name('order_details');    
    Route::get('profile', 'DashboardController@profile')
        ->name('profile');
    Route::get('edit-profile','DashboardController@editProfile')
        ->name('edit-profile');
    Route::put('update-profile','DashboardController@updateProfile')
        ->name('update-profile');        
    Route::get('change-password', 'DashboardController@passChangeForm')
        ->name('change-password');    
});

Route::get('logout',function(){
    Auth::logout();
    return redirect()->route('home');
})->name('logout');


