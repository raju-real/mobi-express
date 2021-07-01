<?php

use Illuminate\Support\Facades\Route;

Route::get('login','Auth\LoginController@showLoginFrom')->name('login');
Route::post('register','Auth\LoginController@userRegister')->name('register');
Route::post('login','Auth\LoginController@userLogin')->name('login');

Route::group(['as' => 'user.', 'prefix' => 'user', 'namespace' => 'User', 'middleware' => 'auth'], function () {
    Route::get('dashboard','DashboardController@index')->name('dashboard');
    Route::post('place_order','UserOrderController@placeOrder')->name('place_order');
    Route::get('order', 'DashboardController@order')->name('order');
});


