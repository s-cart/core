<?php
$prefixCustomer = sc_config('PREFIX_MEMBER') ?? 'customer';

if (sc_config('customer_verify')) {
    $midlware = ['auth','email.verify'];
} else {
    $midlware = ['auth'];
}
Route::group(
    [
        'prefix' => $langUrl.$prefixCustomer,
        'middleware' => $midlware
    ],
    function ($router) use ($suffix) {
        $prefixCustomerOrderList    = sc_config('PREFIX_MEMBER_ORDER_LIST')??'order-list';
        $prefixCustomerOrderDetail  = sc_config('PREFIX_MEMBER_ORDER_DETAIL')??'order-detail';
        $prefixCustomerAddresList   = sc_config('PREFIX_MEMBER_ADDRESS_LIST')??'address-list';
        $prefixCustomerUpdateAddres = sc_config('PREFIX_MEMBER_UPDATE_ADDRESS')??'update-address';
        $prefixCustomerDeleteAddres = sc_config('PREFIX_MEMBER_DELETE_ADDRESS')??'delete-address';
        $prefixCustomerChangePwd    = sc_config('PREFIX_MEMBER_CHANGE_PWD')??'change-password';
        $prefixCustomerChangeInfo   = sc_config('PREFIX_MEMBER_CHANGE_INFO')??'change-infomation';


        $router->get('/', 'ShopAccountController@indexProcessFront')
            ->name('customer.index');
        $router->get('/'.$prefixCustomerOrderList.$suffix, 'ShopAccountController@orderListProcessFront')
            ->name('customer.order_list');
        $router->get('/'.$prefixCustomerOrderDetail.'/{id}', 'ShopAccountController@orderDetailProcessFront')
            ->name('customer.order_detail');
        $router->get('/'.$prefixCustomerAddresList.$suffix, 'ShopAccountController@addressListProcessFront')
            ->name('customer.address_list');
        $router->get('/'.$prefixCustomerUpdateAddres.'/{id}', 'ShopAccountController@updateAddressProcessFront')
            ->name('customer.update_address');
        $router->post('/'.$prefixCustomerUpdateAddres.'/{id}', 'ShopAccountController@postUpdateAddressFront')
            ->name('customer.post_update_address');
        $router->post('/'.$prefixCustomerDeleteAddres, 'ShopAccountController@deleteAddress')
            ->name('customer.delete_address');
        $router->get('/'.$prefixCustomerChangePwd.$suffix, 'ShopAccountController@changePasswordProcessFront')
            ->name('customer.change_password');
        $router->post('/change_password', 'ShopAccountController@postChangePassword')
            ->name('customer.post_change_password');
        $router->get('/'.$prefixCustomerChangeInfo.$suffix, 'ShopAccountController@changeInfomationProcessFront')
            ->name('customer.change_infomation');
        $router->post('/change_infomation', 'ShopAccountController@postChangeInfomation')
            ->name('customer.post_change_infomation');
        $router->get('/address_detail', 'ShopAccountController@getAddress')
            ->name('customer.address_detail');

        // The Email Verification Notice
        $router->get('/email/verify', 'ShopAccountController@verificationProcessFront')
            ->name('customer.verify');
        $router->post('/email/verify', 'ShopAccountController@resendVerification')
            ->name('customer.verify_resend');
    }
);

//Process url verify
Route::get($prefixCustomer.'/email/verify/{id}/{token}', 'ShopAccountController@verificationProcessData')
->middleware($midlware)
->name('customer.verify_process');