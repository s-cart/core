<?php

return [
    'auth' => [
        'api_remmember' => env('API_RECOMMEMBER', 7), //days - expires_at
        'api_remmember_admin' => env('API_RECOMMEMBER_ADMIN', 7), //days - expires_at
        'api_scope_type' => env('API_SCOPE_TYPE', 'ability'), //ability|abilities
        'api_scope_type_admin' => env('API_SCOPE_TYPE_ADMIN', 'ability'), //ability|abilities
        'api_scope_user' => env('API_SCOPE_USER', 'user'), //string, separated by commas
        'api_scope_user_guest' => env('API_SCOPE_USER_GUEST', 'user-guest'), //string, separated by commas
        'api_scope_admin' => env('API_SCOPE_ADMIN', 'admin-supper'),//string, separated by commas
    ],
];
