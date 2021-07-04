<?php
$prefixProduct = sc_config('PREFIX_PRODUCT')??'product';

Route::group(['prefix' => $langUrl.$prefixProduct], function ($router) use ($suffix) {
    $router->get('/', 'ShopProductController@allProductsProcessFront')
        ->name('product.all');
    $router->get('/{alias}'.$suffix, 'ShopProductController@productDetailProcessFront')
        ->name('product.detail');
});