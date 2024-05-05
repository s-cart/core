<?php
/**
 * Route front
 */
if(sc_config_exist('Plugin_Key')) {
Route::group(
    [
        'prefix'    => 'plugin/PluginUrlKey',
        'namespace' => 'App\Plugins\Plugin_Code\Plugin_Key\Controllers',
    ],
    function () {
        Route::get('index', 'FrontController@index')
        ->name('PluginUrlKey.index');
    }
);
}
/**
 * Route admin
 */
if(sc_config_exist('Plugin_Key', SC_ID_ROOT)) {
Route::group(
    [
        'prefix' => SC_ADMIN_PREFIX.'/PluginUrlKey',
        'middleware' => SC_ADMIN_MIDDLEWARE,
        'namespace' => 'App\Plugins\Plugin_Code\Plugin_Key\Admin',
    ], 
    function () {
        Route::get('/', 'AdminController@index')
        ->name('admin_PluginUrlKey.index');
    }
);
}