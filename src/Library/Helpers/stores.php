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
        $domainList = \SCart\Core\Admin\Models\AdminStore::getStoreDomainByCode();
        if(!empty($domainList[$code])) {
            return 'http://'.$domainList[$code];
        } else {
            return url('/');
        }
    }
}

/**
 * Get domain root
 */
if (!function_exists('sc_get_domain_root') ) {
    function sc_get_domain_root() {
        $store = \SCart\Core\Admin\Models\AdminStore::find(SC_ID_ROOT);
        return $store->domain;
    }
}

/**
 * Check store is partner
 */
if (!function_exists('sc_store_is_partner')) {
    function sc_store_is_partner(int $storeId) {
        $store = \SCart\Core\Admin\Models\AdminStore::find($storeId);
        if (!$store) {
            return null;
        }
        return $store->partner || $storeId == SC_ID_ROOT;
    }
}

/**
 * Check store is root
 */
if (!function_exists('sc_store_is_root')) {
    function sc_store_is_root(int $storeId) {
        return  $storeId == SC_ID_ROOT;
    }
}


//======== store info============

/**
 * Get list store of product detail
 */
if (!function_exists('sc_get_list_store_of_product_detail') ) {
    function sc_get_list_store_of_product_detail($pId) {
        return \SCart\Core\Front\Models\ShopProductStore::where('product_id', $pId)
        ->pluck('store_id')
        ->toArray();
    }
}


/**
 * Get list store of discount detail
 */
if (!function_exists('sc_get_list_store_of_discount_detail') ) {
    function sc_get_list_store_of_discount_detail($dId) {
        return \App\Plugins\Total\Discount\Models\ShopDiscountStore::where('discount_id', $dId)
            ->pluck('store_id')
            ->toArray();
    }
}


/**
 * Get store list of brand
 */
if (!function_exists('sc_get_list_store_of_brand') ) {
    function sc_get_list_store_of_brand($arrBrandId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tableBrandStore = (new \SCart\Core\Front\Models\ShopBrandStore)->getTable();
        return \SCart\Core\Front\Models\ShopBrandStore::select($tableStore.'.code', $tableStore.'.id', 'brand_id')
            ->leftJoin($tableStore, $tableStore.'.id', $tableBrandStore.'.store_id')
            ->whereIn('brand_id', $arrBrandId)
            ->get()
            ->groupBy('brand_id');
        }
}


/**
 * Get list store of brand detail
 */
if (!function_exists('sc_get_list_store_of_brand_detail') ) {
    function sc_get_list_store_of_brand_detail($cId) {
        return \SCart\Core\Front\Models\ShopBrandStore::where('brand_id', $cId)
            ->pluck('store_id')
            ->toArray();
    }
}

/**
 * Get store list of banner
 */
if (!function_exists('sc_get_list_store_of_banner') ) {
    function sc_get_list_store_of_banner($arrBannerId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tableBannerStore = (new \SCart\Core\Front\Models\ShopBannerStore)->getTable();
        return \SCart\Core\Front\Models\ShopBannerStore::select($tableStore.'.code', $tableStore.'.id', 'banner_id')
            ->leftJoin($tableStore, $tableStore.'.id', $tableBannerStore.'.store_id')
            ->whereIn('banner_id', $arrBannerId)
            ->get()
            ->groupBy('banner_id');
        }
}

/**
 * Get list store of banner detail
 */
if (!function_exists('sc_get_list_store_of_banner_detail') ) {
    function sc_get_list_store_of_banner_detail($cId) {
        return \SCart\Core\Front\Models\ShopBannerStore::where('banner_id', $cId)
            ->pluck('store_id')
            ->toArray();
    }
}

/**
 * Get store list of news
 */
if (!function_exists('sc_get_list_store_of_news') ) {
    function sc_get_list_store_of_news($arrNewsId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tableNewsStore = (new \SCart\Core\Front\Models\ShopNewsStore)->getTable();
        return \SCart\Core\Front\Models\ShopNewsStore::select($tableStore.'.code', $tableStore.'.id', 'news_id')
            ->leftJoin($tableStore, $tableStore.'.id', $tableNewsStore.'.store_id')
            ->whereIn('news_id', $arrNewsId)
            ->get()
            ->groupBy('news_id');
        }
}

