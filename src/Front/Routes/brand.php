<?php
$prefixBrand = sc_config('PREFIX_BRAND')??'brand';

Route::group(
    [
        'prefix' => $langUrl.$prefixBrand
    ], 
    function ($router) use ($suffix) {
        $router->get('/', 'ShopBrandController@allBrandsProcessFront')
            ->name('brand.all');
        $router->get('/{alias}'.$suffix, 'ShopBrandController@brandDetailProcessFront')
            ->name('brand.detail');
    }
);