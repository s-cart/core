<?php

return [
    'customize'           => false, 
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
];
