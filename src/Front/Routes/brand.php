<?php
$prefixBrand = sc_config('PREFIX_BRAND')??'brand';

Route::group(['prefix' => $prefixBrand], function ($router) use($suffix) {
    $router->get('/', 'ShopBrandController@allBrands')->name('brand.all');
    $router->get('/{alias}'.$suffix, 'ShopBrandController@brandDetail')
        ->name('brand.detail');
});