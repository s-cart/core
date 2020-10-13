<?php
$prefixSupplier = sc_config('PREFIX_SUPPLIER')??'supplier';

Route::group(['prefix' => $prefixSupplier], function ($router) use($suffix) {
    $router->get('/', 'ShopSupplierController@allSuppliers')->name('supplier.all');
    $router->get('/{alias}'.$suffix, 'ShopSupplierController@supplierDetail')
        ->name('supplier.detail');
});