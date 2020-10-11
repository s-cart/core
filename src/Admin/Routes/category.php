<?php
Route::group(['prefix' => 'category'], function () {
    Route::get('/', 'AdminCategoryController@index')->name('admin_category.index');
    Route::get('create', 'AdminCategoryController@create')->name('admin_category.create');
    Route::post('/create', 'AdminCategoryController@postCreate')->name('admin_category.create');
    Route::get('/edit/{id}', 'AdminCategoryController@edit')->name('admin_category.edit');
    Route::post('/edit/{id}', 'AdminCategoryController@postEdit')->name('admin_category.edit');
    Route::post('/delete', 'AdminCategoryController@deleteList')->name('admin_category.delete');
});
