<?php
Route::group(['prefix' => 'length_unit'], function () {
    Route::get('/', 'AdminLengthController@index')->name('admin_length_unit.index');
    Route::get('create', function () {
        return redirect()->route('admin_length_unit.index');
    });
    Route::post('/create', 'AdminLengthController@postCreate')->name('admin_length_unit.create');
    Route::get('/edit/{id}', 'AdminLengthController@edit')->name('admin_length_unit.edit');
    Route::post('/edit/{id}', 'AdminLengthController@postEdit')->name('admin_length_unit.edit');
    Route::post('/delete', 'AdminLengthController@deleteList')->name('admin_length_unit.delete');
});
