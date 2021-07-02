<?php

use Illuminate\Support\Facades\Route;

Route::get('login','Auth\LoginController@showLoginFrom')->name('login');
Route::post('register','Auth\LoginController@userRegister')->name('register');
Route::post('login','Auth\LoginController@userLogin')->name('login');

Route::group(['as' => 'user.', 'prefix' => 'user', 'namespace' => 'User', 'middleware' => 'auth'], function () {
    Route::get('dashboard','DashboardController@index')
        ->name('dashboard');
    Route::get('order_history', 'DashboardController@orderHistory')
        ->name('order_history');
    Route::get('order_details', 'DashboardController@orderDetails')
        ->name('order_details');    
    Route::get('profile', 'DashboardController@profile')
        ->name('profile');    
});

Route::get('logout',function(){
    Auth::logout();
    return redirect()->route('home');
})->name('logout');


