<?php
use SCart\Core\Events\OrderSuccess;
use SCart\Core\Events\OrderCreated;
use SCart\Core\Events\CustomerCreated;
use SCart\Core\Events\OrderUpdateStatus;
use SCart\Core\Front\Models\ShopOrder;
use SCart\Core\Front\Models\ShopCustomer;

if (!function_exists('sc_event_order_success') && !in_array('sc_event_order_success', config('helper_except', []))) {
    /**
     * Process order event
     *
     * @return  [type]          [return description]
     */
    function sc_event_order_success(ShopOrder $order)
    {
        OrderSuccess::dispatch($order);
    }
}

if (!function_exists('sc_event_order_created') && !in_array('sc_event_order_created', config('helper_except', []))) {
    /**
     * Process order event
     *
     * @return  [type]          [return description]
     */
    function sc_event_order_created(ShopOrder $order)
    {
        OrderCreated::dispatch($order);
    }
}

if (!function_exists('sc_event_order_update_status') && !in_array('sc_event_order_update_status', config('helper_except', []))) {
    /**
     * Process event order update status
     *
     * @return  [type]          [return description]
     */
    function sc_event_order_update_status(ShopOrder $order)
    {
        OrderUpdateStatus::dispatch($order);
    }
}

if (!function_exists('sc_event_customer_created') && !in_array('sc_event_customer_created', config('helper_except', []))) {
    /**
     * Process customer event
     *
     * @return  [type]          [return description]
     */
    function sc_event_customer_created(ShopCustomer $customer)
    {
        CustomerCreated::dispatch($customer);
    }
}

