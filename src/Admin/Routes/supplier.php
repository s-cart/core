<?php
Route::group(['prefix' => 'supplier'], function () {
    Route::get('/', 'AdminSupplierController@index')->name('admin_supplier.index');
    Route::get('create', function () {
        return redirect()->route('admin_supplier.index');
    });
    Route::post('/create', 'AdminSupplierController@postCreate')->name('admin_supplier.create');
    Route::get('/edit/{id}', 'AdminSupplierController@edit')->name('admin_supplier.edit');
    Route::post('/edit/{id}', 'AdminSupplierController@postEdit')->name('admin_supplier.edit');
    Route::post('/delete', 'AdminSupplierController@deleteList')->name('admin_supplier.delete');
});
