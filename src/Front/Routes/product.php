<?php
$prefixProduct = sc_config('PREFIX_PRODUCT')??'product';

Route::group(['prefix' => $prefixProduct], function ($router) use($suffix) {
    $router->get('/', 'ShopProductController@allProducts')->name('product.all');
    $router->get('/{alias}/s{storeId}'.$suffix, 'ShopProductController@productDetail')
        ->name('product.detail');
});