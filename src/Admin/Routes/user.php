<?php
Route::group(['prefix' => 'user'], function () {
    Route::get('/', 'Auth\UsersController@index')->name('admin_user.index');
    Route::get('create', 'Auth\UsersController@create')->name('admin_user.create');
    Route::post('/create', 'Auth\UsersController@postCreate')->name('admin_user.create');
    Route::get('/edit/{id}', 'Auth\UsersController@edit')->name('admin_user.edit');
    Route::post('/edit/{id}', 'Auth\UsersController@postEdit')->name('admin_user.edit');
    Route::post('/delete', 'Auth\UsersController@deleteList')->name('admin_user.delete');
});
