<?php
Route::group(['prefix' => 'product'], function () {
    Route::get('/', 'AdminProductController@index')->name('admin_product.index');
    Route::get('create', 'AdminProductController@create')->name('admin_product.create');
    Route::post('/create', 'AdminProductController@postCreate')->name('admin_product.create');
    Route::get('/edit/{id}', 'AdminProductController@edit')->name('admin_product.edit');
    Route::post('/edit/{id}', 'AdminProductController@postEdit')->name('admin_product.edit');
    Route::post('/delete', 'AdminProductController@deleteList')->name('admin_product.delete');
    Route::get('/import', 'AdminProductController@import')->name('admin_product.import');
    Route::post('/import', 'AdminProductController@postImport')->name('admin_product.import');
});
