<?php
Route::group(['prefix' => 'order'], function () {
    Route::get('/', 'AdminOrderController@index')->name('admin_order.index');
    Route::get('/detail/{id}', 'AdminOrderController@detail')->name('admin_order.detail');
    Route::get('create', 'AdminOrderController@create')->name('admin_order.create');
    Route::post('/create', 'AdminOrderController@postCreate')->name('admin_order.create');
    Route::post('/add_item', 'AdminOrderController@postAddItem')->name('admin_order.add_item');
    Route::post('/edit_item', 'AdminOrderController@postEditItem')->name('admin_order.edit_item');
    Route::post('/delete_item', 'AdminOrderController@postDeleteItem')->name('admin_order.delete_item');
    Route::post('/update', 'AdminOrderController@postOrderUpdate')->name('admin_order.update');
    Route::post('/delete', 'AdminOrderController@deleteList')->name('admin_order.delete');
    Route::get('/product_info', 'AdminOrderController@getInfoProduct')->name('admin_order.product_info');
    Route::get('/user_info', 'AdminOrderController@getInfoUser')->name('admin_order.user_info');
    Route::get('/export_detail', 'AdminOrderController@exportDetail')->name('admin_order.export_detail');

});
