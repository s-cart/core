<?php
Route::group(
    [
        'prefix' => $langUrl
    ], 
    function ($router) use ($suffix) {
        $prefixSearch = sc_config('PREFIX_SEARCH')??'search';
        $prefixContact = sc_config('PREFIX_CONTACT')??'contact';
        $prefixNews = sc_config('PREFIX_NEWS')??'news';

        //Search
        $router->get($prefixSearch.$suffix, 'ShopContentController@searchProcessFront')
            ->name('search');

        //Subscribe
        $router->post('/subscribe', 'ShopContentController@emailSubscribe')
            ->name('subscribe');

        //contact
        $router->get($prefixContact.$suffix, 'ShopContentController@getContactProcessFront')
            ->name('contact');
        $router->post('/contact', 'ShopContentController@postContact')
            ->name('contact.post');

        //News
        $router->get($prefixNews, 'ShopContentController@newsProcessFront')
            ->name('news');
        $router->get($prefixNews.'/{alias}'.$suffix, 'ShopContentController@newsDetailProcessFront')
            ->name('news.detail');
    }
);
