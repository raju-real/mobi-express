<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

Route::get('admin',function(){
	return view('auth.admin_login');
})->name('admin');

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => 'auth:admin'], function () {
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
    Route::resource('category','CategoryController');
    Route::resource('subcategory','SubCategoryController');
    Route::resource('brand','BrandController');
    Route::resource('color','ColorController');
    Route::resource('size','SizeController');
    Route::resource('unit','UnitController');
    Route::resource('district','DistrictController');
    Route::resource('product', 'ProductController');
    Route::delete('remove-image/{id}','ProductController@removeImage');
    Route::resource('offer','OfferController');
    Route::resource('policy','PolicyController');
    Route::get('policy-edit','PolicyController@edit')->name('policy-edit');
    Route::get('about-us','AboutContactController@aboutUs')->name('about-us');
    Route::put('update-about','AboutContactController@updateAboutUs')
        ->name('update-about');
    Route::get('contact-us','AboutContactController@contactUs')->name('contact-us');
    Route::put('update-contact','AboutContactController@updateContactUs')
        ->name('update-contact');
    Route::resource('voucher-product','VoucherProductController');
    Route::resource('promotion','PromotionController');
    Route::resource('coupon','CouponController');
    Route::get('promotion/products/{slug}','PromotionController@promotionProducts')
        ->name('promotion-products');
    Route::get('promotion/product/create/{slug}','PromotionController@createPromotionProduct')
        ->name('promotion-product.create');
    Route::post('promotion-product','PromotionController@storePromotionProduct')
        ->name('promotion-product.store');    
    Route::get('promotion/product/edit/{id}','PromotionController@editPromotionProduct')
        ->name('promotion-product.edit');
    Route::put('promotion/product/update/{id}','PromotionController@promotionProductUpdate')->name('promotion-product.update');    
    Route::delete('promotion/product/delete/{id}','PromotionController@promotionProductDestroy')
    ->name('promotion-product.delete');    
    Route::resource('slider','SliderController');  
    Route::resource('featured-products','FeaturedProductController');  
    Route::resource('new-arrivals','NewArrivalsController');  
    Route::resource('front-category','FrontCategoryController');
    Route::get('front-category-products','FrontCategoryController@products')
        ->name('front-category-products');
    Route::get('front-category-add-product','FrontCategoryController@addProductFrom')
        ->name('front-category-add-product');
    Route::post('add-product-front-cat','FrontCategoryController@addProduct')
        ->name('add-product-front-cat');
    Route::get('edit-product-front-cat/{id}','FrontCategoryController@editProduct')
        ->name('edit-product-front-cat'); 
    Route::put('update-product-front-cat/{id}','FrontCategoryController@updateProduct')->name('update-product-front-cat'); 
    Route::delete('delete-product-front-cat/{id}','FrontCategoryController@deleteProduct')->name('delete-product-front-cat');
    Route::get('users','DashboardController@users')->name('users.index');
    Route::get('user','DashboardController@userDetails')->name('user.show');
    Route::get('change-user-status','DashboardController@changeUserStatus')
        ->name('change-user-status');
    // order section
    Route::get('orders/pending','OrderController@pendingOrders')
        ->name('pending-orders');
    Route::get('orders/processing','OrderController@processingOrders')
        ->name('processing-orders');
    Route::get('orders/picked','OrderController@pickedOrders')
        ->name('picked-orders');
    Route::get('orders/shipped','OrderController@shippedOrders')
        ->name('shipped-orders');        
    Route::get('orders/delivered','OrderController@deliveredOrders')
        ->name('delivered-orders');
    Route::get('orders/delivered','OrderController@deliveredOrders')
        ->name('delivered-orders');    
    Route::get('orders/cancled','OrderController@cancledOrders')
        ->name('cancled-orders');
    Route::get('orders/returned','OrderController@returnedOrders')
        ->name('returned-orders');    
    Route::get('search','OrderController@searchOrder')
        ->name('search-order');                     
    Route::get('order','OrderController@orderDetails')
        ->name('order.show');  
    Route::get('change-status','OrderController@changeOrderStatus')         
        ->name('change-status');
    //Route::get('invoice','OrderController@invoice')->name('invoice');
    Route::get('invoice','OrderController@downloadInvoice')->name('invoice');
    //Commonly Control
    Route::get('orders','OrderController@orders')->name('orders');

    // Transaction Section
    Route::get('transaction-history','DashboardController@transactionHistory')
        ->name('transaction-history');
});


// login section
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
