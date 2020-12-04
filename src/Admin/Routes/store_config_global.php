<?php
Route::group(['prefix' => 'config'], function () {
    Route::get('/webhook', 'AdminConfigGlobalController@webhook')->name('admin_config_global.webhook');
    Route::post('/update', 'AdminConfigGlobalController@update')->name('admin_config_global.update');
});
