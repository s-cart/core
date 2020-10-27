<?php
Route::group(['prefix' => 'weight_unit'], function () {
    Route::get('/', 'AdminWeightController@index')->name('admin_weight_unit.index');
    Route::get('create', function () {
        return redirect()->route('admin_weight_unit.index');
    });
    Route::post('/create', 'AdminWeightController@postCreate')->name('admin_weight_unit.create');
    Route::get('/edit/{id}', 'AdminWeightController@edit')->name('admin_weight_unit.edit');
    Route::post('/edit/{id}', 'AdminWeightController@postEdit')->name('admin_weight_unit.edit');
    Route::post('/delete', 'AdminWeightController@deleteList')->name('admin_weight_unit.delete');
});
