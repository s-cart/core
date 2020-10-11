<?php

use Illuminate\Support\Facades\Route;

Route::group(
    [
        'prefix' => SC_ADMIN_PREFIX,
        'middleware' => SC_ADMIN_MIDDLEWARE,
        'namespace' => 'SCart\Core\Admin\Controllers'
    ], 
    function () {
    foreach (glob(__DIR__ . '/Routes/*.php') as $filename) {
        require_once $filename;
    }
    Route::get('/', 'DashboardController@index')->name('admin.home');
    Route::get('deny', 'DashboardController@deny')->name('admin.deny');
    Route::get('data_not_found', 'DashboardController@dataNotFound')->name('admin.data_not_found');
    Route::get('deny_single', 'DashboardController@denySingle')->name('admin.deny_single');

    //Language
    Route::get('locale/{code}', function ($code) {
        session(['locale' => $code]);
        return back();
    })->name('admin.locale');

    //theme
    Route::get('theme/{theme}', function ($theme) {
        session(['adminTheme' => $theme]);
        if (!\Admin::user()->isViewAll()) {
            \Admin::user()->update(['theme' => $theme]);
        }
        return back();
    })->name('admin.theme');
});
