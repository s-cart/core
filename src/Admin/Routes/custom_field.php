<?php
Route::group(['prefix' => 'custom_field'], function () {
    Route::get('/', 'AdminCustomFieldController@index')->name('admin_custom_field.index');
    Route::get('create', function () {
        return redirect()->route('admin_custom_field.index');
    });
    Route::post('/create', 'AdminCustomFieldController@postCreate')->name('admin_custom_field.create');
    Route::get('/edit/{id}', 'AdminCustomFieldController@edit')->name('admin_custom_field.edit');
    Route::post('/edit/{id}', 'AdminCustomFieldController@postEdit')->name('admin_custom_field.edit');
    Route::post('/delete', 'AdminCustomFieldController@deleteList')->name('admin_custom_field.delete');
});
