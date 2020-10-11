<?php
Route::group(['prefix' => 'report'], function () {
    Route::get('/product', 'AdminReportController@product')->name('admin_report.product');
});
