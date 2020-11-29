<?php
Route::group(['prefix' => 'store_config'], function () {
    Route::get('/', 'AdminStoreConfigController@index')->name('admin_config.index');
    Route::get('/webhook', 'AdminStoreConfigController@webhook')->name('admin_config.webhook');
    Route::post('/update', 'AdminStoreConfigController@update')->name('admin_config.update');
});
