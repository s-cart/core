<?php
if (file_exists(app_path('Admin/Controllers/AdminStoreLinkController.php'))) {
    $nameSpaceAdminStoreLink = 'App\Admin\Controllers';
} else {
    $nameSpaceAdminStoreLink = 'SCart\Core\Admin\Controllers';
}
Route::group(['prefix' => 'store_link'], function () use ($nameSpaceAdminStoreLink) {
    Route::get('/', $nameSpaceAdminStoreLink.'\AdminStoreLinkController@index')->name('admin_store_link.index');
    Route::get('create', $nameSpaceAdminStoreLink.'\AdminStoreLinkController@create')->name('admin_store_link.create');
    Route::post('/create', $nameSpaceAdminStoreLink.'\AdminStoreLinkController@postCreate')->name('admin_store_link.create');
    Route::get('/edit/{id}', $nameSpaceAdminStoreLink.'\AdminStoreLinkController@edit')->name('admin_store_link.edit');
    Route::post('/edit/{id}', $nameSpaceAdminStoreLink.'\AdminStoreLinkController@postEdit')->name('admin_store_link.edit');
    Route::post('/delete', $nameSpaceAdminStoreLink.'\AdminStoreLinkController@deleteList')->name('admin_store_link.delete');
});