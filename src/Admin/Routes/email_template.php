<?php
Route::group(['prefix' => 'email_template'], function () {
    Route::get('/', 'AdminEmailTemplateController@index')->name('admin_email_template.index');
    Route::get('create', 'AdminEmailTemplateController@create')->name('admin_email_template.create');
    Route::post('/create', 'AdminEmailTemplateController@postCreate')->name('admin_email_template.create');
    Route::get('/edit/{id}', 'AdminEmailTemplateController@edit')->name('admin_email_template.edit');
    Route::post('/edit/{id}', 'AdminEmailTemplateController@postEdit')->name('admin_email_template.edit');
    Route::post('/delete', 'AdminEmailTemplateController@deleteList')->name('admin_email_template.delete');
    Route::get('/list_variable', 'AdminEmailTemplateController@listVariable')->name('admin_email_template.list_variable');
});
