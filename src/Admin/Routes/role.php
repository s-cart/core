<?php
    Route::group(['prefix' => 'role'], function () {
        Route::get('/', 'Auth\RoleController@index')->name('admin_role.index');
        Route::get('create', 'Auth\RoleController@create')->name('admin_role.create');
        Route::post('/create', 'Auth\RoleController@postCreate')->name('admin_role.create');
        Route::get('/edit/{id}', 'Auth\RoleController@edit')->name('admin_role.edit');
        Route::post('/edit/{id}', 'Auth\RoleController@postEdit')->name('admin_role.edit');
        Route::post('/delete', 'Auth\RoleController@deleteList')->name('admin_role.delete');
    });