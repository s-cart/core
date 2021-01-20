<?php
Route::group(['prefix' => 'seo'], function () {
    Route::get('/config', 'AdminSeoConfigController@index')->name('admin_seo.config');
});
