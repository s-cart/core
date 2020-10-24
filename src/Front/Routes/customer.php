<?php
$prefixMember = sc_config('PREFIX_MEMBER') ?? 'customer';

Route::group(['prefix' => $prefixMember, 'middleware' => 'auth'], function ($router) use($suffix){
    $prefixMemberOrderList = sc_config('PREFIX_MEMBER_ORDER_LIST')??'order-list';
    $prefixMemberOrderDetail = sc_config('PREFIX_MEMBER_ORDER_DETAIL')??'order-detail';
    $prefixMemberAddresList = sc_config('PREFIX_MEMBER_ADDRESS_LIST')??'address-list';
    $prefixMemberUpdateAddres = sc_config('PREFIX_MEMBER_UPDATE_ADDRESS')??'update-address';
    $prefixMemberDeleteAddres = sc_config('PREFIX_MEMBER_DELETE_ADDRESS')??'delete-address';
    $prefixMemberChangePwd = sc_config('PREFIX_MEMBER_CHANGE_PWD')??'change-password';
    $prefixMemberChangeInfo = sc_config('PREFIX_MEMBER_CHANGE_INFO')??'change-infomation';


    $router->get('/', 'ShopAccountController@index')->name('customer.index');
    $router->get('/'.$prefixMemberOrderList.$suffix, 'ShopAccountController@orderList')
        ->name('customer.order_list');
    $router->get('/'.$prefixMemberOrderDetail.'/{id}', 'ShopAccountController@orderDetail')
        ->name('customer.order_detail');
    $router->get('/'.$prefixMemberAddresList.$suffix, 'ShopAccountController@addressList')
        ->name('customer.address_list');
    $router->get('/'.$prefixMemberUpdateAddres.'/{id}', 'ShopAccountController@updateAddress')
        ->name('customer.update_address');
    $router->post('/'.$prefixMemberUpdateAddres.'/{id}', 'ShopAccountController@postUpdateAddress')
        ->name('customer.post_update_address');
    $router->post('/'.$prefixMemberDeleteAddres, 'ShopAccountController@deleteAddress')
        ->name('customer.delete_address');
    $router->get('/'.$prefixMemberChangePwd.$suffix, 'ShopAccountController@changePassword')
        ->name('customer.change_password');
    $router->post('/change_password', 'ShopAccountController@postChangePassword')
        ->name('customer.post_change_password');
    $router->get('/'.$prefixMemberChangeInfo.$suffix, 'ShopAccountController@changeInfomation')
        ->name('customer.change_infomation');
    $router->post('/change_infomation', 'ShopAccountController@postChangeInfomation')
        ->name('customer.post_change_infomation');
    $router->post('/address-detail', 'ShopAccountController@getAddress')
        ->name('customer.address_detail');   
});