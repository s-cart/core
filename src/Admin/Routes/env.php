<?php
Route::group(['prefix' => 'env'], function () {
    Route::get('/config', 'AdminEnvConfigController@index')->name('admin_env.config');
});
