<?php
if (file_exists(app_path('Admin/Controllers/AdminNoticeController.php'))) {
    $nameSpaceAdmin = 'App\Admin\Controllers';
} else {
    $nameSpaceAdmin = 'SCart\Core\Admin\Controllers';
}
Route::group(['prefix' => 'notice'], function () use ($nameSpaceAdmin) {
    Route::get('/', $nameSpaceAdmin.'\AdminNoticeController@index')->name('admin_notice.index');
    Route::get('mark_read', $nameSpaceAdmin.'\AdminNoticeController@markRead')->name('admin_notice.mark_read');
    Route::get('url/{type}/{typeId}', $nameSpaceAdmin.'\AdminNoticeController@url')->name('admin_notice.url');
});