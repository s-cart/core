<?php
Route::group(['prefix' => 'auth'], function () {
    $authController = Auth\LoginController::class;
    Route::get('login', $authController . '@getLogin')->name('admin.login');
    Route::post('login', $authController . '@postLogin')->name('admin.login');
    Route::get('logout', $authController . '@getLogout')->name('admin.logout');
    Route::get('setting', $authController . '@getSetting')->name('admin.setting');
    Route::post('setting', $authController . '@putSetting')->name('admin.setting');
});
