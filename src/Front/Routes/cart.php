<?php
$prefixCartWishlist = sc_config('PREFIX_CART_WISHLIST') ?? 'wishlist';
$prefixCartCompare = sc_config('PREFIX_CART_COMPARE') ?? 'compare';
$prefixCartDefault = sc_config('PREFIX_CART_DEFAULT') ?? 'cart';
$prefixCartCheckout = sc_config('PREFIX_CART_CHECKOUT') ?? 'checkout';
$prefixOrderSuccess = sc_config('PREFIX_ORDER_SUCCESS') ?? 'order-success';

Route::get('/'.$prefixCartWishlist.$suffix, 'ShopCartController@wishlist')
->name('wishlist');
Route::get('/wishlist_remove/{id}', 'ShopCartController@removeItemWishlist')
->name('wishlist.remove');

Route::get('/'.$prefixCartCompare.$suffix, 'ShopCartController@compare')
->name('compare');
Route::get('/compare_remove/{id}', 'ShopCartController@removeItemCompare')
->name('compare.remove');    

Route::get('/'.$prefixCartDefault.$suffix, 'ShopCartController@getCart')
->name('cart');
Route::post('/cart_add', 'ShopCartController@addToCart')
->name('cart.add');
Route::get('/cart_remove/{id}', 'ShopCartController@removeItem')
->name('cart.remove');
Route::get('/clear_Cart/{instance?}', 'ShopCartController@clearCart')
->name('cart.clear');
Route::post('/add_to_cart_ajax', 'ShopCartController@addToCartAjax')
->name('cart.add_ajax');
Route::post('/update_to_cart', 'ShopCartController@updateToCart')
->name('cart.update');
Route::post('/checkout_prepare', 'ShopCartController@processCart')
->name('cart.process');

Route::get('/'.$prefixCartCheckout.$suffix, 'ShopCartController@getCheckout')
->name('checkout');

Route::post('/order_add', 'ShopCartController@addOrder')
->name('order.add');

Route::get('/'.$prefixOrderSuccess.$suffix, 'ShopCartController@orderSuccess')
->name('order.success');