<?php
Route::group(['prefix' => 'language_manager'], function () {
    Route::get('/', 'AdminLanguageManagerController@index')->name('admin_language_manager.index');
    Route::post('/update', 'AdminLanguageManagerController@postUpdate')->name('admin_language_manager.update');
});
