<?php
return [
    'core'             => '9.0',
    'core-sub-version' => '9.0.5',
    'homepage'         => 'https://s-cart.org',
    'name'             => 'S-Cart',
    'github'           => 'https://github.com/s-cart/s-cart',
    'facebook'         => 'https://www.facebook.com/SCart.Ecommerce',
    'auth'             => 'Lanh Le',
    'email'            => 'lanhktc@gmail.com',
    'api_link'         => env('SC_API_LINK', 'https://api.s-cart.org/v3'),
    'ecommerce_mode'   => env('SC_ECOMMERCE_MODE', 1),
    'search_mode'      => env('SC_SEARCH_MODE', 'PRODUCT'), //PRODUCT,NEWS,CMS
];
