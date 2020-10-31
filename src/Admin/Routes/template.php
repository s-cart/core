<?php
Route::group(['prefix' => 'template'], function () {
    //Process import
        Route::get('/import', 'AdminTemplateController@importTemplate')
        ->name('admin_template.import');
    Route::post('/import', 'AdminTemplateController@processImport')
        ->name('admin_template.process_import');
    //End process

    Route::get('/', 'AdminTemplateController@index')->name('admin_template.index');
    Route::post('changeTemplate', 'AdminTemplateController@changeTemplate')->name('admin_template.changeTemplate');
    Route::post('remove', 'AdminTemplateController@remove')->name('admin_template.remove');

    if(config('admin.settings.api_template')) {
        Route::get('/online', 'AdminTemplateOnlineController@index')->name('admin_template_online.index');
        Route::post('/online/install', 'AdminTemplateOnlineController@install')
        ->name('admin_template_online.install');
    }

});
