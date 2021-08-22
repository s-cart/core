<?php

use Illuminate\Support\Facades\Route;

//Route api
Route::group(
    [
        'middleware' => SC_API_MIDDLEWARE,
        'prefix' => 'api',
        'namespace' => '\SCart\Core\Api\Controllers',
    ]
    , function () {

    //Customer
    Route::group(['prefix' => 'member'], function () {
        Route::post('login', 'AuthController@login');
        Route::post('create', 'AuthController@create');
        Route::group([
            'middleware' => ['auth:api', 'scope:user, user-guest']
        ], function() {
            Route::get('logout', 'AuthController@logout');
            Route::get('info', 'MemberController@getInfo');
            Route::get('orders', 'MemberOrderController@orders');
            Route::get('order/{id}', 'MemberOrderController@orderDetail');
        });

        Route::group([
            'middleware' => ['auth:api', 'scope:user']
        ], function() {
            Route::post('create_order', 'MemberOrderController@createOrder');
            Route::post('cancel_order/{id}', 'MemberOrderController@cancelOrder');
        });
    });

    //Admin
    Route::group(['prefix' => 'admin'], function () {
        Route::post('login', 'AdminAuthController@login');     
        Route::group([
          'middleware' => ['auth:admin-api', 'scope:admin-supper']
        ], function() {
            Route::get('logout', 'AdminAuthController@logout');
            Route::get('info', 'AdminController@getInfo'); 
            
            // Route::post('order', 'MemberController@createOrder');
            // Route::post('cancel_order/{id}', 'MemberController@cancelOrder');
                // Route::get('categories', 'ShopFront@allCategory');
                // Route::get('categories/{id}', 'ShopFront@categoryDetail');
                // Route::get('products', 'ShopFront@allProduct');
                // Route::get('products/{id}', 'ShopFront@productDetail');
                // Route::get('brands', 'ShopFront@allBrand');
                // Route::get('brands/{id}', 'ShopFront@brandDetail');
                // Route::get('supplieres', 'ShopFront@allSupplier');
                // Route::get('supplieres/{id}', 'ShopFront@brandDetail');
        });
    });
    
});