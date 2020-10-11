<?php
Route::group(['prefix' => 'store_block'], function () {
    Route::get('/', 'AdminStoreBlockController@index')->name('admin_store_block.index');
    Route::get('create', 'AdminStoreBlockController@create')->name('admin_store_block.create');
    Route::post('/create', 'AdminStoreBlockController@postCreate')->name('admin_store_block.create');
    Route::get('/edit/{id}', 'AdminStoreBlockController@edit')->name('admin_store_block.edit');
    Route::post('/edit/{id}', 'AdminStoreBlockController@postEdit')->name('admin_store_block.edit');
    Route::post('/delete', 'AdminStoreBlockController@deleteList')->name('admin_store_block.delete');
});
