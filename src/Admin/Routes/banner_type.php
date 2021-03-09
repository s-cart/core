<?php
//Banner type
Route::group(['prefix' => 'banner_type'], function () {
    Route::get('/', 'AdminBannerTypeController@index')->name('admin_banner_type.index');
    Route::get('create', function () {
        return redirect()->route('admin_banner_type.index');
    });
    Route::post('/create', 'AdminBannerTypeController@postCreate')->name('admin_banner_type.create');
    Route::get('/edit/{id}', 'AdminBannerTypeController@edit')->name('admin_banner_type.edit');
    Route::post('/edit/{id}', 'AdminBannerTypeController@postEdit')->name('admin_banner_type.edit');
    Route::post('/delete', 'AdminBannerTypeController@deleteList')->name('admin_banner_type.delete');
});
