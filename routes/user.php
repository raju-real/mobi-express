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
        ->name('order-details');
    Route::get('payment-details', 'DashboardController@paymentDetails')
        ->name('payment-details');        
    Route::get('profile', 'DashboardController@profile')
        ->name('profile');
    Route::get('edit-profile','DashboardController@editProfile')
        ->name('edit-profile');
    Route::put('update-profile','DashboardController@updateProfile')
        ->name('update-profile'); 
    Route::get('address-book','DashboardController@addressBook')
        ->name('address-book');
    Route::put('update-address','DashboardController@updateBillingAddress')    
        ->name('update-address');
    Route::get('account-setting','DashboardController@accountSetting')
        ->name('account-setting');
    Route::post('change-password','DashboardController@changePassword')          
        ->name('change-password');
    // Change Mobile Number
    Route::get('send-otp','DashboardController@sendOtp')->name('send-otp');
    Route::get('check-otp','DashboardController@checkOtp')->name('check-otp');
    // For frontend
    Route::get('shipping','DashboardController@shipping')->name('shipping');
});

// SSLCOMMERZ 
Route::group(['namespace'=>'User'],function(){
    Route::any('pay-here','SslCommerzPaymentController@payHere')->name('pay-here');
    Route::post('pay-now','SslCommerzPaymentController@index')->name('pay-now');
    Route::post('success','SslCommerzPaymentController@success');
    Route::post('fail','SslCommerzPaymentController@fail');

    Route::get('/example1', [SslCommerzPaymentController::class, 'exampleEasyCheckout']);
    Route::get('/example2', [SslCommerzPaymentController::class, 'exampleHostedCheckout']);
    Route::post('/pay-via-ajax', [SslCommerzPaymentController::class, 'payViaAjax']);
    // Route::post('/success', [SslCommerzPaymentController::class, 'success']);
    // Route::post('/fail', [SslCommerzPaymentController::class, 'fail']);
    // Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel']);

    // Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn']);
});

Route::get('logout',function(){
    Auth::logout();
    return redirect()->route('home');
})->name('logout');


