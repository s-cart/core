<?php
Route::group(['prefix' => 'sub_category'], function () {
    Route::get('/', 'AdminSubCategoryController@index')->name('admin_sub_category.index');
    Route::get('create', 'AdminSubCategoryController@create')->name('admin_sub_category.create');
    Route::post('/create', 'AdminSubCategoryController@postCreate')->name('admin_sub_category.create');
    Route::get('/edit/{id}', 'AdminSubCategoryController@edit')->name('admin_sub_category.edit');
    Route::post('/edit/{id}', 'AdminSubCategoryController@postEdit')->name('admin_sub_category.edit');
    Route::post('/delete', 'AdminSubCategoryController@deleteList')->name('admin_sub_category.delete');
});
