<?php
Route::group(['prefix' => 'tax'], function () {
    Route::get('/', 'AdminTaxController@index')->name('admin_tax.index');
    Route::get('create', function () {
        return redirect()->route('admin_tax.index');
    });
    Route::post('/create', 'AdminTaxController@postCreate')->name('admin_tax.create');
    Route::get('/edit/{id}', 'AdminTaxController@edit')->name('admin_tax.edit');
    Route::post('/edit/{id}', 'AdminTaxController@postEdit')->name('admin_tax.edit');
    Route::post('/delete', 'AdminTaxController@deleteList')->name('admin_tax.delete');
});
