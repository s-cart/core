<?php
Route::group(['prefix' => 'plugin'], function () {
    //Process import
    Route::get('/import', 'AdminPluginsController@importPlugin')
        ->name('admin_plugin.import');
    Route::post('/import', 'AdminPluginsController@processImport')
        ->name('admin_plugin.process_import');
    //End process
    
    Route::get('/{code}', 'AdminPluginsController@index')
        ->name('admin_plugin');
    Route::post('/install', 'AdminPluginsController@install')
        ->name('admin_plugin.install');
    Route::post('/uninstall', 'AdminPluginsController@uninstall')
        ->name('admin_plugin.uninstall');
    Route::post('/enable', 'AdminPluginsController@enable')
        ->name('admin_plugin.enable');
    Route::post('/disable', 'AdminPluginsController@disable')
        ->name('admin_plugin.disable');

    if(config('admin.settings.api_plugin')) {
        Route::get('/{code}/online', 'AdminPluginsOnlineController@index')
        ->name('admin_plugin_online');
        Route::post('/install/online', 'AdminPluginsOnlineController@install')
            ->name('admin_plugin_online.install');
    }
});
