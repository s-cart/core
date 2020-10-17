<?php
$prefixCategory = sc_config('PREFIX_SUB_CATEGORY')??'sub_category';

Route::group(['prefix' => $prefixCategory], function ($router) use($suffix) {
    $router->get('/{alias}/{storeCode}'.$suffix, 'ShopSubCategoryController@categoryDetail')
        ->name('sub_category.detail');
});
