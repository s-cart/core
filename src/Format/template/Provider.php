<?php

/**
 * Install template
 *
 * @param [type] $storeId
 * @return void
 */
function sc_template_install($data = []) {
    $storeId = $data['store_id'] ?? null;
    sc_template_install_default();
    sc_template_install_store($storeId);
}

/**
 * Uninstall template
 *
 * @param [type] $storeId
 * @return void
 */
function sc_template_uninstall($data = []) {
    $storeId = $data['store_id'] ?? null;
    sc_template_uninstall_default();
    sc_template_uninstall_store($storeId);
}


/**
 * Insert css default for template
 *
 * @param   [type]  $storeId  [$storeId description]
 *
 * @return  [type]            [return description]
 */
function sc_process_css_default($storeId = null) {
        if ($storeId) {
        $cssContent = '';
        if (file_exists($path = resource_path() . '/views/templates/your-template-name/css_default.css')) {
            $cssContent = file_get_contents($path);
        }
        \SCart\Core\Front\Models\ShopStoreCss::insert(['css' => $cssContent, 'store_id' => $storeId, 'template' => 'your-template-name']);
    }
}

//Setup for every store
function sc_template_install_store($storeId = null) {
    $storeId = $storeId ? $storeId : session('adminStoreId');
    $dataInsert[] = [
        'id'       => sc_uuid(),
        'name'     => 'Banner top (your-template-name)',
        'position' => 'banner_top',
        'page'     => 'home',
        'text'     => 'banner_image',
        'type'     => 'view',
        'sort'     => 10,
        'status'   => 1,
        'template' => 'your-template-name',
        'store_id' => $storeId,
    ];
    \SCart\Core\Admin\Models\AdminStoreBlockContent::insert($dataInsert);

    $modelBanner = new \SCart\Core\Front\Models\ShopBanner;
    $modelBannerStore = new \SCart\Core\Front\Models\ShopBannerStore; 

    $idBanner = $modelBanner->create(['title' => 'Banner store (your-template-name)', 'image' => '/data/banner/banner-store.jpg', 'target' => '_self', 'html' => '', 'status' => 1, 'type' => 'banner-store']);
    $modelBannerStore->create(['banner_id' => $idBanner->id, 'store_id' => $storeId]);

    //Insert css default
    sc_process_css_default($storeId);
}

/**
 * Setup default
 *
 * @return void
 */
function sc_template_install_default() {}

/**
 * Remove default
 *
 * @return void
 */
function sc_template_uninstall_default() {}


/**
 * Remove setup for every store
 *
 * @param [type] $storeId
 * @return void
 */
function sc_template_uninstall_store($storeId = null) {
        if ($storeId) {
        \SCart\Core\Admin\Models\AdminStoreBlockContent::where('template', 'your-template-name')
            ->where('store_id', $storeId)
            ->delete();
        $tableBanner = (new \SCart\Core\Front\Models\ShopBanner)->getTable();
        $tableBannerStore = (new \SCart\Core\Front\Models\ShopBannerStore)->getTable();
        $idBanners = (new \SCart\Core\Front\Models\ShopBanner)
            ->join($tableBannerStore, $tableBannerStore.'.banner_id', $tableBanner.'.id')
            ->where($tableBanner.'.title', 'like', '%(your-template-name)%')
            ->where($tableBannerStore.'.store_id', $storeId)
            ->pluck('id');

        if ($idBanners) {
            \SCart\Core\Front\Models\ShopBannerStore::whereIn('banner_id', $idBanners)
            ->delete();
            \SCart\Core\Front\Models\ShopBanner::whereIn('id', $idBanners)
            ->delete();
        }
        \SCart\Core\Front\Models\ShopStoreCss::where('template', 'your-template-name')
        ->where('store_id', $storeId)
        ->delete();
    } else {
        // Remove from all stories
        \SCart\Core\Admin\Models\AdminStoreBlockContent::where('template', 'your-template-name')
            ->delete();
        $idBanners = \SCart\Core\Front\Models\ShopBanner::where('title', 'like', '%(your-template-name)%')
            ->pluck('id');
        if ($idBanners) {
            \SCart\Core\Front\Models\ShopBannerStore::whereIn('banner_id', $idBanners)
            ->delete();
            \SCart\Core\Front\Models\ShopBanner::whereIn('id', $idBanners)
            ->delete();
        }
        \SCart\Core\Front\Models\ShopStoreCss::where('template', 'your-template-name')
        ->delete();
    }
}