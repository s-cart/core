<?php
Route::group(['prefix' => 'cache_config'], function () {
    Route::get('/', 'AdminCacheConfigController@index')->name('admin_cache_config.index');
    Route::post('/clear_cache', 'AdminCacheConfigController@clearCache')->name('admin_cache_config.clear_cache');
});
