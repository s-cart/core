<?php
Route::group(['prefix' => 'shipping_status'], function () {
    Route::get('/', 'AdminShipingStatusController@index')
        ->name('admin_shipping_status.index');
    Route::get('create', function () {
        return redirect()->route('admin_shipping_status.index');
    });
    Route::post('/create', 'AdminShipingStatusController@postCreate')
        ->name('admin_shipping_status.create');
    Route::get('/edit/{id}', 'AdminShipingStatusController@edit')
        ->name('admin_shipping_status.edit');
    Route::post('/edit/{id}', 'AdminShipingStatusController@postEdit')
        ->name('admin_shipping_status.edit');
    Route::post('/delete', 'AdminShipingStatusController@deleteList')
        ->name('admin_shipping_status.delete');
});