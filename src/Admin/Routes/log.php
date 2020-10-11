<?php
Route::group(['prefix' => 'log'], function () {
    Route::get('/', 'AdminLogController@index')->name('admin_log.index');
    Route::post('/delete', 'AdminLogController@deleteList')->name('admin_log.delete');
});
