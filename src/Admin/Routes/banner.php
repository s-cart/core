<?php
Route::group(['prefix' => 'banner'], function () {
    Route::get('/', 'AdminBannerController@index')->name('admin_banner.index');
    Route::get('create', 'AdminBannerController@create')->name('admin_banner.create');
    Route::post('/create', 'AdminBannerController@postCreate')->name('admin_banner.create');
    Route::get('/edit/{id}', 'AdminBannerController@edit')->name('admin_banner.edit');
    Route::post('/edit/{id}', 'AdminBannerController@postEdit')->name('admin_banner.edit');
    Route::post('/delete', 'AdminBannerController@deleteList')->name('admin_banner.delete');
});
