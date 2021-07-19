<?php

if (!function_exists('admin')) {
    /**
     * Helper admin
     *
     * @return void
     */
    function admin()
    {
        return auth()->guard('admin');
    }
}
