<?php
Route::group(['prefix' => 'subscribe'], function () {
    Route::get('/', 'AdminSubscribeController@index')->name('admin_subscribe.index');
    Route::get('create', 'AdminSubscribeController@create')->name('admin_subscribe.create');
    Route::post('/create', 'AdminSubscribeController@postCreate')->name('admin_subscribe.create');
    Route::get('/edit/{id}', 'AdminSubscribeController@edit')->name('admin_subscribe.edit');
    Route::post('/edit/{id}', 'AdminSubscribeController@postEdit')->name('admin_subscribe.edit');
    Route::post('/delete', 'AdminSubscribeController@deleteList')->name('admin_subscribe.delete');
});
