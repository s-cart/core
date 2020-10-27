<?php
Route::group(['prefix' => 'order_status'], function () {
    Route::get('/', 'AdminOrderStatusController@index')->name('admin_order_status.index');
    Route::get('create', function () {
        return redirect()->route('admin_order_status.index');
    });
    Route::post('/create', 'AdminOrderStatusController@postCreate')->name('admin_order_status.create');
    Route::get('/edit/{id}', 'AdminOrderStatusController@edit')->name('admin_order_status.edit');
    Route::post('/edit/{id}', 'AdminOrderStatusController@postEdit')->name('admin_order_status.edit');
    Route::post('/delete', 'AdminOrderStatusController@deleteList')->name('admin_order_status.delete');
});
