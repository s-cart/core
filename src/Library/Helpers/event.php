<?php 
use SCart\Core\Events\OrderSuccess;
use SCart\Core\Events\OrderCreated;
use SCart\Core\Events\CustomerCreated;
use SCart\Core\Events\OrderUpdateStatus;

if (!function_exists('sc_event_order_success')) {
    /**
     * Process order event
     *
     * @return  [type]          [return description]
     */
    function sc_event_order_success($order)
    {
        OrderSuccess::dispatch($order);
    }
}

if (!function_exists('sc_event_order_created')) {
    /**
     * Process order event
     *
     * @return  [type]          [return description]
     */
    function sc_event_order_created($order)
    {
        OrderCreated::dispatch($order);
    }
}

if (!function_exists('sc_event_customer_created')) {
    /**
     * Process customer event
     *
     * @return  [type]          [return description]
     */
    function sc_event_customer_created($customer)
    {
        CustomerCreated::dispatch($customer);
    }
}

if (!function_exists('sc_event_order_update_status')) {
    /**
     * Process customer event
     *
     * @return  [type]          [return description]
     */
    function sc_event_order_update_status($customer)
    {
        OrderUpdateStatus::dispatch($customer);
    }
}