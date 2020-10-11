<?php
Route::group(['prefix' => 'menu'], function () {
    Route::get('/', 'AdminMenuController@index')->name('admin_menu.index');
    Route::post('/create', 'AdminMenuController@postCreate')->name('admin_menu.create');
    Route::get('/edit/{id}', 'AdminMenuController@edit')->name('admin_menu.edit');
    Route::post('/edit/{id}', 'AdminMenuController@postEdit')->name('admin_menu.edit');
    Route::post('/delete', 'AdminMenuController@deleteList')->name('admin_menu.delete');
    Route::post('/update_sort', 'AdminMenuController@updateSort')->name('admin_menu.update_sort');
});
