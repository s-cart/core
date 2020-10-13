<?php
$prefixCategory = sc_config('PREFIX_CATEGORY')??'category';

Route::group(['prefix' => $prefixCategory], function ($router) use($suffix) {
    $router->get('/', 'ShopCategoryController@allCategories')->name('category.all');
    $router->get('/{alias}'.$suffix, 'ShopCategoryController@categoryDetail')
        ->name('category.detail');
});
