<?php
Route::group(
    [
        'prefix' => $langUrl
    ], 
    function ($router) use ($suffix) {
        $prefixCartCheckout = sc_config('PREFIX_CART_CHECKOUT') ?? 'checkout';
        $prefixCartCheckoutConfirm = sc_config('PREFIX_CART_CHECKOUT_CONFIRM') ?? 'checkout-confirm';
        $prefixOrderSuccess = sc_config('PREFIX_ORDER_SUCCESS') ?? 'order-success';
        
        //Checkout prepare, from screen cart to checkout
        $router->post('/checkout-prepare', 'ShopCartController@prepareCheckout')
            ->name('checkout.prepare');

        //Checkout screen
        $router->get($prefixCartCheckout.$suffix, 'ShopCartController@getCheckoutFront')
            ->name('checkout');

        //Checkout process, from screen checkout to checkout confirm
        $router->post('/checkout-process', 'ShopCartController@processCheckout')
            ->name('checkout.process');

        //Checkout process, from screen checkout confirm to order
        $router->get($prefixCartCheckoutConfirm.$suffix, 'ShopCartController@getCheckoutConfirmFront')
            ->name('checkout.confirm');

        //Add order
        $router->post('/order-add', 'ShopCartController@addOrder')
            ->name('order.add');

        //Order success
        $router->get($prefixOrderSuccess.$suffix, 'ShopCartController@orderSuccessProcessFront')
            ->name('order.success');
    }
);