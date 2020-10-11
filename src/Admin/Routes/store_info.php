<?php
Route::group(['prefix' => 'store_info'], function () {
    Route::get('/', 'AdminStoreInfoController@index')->name('admin_store.index');  
    Route::post('/update_info', 'AdminStoreInfoController@updateInfo')->name('admin_store.update');
    Route::get('/process/{storeId}', 'AdminStoreInfoController@switchStore')->name('admin_store.switch');
});
