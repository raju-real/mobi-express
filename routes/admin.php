<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

Route::get('admin',function(){
	return view('auth.admin_login');
});

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => 'auth:admin'], function () {
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
    Route::resource('category','CategoryController');
    Route::resource('subcategory','SubCategoryController');
    Route::resource('brand','BrandController');
    Route::resource('color','ColorController');
    Route::resource('size','SizeController');
    Route::resource('unit','UnitController');
    Route::resource('product', 'ProductController');
    Route::delete('remove-image/{id}','ProductController@removeImage');
    Route::resource('promotion','PromotionController');
    Route::get('promotion/products/{id}','PromotionController@promotionProducts')->name('promotion-products');
    Route::get('promotion/product/create/{promotion_id}','PromotionController@createPromotionProduct')
        ->name('promotion-product.create');
    Route::post('promotion-product','PromotionController@storePromotionProduct') ->name('promotion-product.store'); 
});

Route::post('admin-login',function(Request $request){

        if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
            return redirect()->intended(route('admin.dashboard'));

        } else {
            
            return redirect()->back()->withInput($request->only('email', 'remember'))->with('message','Email & Password Mismatch');
        }
})->name('admin-login');

Route::get('admin-logout',function(){
	Auth::guard('admin')->logout();
    Auth::guard('web')->logout();
    session()->flush();
    session()->regenerate();
    return redirect()->route('admin')->with('message','Admin Logout Successfully');
})->name('admin-logout');
