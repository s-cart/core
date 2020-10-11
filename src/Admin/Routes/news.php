<?php
Route::group(['prefix' => 'news'], function () {
    Route::get('/', 'AdminNewsController@index')->name('admin_news.index');
    Route::get('create', 'AdminNewsController@create')->name('admin_news.create');
    Route::post('/create', 'AdminNewsController@postCreate')->name('admin_news.create');
    Route::get('/edit/{id}', 'AdminNewsController@edit')->name('admin_news.edit');
    Route::post('/edit/{id}', 'AdminNewsController@postEdit')->name('admin_news.edit');
    Route::post('/delete', 'AdminNewsController@deleteList')->name('admin_news.delete');
});
