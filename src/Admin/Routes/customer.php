<?php
Route::group(['prefix' => 'customer'], function () {
    Route::get('/', 'AdminCustomerController@index')->name('admin_customer.index');
    Route::get('create', 'AdminCustomerController@create')->name('admin_customer.create');
    Route::post('/create', 'AdminCustomerController@postCreate')->name('admin_customer.create');
    Route::get('/edit/{id}', 'AdminCustomerController@edit')->name('admin_customer.edit');
    Route::post('/edit/{id}', 'AdminCustomerController@postEdit')->name('admin_customer.edit');
    Route::post('/delete', 'AdminCustomerController@deleteList')->name('admin_customer.delete');
    Route::get('/update-address/{id}', 'AdminCustomerController@updateAddress')->name('admin_customer.update_address');
    Route::post('/update-address/{id}', 'AdminCustomerController@postUpdateAddress')->name('admin_customer.post_update_address');
    Route::post('/delete-address', 'AdminCustomerController@deleteAddress')->name('admin_customer.delete_address');
});
