<?php
Route::group(['prefix' => 'store_config'], function () {
    Route::get('/', 'AdminStoreConfigController@index')->name('admin_config.index');
    Route::post('/update', 'AdminStoreConfigController@update')->name('admin_config.update');
    Route::post('/add_new', 'AdminStoreConfigController@addNew')->name('admin_config.add_new');
});
