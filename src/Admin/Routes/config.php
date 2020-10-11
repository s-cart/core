<?php
Route::group(['prefix' => 'config'], function () {
    Route::get('/webhook', 'AdminConfigController@webhook')->name('admin_config.webhook');
    Route::post('/update_info', 'AdminConfigController@updateInfo')->name('admin_config.update');
});
