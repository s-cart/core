<?php

use Illuminate\Support\Facades\Route;

//Route plugin
Route::group(
    [
        'middleware' => SC_FRONT_MIDDLEWARE,
    ], 
    function () {
        foreach (glob(app_path() . '/Plugins/*/*/Route.php') as $filename) {
            require_once $filename;
        }       
    });

$suffix = sc_config('SUFFIX_URL')??'';
Route::middleware(SC_FRONT_MIDDLEWARE)
    ->namespace('App\Http\Controllers')
    ->group(function () use($suffix){
        foreach (glob(__DIR__ . '/Routes/*.php') as $filename) {
            require_once $filename;
        }       
    });


Route::group(
    [
        'middleware' => SC_FRONT_MIDDLEWARE,
        'namespace' => 'App\Http\Controllers',
    ], 
    function () {
    
    $prefixShop = sc_config('PREFIX_SHOP')??'shop';

    Route::get('/', 'ShopContentController@index')->name('home');
    Route::get('/'.$prefixShop, 'ShopContentController@shop')->name('shop');
    Route::get('index.html', 'ShopContentController@index');
    
    $suffix = sc_config('SUFFIX_URL')??'';
    
    //Language
    Route::get('locale/{code}', function ($code) {
        session(['locale' => $code]);
        return back();
    })->name('locale');
    
    //Currency
    Route::get('currency/{code}', function ($code) {
        session(['currency' => $code]);
        return back();
    })->name('currency');
    
    //Process click banner
    Route::get('/banner/{id}', 'ShopContentController@clickBanner')
    ->name('banner.click');    
    
    //--Please keep 2 lines route (pages + pageNotFound) at the bottom
    Route::get('/{alias}'.$suffix, 'ShopContentController@pageDetail')->name('page.detail');
    // Route::fallback('ShopContentController@pageNotFound')->name('pageNotFound'); //Make sure before using this route. 
    // There will be disadvantages when detecting 404 errors for static files like images, scripts ..
    //--end keep
    
    //=======End Front
});
