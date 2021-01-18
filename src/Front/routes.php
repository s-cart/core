<?php

use Illuminate\Support\Facades\Route;

$suffix = sc_config('SUFFIX_URL')??'';
$langUrl = config('app.seoLang'); 

//Route plugin
Route::group(
    [
        'middleware' => SC_FRONT_MIDDLEWARE,
    ], 
    function () {
        foreach (glob(app_path() . '/Plugins/*/*/Route.php') as $filename) {
            require_once $filename;
        }       
    }
);

//Include route component
Route::middleware(SC_FRONT_MIDDLEWARE)
    ->namespace('App\Http\Controllers')
    ->group(function () use ($suffix) {
        foreach (glob(__DIR__ . '/Routes/*.php') as $filename) {
            require_once $filename;
        }       
    });


Route::group(
    [
        'middleware' => SC_FRONT_MIDDLEWARE,
        'namespace' => 'App\Http\Controllers',
    ], 
    function () use ($suffix, $langUrl) {
    
        //Route home
        Route::get('/', 'ShopContentController@index')
            ->name('home');
        Route::get('index.html', 'ShopContentController@index');
        Route::get('{lang?}', 'ShopContentController@index')
            ->where(['lang' => '[a-zA-Z]{2}'])
            ->name('home.lang');

        //Route shop
        $prefixShop = sc_config('PREFIX_SHOP')??'shop';
        Route::get($langUrl.$prefixShop, 'ShopContentController@shopProcessFront')
            ->name('shop');

        //Language
        Route::get('locale/{code}', function ($code) {
            session(['locale' => $code]);
            if (request()->fullUrl() === redirect()->back()->getTargetUrl()
            ) {
                return redirect()->route('home');
            }
            if (sc_route('home.lang') === redirect()->back()->getTargetUrl()
            ) {
                return redirect(sc_route('home.lang', ['lang' => $code]));
            }

            $urlBack = str_replace(url('/' . app()->getLocale()) . '/', url('/' . $code) . '/', back()->getTargetUrl());
            return redirect($urlBack);
        })->name('locale');
        
        //Currency
        Route::get('currency/{code}', function ($code) {
            session(['currency' => $code]);
            if (request()->fullUrl() === redirect()->back()->getTargetUrl()) {
                return redirect()->route('home');
            }

            return back();
        })->name('currency');
        
        //Process click banner
        Route::get('/banner/{id}', 'ShopContentController@clickBanner')
        ->name('banner.click');    
        
        // //Site map
        // Route::get('/sitemap.xml', 'ShopContentController@sitemap');

        //--Please keep 2 lines route (pages + pageNotFound) at the bottom
        Route::get($langUrl.'{alias}'.$suffix, 'ShopContentController@pageDetailProcessFront')->name('page.detail');
        // Route::fallback('ShopContentController@pageNotFound')->name('pageNotFound'); //Make sure before using this route. 
        // There will be disadvantages when detecting 404 errors for static files like images, scripts ..
        //--end keep
        
        //=======End Front
    }
);
