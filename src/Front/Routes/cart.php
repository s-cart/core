<?php
/**
 * Route for cart
 */
Route::group(
    [
        'prefix' => $langUrl
    ], 
    function ($router) use ($suffix) {
        $prefixCartWishlist = sc_config('PREFIX_CART_WISHLIST') ?? 'wishlist';
        $prefixCartCompare = sc_config('PREFIX_CART_COMPARE') ?? 'compare';
        $prefixCartDefault = sc_config('PREFIX_CART_DEFAULT') ?? 'cart';

        //Wishlist
        $router->get($prefixCartWishlist.$suffix, 'ShopCartController@wishlistProcessFront')
            ->name('wishlist');

        //Compare
        $router->get($prefixCartCompare.$suffix, 'ShopCartController@compareProcessFront')
            ->name('compare');

        //Cart
        $router->get($prefixCartDefault.$suffix, 'ShopCartController@getCartProcessFront')
            ->name('cart');

        $router->post('/cart_add', 'ShopCartController@addToCart')
            ->name('cart.add');

        $router->get('/{instance}/remove/{id}', 'ShopCartController@removeItemProcessFront')
            ->name('cart.remove');

        $router->get('/clear_cart/{instance}', 'ShopCartController@clearCartProcessFront')
            ->name('cart.clear');

        $router->post('/add_to_cart_ajax', 'ShopCartController@addToCartAjax')
            ->name('cart.add_ajax');
            
        $router->post('/update_to_cart', 'ShopCartController@updateToCart')
            ->name('cart.update');
    }
);