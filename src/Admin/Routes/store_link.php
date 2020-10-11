<?php
Route::group(['prefix' => 'store_link'], function () {
    Route::get('/', 'AdminStoreLinkController@index')->name('admin_store_link.index');
    Route::get('create', 'AdminStoreLinkController@create')->name('admin_store_link.create');
    Route::post('/create', 'AdminStoreLinkController@postCreate')->name('admin_store_link.create');
    Route::get('/edit/{id}', 'AdminStoreLinkController@edit')->name('admin_store_link.edit');
    Route::post('/edit/{id}', 'AdminStoreLinkController@postEdit')->name('admin_store_link.edit');
    Route::post('/delete', 'AdminStoreLinkController@deleteList')->name('admin_store_link.delete');
});
