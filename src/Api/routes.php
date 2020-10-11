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
    Route::group(['prefix' => 'auth'], function () {
        Route::post('login', 'AuthController@login');
        Route::post('create', 'AuthController@create');
      
        Route::group([
          'middleware' => 'auth:api'
        ], function() {
            Route::get('logout', 'AuthController@logout');
            Route::get('user', 'AccountController@user');
            Route::get('orders', 'AccountController@orders');
            Route::get('orders/{id}', 'AccountController@ordersDetail');
        });
    });
    
    Route::get('categories', 'ShopFront@allCategory');
    Route::get('categories/{id}', 'ShopFront@categoryDetail');
    Route::get('products', 'ShopFront@allProduct');
    Route::get('products/{id}', 'ShopFront@productDetail');
    Route::get('brands', 'ShopFront@allBrand');
    Route::get('brands/{id}', 'ShopFront@brandDetail');
    Route::get('supplieres', 'ShopFront@allSupplier');
    Route::get('supplieres/{id}', 'ShopFront@brandDetail');
});