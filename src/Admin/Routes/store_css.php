<?php
Route::group(['prefix' => 'store_css'], function () {
    Route::get('/', 'AdminStoreCssController@index')->name('admin_store_css.index');
    Route::post('/', 'AdminStoreCssController@postEdit');
});
