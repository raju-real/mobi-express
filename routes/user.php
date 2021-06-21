<?php

use Illuminate\Support\Facades\Route;

Route::group(['as' => 'user.', 'prefix' => 'user', 'namespace' => 'User', 'middleware' => 'auth'], function () {
    Route::get('dashboard','DashboardController@index')->name('dashboard');
    Route::post('place_order','UserOrderController@placeOrder')->name('place_order');
    Route::get('order', 'DashboardController@order')->name('order');
    Route::get('payment/{order_id}','UserOrderController@payment')->name('payment');
    
});


