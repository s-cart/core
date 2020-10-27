<?php
Route::group(['prefix' => 'attribute_group'], function () {
    Route::get('/', 'AdminAttributeGroupController@index')->name('admin_attribute_group.index');
    Route::get('create', function () {
        return redirect()->route('admin_attribute_group.index');
    });
    Route::post('/create', 'AdminAttributeGroupController@postCreate')->name('admin_attribute_group.create');
    Route::get('/edit/{id}', 'AdminAttributeGroupController@edit')->name('admin_attribute_group.edit');
    Route::post('/edit/{id}', 'AdminAttributeGroupController@postEdit')->name('admin_attribute_group.edit');
    Route::post('/delete', 'AdminAttributeGroupController@deleteList')->name('admin_attribute_group.delete');
});
