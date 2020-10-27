<?php
Route::group(['prefix' => 'api_connection'], function () {
    Route::get('/', 'AdminApiConnectionController@index')->name('admin_api_connection.index');
    Route::get('create', function () {
        return redirect()->route('admin_api_connection.index');
    });
    Route::post('/create', 'AdminApiConnectionController@postCreate')->name('admin_api_connection.create');
    Route::get('/edit/{id}', 'AdminApiConnectionController@edit')->name('admin_api_connection.edit');
    Route::post('/edit/{id}', 'AdminApiConnectionController@postEdit')->name('admin_api_connection.edit');
    Route::post('/delete', 'AdminApiConnectionController@deleteList')->name('admin_api_connection.delete');
    Route::get('/generate_key', 'AdminApiConnectionController@generateKey')->name('admin_api_connection.generate_key');
});
