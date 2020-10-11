<?php
Route::group(['prefix' => 'permission'], function () {
    Route::get('/', 'Auth\PermissionController@index')->name('admin_permission.index');
    Route::get('create', 'Auth\PermissionController@create')->name('admin_permission.create');
    Route::post('/create', 'Auth\PermissionController@postCreate')->name('admin_permission.create');
    Route::get('/edit/{id}', 'Auth\PermissionController@edit')->name('admin_permission.edit');
    Route::post('/edit/{id}', 'Auth\PermissionController@postEdit')->name('admin_permission.edit');
    Route::post('/delete', 'Auth\PermissionController@deleteList')->name('admin_permission.delete');
});
