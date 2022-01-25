<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

Route::get('admin',function(){
	return view('auth.admin_login');
})->name('admin');

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => 'auth:admin'], function () {
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
    // Product Attribute Part
    Route::resource('category','CategoryController')->middleware('attribute');
    Route::resource('subcategory','SubCategoryController')->middleware('attribute');
    Route::resource('brand','BrandController')->middleware('attribute');
    Route::resource('color','ColorController')->middleware('attribute');
    Route::resource('size','SizeController')->middleware('attribute');
    Route::resource('unit','UnitController')->middleware('attribute');

    // District
    Route::resource('district','DistrictController')->middleware('district');
    // Product
    Route::resource('product', 'ProductController')->middleware('product');
    Route::delete('remove-image/{id}','ProductController@removeImage')
        ->middleware('product');
    // Offer
    Route::resource('offer','OfferController')->middleware('offer');

    // Website Basic
    Route::resource('policy','PolicyController')->middleware('basic');
    Route::get('policy-edit','PolicyController@edit')
        ->name('policy-edit')->middleware('basic');
    Route::get('about-us','AboutContactController@aboutUs')
        ->name('about-us')->middleware('basic');
    Route::put('update-about','AboutContactController@updateAboutUs')
        ->name('update-about')->middleware('basic');
    Route::get('contact-us','AboutContactController@contactUs')
        ->name('contact-us')->middleware('basic');
    Route::put('update-contact','AboutContactController@updateContactUs')
        ->name('update-contact')->middleware('basic');

    // Voucher Part
    Route::resource('voucher-product','VoucherProductController')
        ->middleware('voucher');

    // Coupon Part
    Route::resource('coupon','CouponController')->middleware('coupon');
    Route::resource('coupon-group','CouponGroupController')->middleware('coupon');
    Route::post('add-group-user','CouponGroupController@addGroupUser')
        ->name('add-group-user')->middleware('coupon');
    Route::get('get-coupons','CouponGroupController@getCoupons')
        ->name('get-coupons')->middleware('coupon');
    Route::delete('delete-group-user/{id}','CouponGroupController@deleteGroupUser')
        ->name('delete-group-user')->middleware('coupon');

    // Promotion Part
    Route::resource('promotion','PromotionController')->middleware('promotion');
    Route::get('promotion/products/{slug}','PromotionController@promotionProducts')
        ->name('promotion-products')->middleware('promotion');
    Route::get('promotion/product/create/{slug}','PromotionController@createPromotionProduct')
        ->name('promotion-product.create')->middleware('promotion');
    Route::post('promotion-product','PromotionController@storePromotionProduct')
        ->name('promotion-product.store')->middleware('promotion');
    Route::get('promotion/product/edit/{id}','PromotionController@editPromotionProduct')
        ->name('promotion-product.edit')->middleware('promotion');
    Route::put('promotion/product/update/{id}','PromotionController@promotionProductUpdate')
        ->name('promotion-product.update')->middleware('promotion');
    Route::delete('promotion/product/delete/{id}','PromotionController@promotionProductDestroy')
        ->name('promotion-product.delete')->middleware('promotion');
    Route::get('promotion/product/change-status','PromotionController@changePromotionProductStatus')
    ->name('promotion-product.change-status')->middleware('promotion');
    Route::get('promotion/product/update-status','PromotionController@updatePromotionProductStatus')
        ->name('promotion-product.update-status')->middleware('promotion');

    // Slider
    Route::resource('slider','SliderController');
    // Product Binding Part
    Route::resource('featured-products','FeaturedProductController')
        ->middleware('binding');
    Route::resource('new-arrivals','NewArrivalsController')->middleware('binding');
    Route::resource('front-category','FrontCategoryController')->middleware('binding');
    Route::get('front-category-products','FrontCategoryController@products')
        ->name('front-category-products')->middleware('binding');
    Route::get('front-category-add-product','FrontCategoryController@addProductFrom')
        ->name('front-category-add-product')->middleware('binding');
    Route::post('add-product-front-cat','FrontCategoryController@addProduct')
        ->name('add-product-front-cat')->middleware('binding');
    Route::get('edit-product-front-cat/{id}','FrontCategoryController@editProduct')
        ->name('edit-product-front-cat')->middleware('binding');
    Route::put('update-product-front-cat/{id}','FrontCategoryController@updateProduct')->name('update-product-front-cat')->middleware('binding');
    Route::delete('delete-product-front-cat/{id}','FrontCategoryController@deleteProduct')->name('delete-product-front-cat')->middleware('binding');

    // User Part
    Route::get('users','DashboardController@users')
        ->name('users.index')->middleware('user');
    Route::get('user','DashboardController@userDetails')
        ->name('user.show')->middleware('user');
    Route::get('change-user-status','DashboardController@changeUserStatus')
        ->name('change-user-status')->middleware('user');

    // Admin Part
    Route::get('admins','DashboardController@admins')
        ->name('admins.index')->middleware('author');
    Route::get('admins/create','DashboardController@createAdmin')
        ->name('admins.create')->middleware('author');
    Route::post('admins/store','DashboardController@storeAdmin')
        ->name('admins.store')->middleware('author');
    Route::get('admins/edit','DashboardController@editAdmin')
        ->name('admin.edit')->middleware('author');
    Route::put('admins/update/{id}','DashboardController@updateAdmin')
        ->name('admin.update')->middleware('author');
    Route::get('change-admin-status','DashboardController@changeAdminStatus')
        ->name('change-admin-status')->middleware('author');
    Route::get('admins/show','DashboardController@shwoAdmin')
        ->name('admin.show')->middleware('author');


    // order section
    Route::get('orders/pending','OrderController@pendingOrders')
        ->name('pending-orders')->middleware('order');
    Route::get('orders/processing','OrderController@processingOrders')
        ->name('processing-orders')->middleware('order');
    Route::get('orders/picked','OrderController@pickedOrders')
        ->name('picked-orders')->middleware('order');
    Route::get('orders/shipped','OrderController@shippedOrders')
        ->name('shipped-orders')->middleware('order');
    Route::get('orders/delivered','OrderController@deliveredOrders')
        ->name('delivered-orders')->middleware('order');
    Route::get('orders/delivered','OrderController@deliveredOrders')
        ->name('delivered-orders')->middleware('order');
    Route::get('orders/cancled','OrderController@cancledOrders')
        ->name('cancled-orders')->middleware('order');
    Route::get('orders/returned','OrderController@returnedOrders')
        ->name('returned-orders')->middleware('order');
    Route::get('search','OrderController@searchOrder')
        ->name('search-order')->middleware('order');
    Route::any('order','OrderController@orderDetails')
        ->name('order.show')->middleware('order');
    Route::any('change-status','OrderController@changeOrderStatus')
        ->name('change-status')->middleware('order');
    //Route::get('invoice','OrderController@invoice')->name('invoice');
    Route::get('invoice','OrderController@downloadInvoice')
        ->name('invoice')->middleware('order');
    //Commonly Control
    Route::get('orders','OrderController@orders')
        ->name('orders')->middleware('order');
    Route::get('make-cash-on-delivery','OrderController@makeCashOnDelivery')
        ->name('make-cash-on-delivery');

    // Report Section
    Route::get('transaction-history','DashboardController@transactionHistory')
        ->name('transaction-history')->middleware('report');
        Route::get('transaction-details','DashboardController@transactionDetails')
        ->name('transaction-details')->middleware('report');
});


// login section
Route::post('admin-login',function(Request $request){
    if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password,'status'=>1], $request->remember)) {
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
