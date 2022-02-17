<?php

return [
    'theme'               => ['lightblue', 'dark', 'blue', 'white', 'pink'],
    'theme_default'       => 'lightblue',
    'theme_define'        => [
        'lightblue'       => [
            'body'        => 'accent-lightblue',
            'main-header' => 'navbar-dark navbar-lightblue',
            'sidebar'     => 'sidebar-lightblue',
        ],
        'dark'            => [
            'body'        => 'accent-navy',
            'main-header' => 'navbar-dark navbar-gray-dark',
            'sidebar'     => 'sidebar-gray-dark',
        ],
        'blue'            => [
            'body'        => 'accent-success',
            'main-header' => 'navbar-dark navbar-success',
            'sidebar'     => 'sidebar-success',
        ],
        'white'           => [
            'body'        => 'accent-lightblue',
            'main-header' => 'navbar-light navbar-white',
            'sidebar'     => 'sidebar-white',
        ],
        'pink'            => [
            'body'        => 'accent-fuchsia',
            'main-header' => 'navbar-dark navbar-pink',
            'sidebar'     => 'sidebar-pink',
        ],
    ],
    //Enable, disable page libary online
    'settings' => [
        'api_plugin'   => 1,
        'api_template' => 1,
    ],
    //Prefix path view admin
    'path_view' => 's-cart-admin::',

    //Config global
    'admin_log' => 1, //Log access admin

    'admin_dashboard' => [
        'total_order' => 1, // Total order
        'total_customer' => 1, //Customer total
        'total_blog' => 1, //Blog total
        'total_product' => 1, //Product total
        'order_month' => 1, //Order in month
        'order_year' => 1, //Order in year
        'pie_chart' => 0, //Display pie chart total
        'top_order_new' => 1, //New orders
        'top_customer_new' => 1, //New customers
        'pie_chart_type' => 'order', // [order|device|country]
    ],
    //List plugins can not remore
    'plugin_protected' => [
        'Cash', // Payment,
        'ShippingStandard', // Shipping,
        'Discount', // Total,
        'GoogleCaptcha', // Other,
        'MultiVendorPro', // Other,
        'MultiVendor', // Other,
        'B2B', // Other,
        'MultiStorePro', // Other,
        'MultiStore', // Other,
        'Content', // Cms,
    ],
];
