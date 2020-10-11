<?php
Route::group(['prefix' => 'brand'], function () {
    Route::get('/', 'AdminBrandController@index')->name('admin_brand.index');
    Route::get('create', 'AdminBrandController@create')->name('admin_brand.create');
    Route::post('/create', 'AdminBrandController@postCreate')->name('admin_brand.create');
    Route::get('/edit/{id}', 'AdminBrandController@edit')->name('admin_brand.edit');
    Route::post('/edit/{id}', 'AdminBrandController@postEdit')->name('admin_brand.edit');
    Route::post('/delete', 'AdminBrandController@deleteList')->name('admin_brand.delete');
});
