<?php
$prefixProduct = sc_config('PREFIX_PRODUCT')??'product';

Route::group(['prefix' => $langUrl.$prefixProduct], function ($router) use ($suffix) {
    $router->get('/', 'ShopProductController@productListProcessFront')
        ->name('product.all');
    $router->get('/{alias}/s{storeId}'.$suffix, 'ShopProductController@productDetailProcessFront')
        ->name('product.detail');
});