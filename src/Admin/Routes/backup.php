<?php
Route::group(['prefix' => 'backup'], function () {
    Route::get('/', 'AdminBackupController@index')->name('admin_backup.index');
    Route::post('generate', 'AdminBackupController@generateBackup')->name('admin.backup.generate');
    Route::post('process', 'AdminBackupController@processBackupFile')->name('admin.backup.process');
});
