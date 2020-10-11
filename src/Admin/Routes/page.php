<?php
Route::group(['prefix' => 'page'], function () {
    Route::get('/', 'AdminPageController@index')->name('admin_page.index');
    Route::get('create', 'AdminPageController@create')->name('admin_page.create');
    Route::post('/create', 'AdminPageController@postCreate')->name('admin_page.create');
    Route::get('/edit/{id}', 'AdminPageController@edit')->name('admin_page.edit');
    Route::post('/edit/{id}', 'AdminPageController@postEdit')->name('admin_page.edit');
    Route::post('/delete', 'AdminPageController@deleteList')->name('admin_page.delete');
});
//=Page
