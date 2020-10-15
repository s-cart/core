<?php
$prefixProduct = sc_config('PREFIX_PRODUCT')??'product';

Route::group(['prefix' => $prefixProduct], function ($router) use($suffix) {
    $router->get('/', 'ShopProductController@allProducts')->name('product.all');
    $router->post('/info', 'ShopProductController@productInfo')
        ->name('product.info');
    $router->get('/{alias}/{storeCode}'.$suffix, 'ShopProductController@productDetail')
        ->name('product.detail');
});