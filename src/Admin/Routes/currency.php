<?php
Route::group(['prefix' => 'currency'], function () {
    Route::get('/', 'AdminCurrencyController@index')->name('admin_currency.index');
    Route::get('/create', 'AdminCurrencyController@create')->name('admin_currency.create');
    Route::post('/create', 'AdminCurrencyController@postCreate')->name('admin_currency.create');
    Route::get('/edit/{id}', 'AdminCurrencyController@edit')->name('admin_currency.edit');
    Route::post('/edit/{id}', 'AdminCurrencyController@postEdit')->name('admin_currency.edit');
    Route::post('/delete', 'AdminCurrencyController@deleteList')->name('admin_currency.delete');
});
