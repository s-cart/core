<?php
Route::group(['prefix' => 'payment_status'], function () {
    Route::get('/', 'AdminPaymentStatusController@index')->name('admin_payment_status.index');
    Route::get('create', function () {
        return redirect()->route('admin_payment_status.index');
    });
    Route::post('/create', 'AdminPaymentStatusController@postCreate')->name('admin_payment_status.create');
    Route::get('/edit/{id}', 'AdminPaymentStatusController@edit')->name('admin_payment_status.edit');
    Route::post('/edit/{id}', 'AdminPaymentStatusController@postEdit')->name('admin_payment_status.edit');
    Route::post('/delete', 'AdminPaymentStatusController@deleteList')->name('admin_payment_status.delete');
});
