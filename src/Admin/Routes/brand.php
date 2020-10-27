<?php
Route::group(['prefix' => 'brand'], function () {
    Route::get('/', 'AdminBrandController@index')->name('admin_brand.index');
    Route::get('create', function () {
        return redirect()->route('admin_brand.index');
    });
    Route::post('/create', 'AdminBrandController@postCreate')->name('admin_brand.create');
    Route::get('/edit/{id}', 'AdminBrandController@edit')->name('admin_brand.edit');
    Route::post('/edit/{id}', 'AdminBrandController@postEdit')->name('admin_brand.edit');
    Route::post('/delete', 'AdminBrandController@deleteList')->name('admin_brand.delete');
});
