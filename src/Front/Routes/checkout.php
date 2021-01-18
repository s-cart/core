<?php
Route::group(
    [
        'prefix' => $langUrl
    ], 
    function ($router) use ($suffix) {
        $prefixCartCheckout = sc_config('PREFIX_CART_CHECKOUT') ?? 'checkout';
        $prefixOrderSuccess = sc_config('PREFIX_ORDER_SUCCESS') ?? 'order-success';
        
        //Checkout prepare
        $router->post('/checkout_prepare', 'ShopCartController@checkoutPrepareProcessFront')
            ->name('checkout.prepare');

        //Checkout
        $router->get($prefixCartCheckout.$suffix, 'ShopCartController@getCheckoutProcessFront')
            ->name('checkout');

        //Add order
        $router->post('/order_add', 'ShopCartController@addOrder')
            ->name('order.add');

        //Order success
        $router->get($prefixOrderSuccess.$suffix, 'ShopCartController@orderSuccessProcessFront')
            ->name('order.success');
    }
);