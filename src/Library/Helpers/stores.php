<?php
/**
 * Get list store
 */
if (!function_exists('sc_get_list_code_store')) {
    function sc_get_list_code_store() {
        return \SCart\Core\Admin\Models\AdminStore::getListStoreCode();
    }
}


/**
 * Get domain from code
 */
if (!function_exists('sc_get_domain_from_code') ) {
    function sc_get_domain_from_code($code) {
        $domainList = \SCart\Core\Front\Models\ShopStore::getStoreDomainByCode();
        if(!empty($domainList[$code])) {
            return 'http://'.$domainList[$code];
        } else {
            return url('/');
        }
    }
}