<?php
Route::group(['prefix' => 'store_config'], function () {
    Route::get('/', 'AdminStoreConfigController@index')->name('store_config.index');
});
