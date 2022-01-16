<?php
if (file_exists(app_path('Admin/Controllers/AdminStoreInfoController.php'))) {
    $nameSpaceAdminStoreInfo = 'App\Admin\Controllers';
} else {
    $nameSpaceAdminStoreInfo = 'SCart\Core\Admin\Controllers';
}
Route::group(['prefix' => 'store_info'], function () use ($nameSpaceAdminStoreInfo) {
    Route::get('/', $nameSpaceAdminStoreInfo.'\AdminStoreInfoController@index')->name('admin_store.index');
    Route::post('/update_info', $nameSpaceAdminStoreInfo.'\AdminStoreInfoController@updateInfo')->name('admin_store.update');
});