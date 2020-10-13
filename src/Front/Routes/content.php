<?php
$prefixSearch = sc_config('PREFIX_SEARCH')??'search';
$prefixContact = sc_config('PREFIX_CONTACT')??'contact';
$prefixNews = sc_config('PREFIX_NEWS')??'news';

Route::get('/'.$prefixSearch.$suffix, 'ShopContentController@search')
->name('search');
Route::post('/subscribe', 'ShopContentController@emailSubscribe')
->name('subscribe');
Route::get('/'.$prefixContact.$suffix, 'ShopContentController@getContact')
->name('contact');
Route::post('/contact', 'ShopContentController@postContact')
->name('contact.post');
Route::get('/'.$prefixNews, 'ShopContentController@news')
->name('news');
Route::get('/'.$prefixNews.'/{alias}'.$suffix, 'ShopContentController@newsDetail')
->name('news.detail');
