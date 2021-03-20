<?php
//Banner type
Route::group(['prefix' => 'product_property'], function () {
    Route::get('/', 'AdminProductPropertyController@index')->name('admin_product_property.index');
    Route::get('create', function () {
        return redirect()->route('admin_product_property.index');
    });
    Route::post('/create', 'AdminProductPropertyController@postCreate')->name('admin_product_property.create');
    Route::get('/edit/{id}', 'AdminProductPropertyController@edit')->name('admin_product_property.edit');
    Route::post('/edit/{id}', 'AdminProductPropertyController@postEdit')->name('admin_product_property.edit');
    Route::post('/delete', 'AdminProductPropertyController@deleteList')->name('admin_product_property.delete');
});
