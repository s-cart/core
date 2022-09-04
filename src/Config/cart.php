<?php

return [
    'expire' => [
        'cart' => env('CART_EXPIRE_CART', 7), //days
        'wishlist' => env('CART_EXPIRE_WISHLIST', 30), //days
        'compare' => env('CART_EXPIRE_COMPARE', 30), //days
    ],
    'process' => [
        'other_fee' => [
            'value' => env('PROCESS_OTHER_FEE', 0),
            'title' => env('PROCESS_OTHER_TITLE', 'Other fee'),
        ],
    ],
];