/**
 * Get list store of news detail
 */
if (!function_exists('sc_get_list_store_of_news_detail') ) {
    function sc_get_list_store_of_news_detail($cId) {
        return \SCart\Core\Front\Models\ShopNewsStore::where('news_id', $cId)
            ->pluck('store_id')
            ->toArray();
    }
}

/**
 * Get store list of page
 */
if (!function_exists('sc_get_list_store_of_page') ) {
    function sc_get_list_store_of_page($arrPageId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tablePageStore = (new \SCart\Core\Front\Models\ShopPageStore)->getTable();
        return \SCart\Core\Front\Models\ShopPageStore::select($tableStore.'.code', $tableStore.'.id', 'page_id')
            ->leftJoin($tableStore, $tableStore.'.id', $tablePageStore.'.store_id')
            ->whereIn('page_id', $arrPageId)
            ->get()
            ->groupBy('page_id');
        }
}

/**
 * Get list store of page detail
 */
if (!function_exists('sc_get_list_store_of_page_detail') ) {
    function sc_get_list_store_of_page_detail($cId) {
        return \SCart\Core\Front\Models\ShopPageStore::where('page_id', $cId)
            ->pluck('store_id')
            ->toArray();
    }
}

/**
 * Get store list of link
 */
if (!function_exists('sc_get_list_store_of_link') ) {
    function sc_get_list_store_of_link($arrLinkId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tableLinkStore = (new \SCart\Core\Front\Models\ShopLinkStore)->getTable();
        return \SCart\Core\Front\Models\ShopLinkStore::select($tableStore.'.code', $tableStore.'.id', 'link_id')
            ->leftJoin($tableStore, $tableStore.'.id', $tableLinkStore.'.store_id')
            ->whereIn('link_id', $arrLinkId)
            ->get()
            ->groupBy('link_id');
        }
}

/**
 * Get list store of link detail
 */
if (!function_exists('sc_get_list_store_of_link_detail') ) {
    function sc_get_list_store_of_link_detail($cId) {
        return \SCart\Core\Front\Models\ShopLinkStore::where('link_id', $cId)
            ->pluck('store_id')
            ->toArray();
    }
}

/**
 * Get store list of order
 */
if (!function_exists('sc_get_list_store_of_order') ) {
    function sc_get_list_store_of_order($arrOrderId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tableOrder = (new \SCart\Core\Front\Models\ShopOrder)->getTable();
        return \SCart\Core\Front\Models\ShopOrder::select($tableStore.'.code', $tableOrder.'.id')
            ->leftJoin($tableStore, $tableStore.'.id', $tableOrder.'.store_id')
            ->whereIn($tableOrder.'.id', $arrOrderId)
            ->get()
            ->groupBy('id');
    }
}

/**
 * Get store list of category
 */
if (!function_exists('sc_get_list_store_of_category') ) {
    function sc_get_list_store_of_category($arrCategoryId) {
        $tableStore = (new \SCart\Core\Admin\Models\AdminStore)->getTable();
        $tableCategoryStore = (new \SCart\Core\Front\Models\ShopCategoryStore)->getTable();
        return \SCart\Core\Front\Models\ShopCategoryStore::select($tableStore.'.code', $tableStore.'.id', 'category_id')
            ->leftJoin($tableStore, $tableStore.'.id', $tableCategoryStore.'.store_id')
            ->whereIn('category_id', $arrCategoryId)
            ->get()
            ->groupBy('category_id');
        }
}


/**
 * Get list store of category detail
 */
if (!function_exists('sc_get_list_store_of_category_detail') ) {
    function sc_get_list_store_of_category_detail($cId) {
        return \SCart\Core\Front\Models\ShopCategoryStore::where('category_id', $cId)
            ->pluck('store_id')
            ->toArray();
    }
}