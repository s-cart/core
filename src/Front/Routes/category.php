<?php
$prefixCategory = sc_config('PREFIX_CATEGORY')??'category';

Route::group(
    [
        'prefix' => $langUrl.$prefixCategory
    ],
    function ($router) use ($suffix) {
        $router->get('/', 'ShopCategoryController@allCategoriesProcessFront')
            ->name('category.all');
        $router->get('/{alias}'.$suffix, 'ShopCategoryController@categoryDetailProcessFront')
            ->name('category.detail');
    }
);
