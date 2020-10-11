<?php
Route::group(['prefix' => 'store_maintain'], function () {
    Route::get('/', 'AdminStoreMaintainController@index')->name('admin_store_maintain.index');
    Route::post('/', 'AdminStoreMaintainController@postEdit');
});
