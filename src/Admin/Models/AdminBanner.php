<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopBanner;
use SCart\Core\Front\Models\ShopBannerStore;
class AdminBanner extends ShopBanner
{
    /**
     * Get banner detail in admin
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getBannerAdmin($id) {
        $data = self::where('id', $id);
        if (sc_config_global('MultiVendorPro')) {
            if (session('adminStoreId') != SC_ID_ROOT) {
                $tableBannerStore = (new ShopBannerStore)->getTable();
                $tableBanner = (new ShopBanner)->getTable();
                $data = $data->leftJoin($tableBannerStore, $tableBannerStore . '.banner_id', $tableBanner . '.id');
                $data = $data->where($tableBannerStore . '.store_id', session('adminStoreId'));
            }
        }
        $data = $data->first();
        return $data;
    }

    /**
     * Get list banner in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getBannerListAdmin(array $dataSearch) {
        $sort_order       = $dataSearch['sort_order'] ?? '';
        $arrSort          = $dataSearch['arrSort'] ?? '';
        $keyword          = $dataSearch['keyword'] ?? '';
        $bannerList = (new ShopBanner);
        $tableBanner = $bannerList->getTable();
        if (sc_config_global('MultiVendorPro')) {
            if (session('adminStoreId') != SC_ID_ROOT) {
                $tableBannerStore = (new ShopBannerStore)->getTable();
                $bannerList = $bannerList->leftJoin($tableBannerStore, $tableBannerStore . '.banner_id', $tableBanner . '.id');
                $bannerList = $bannerList->where($tableBannerStore . '.store_id', session('adminStoreId'));
            }
        }
        if ($keyword) {
            $bannerList->where($tableBanner.'.title', 'like', '%'.$keyword.'%');
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $bannerList = $bannerList->sort($field, $sort_field);
        } else {
            $bannerList = $bannerList->sort($tableBanner.'.id', 'desc');
        }
        $bannerList = $bannerList->paginate(20);

        return $bannerList;
    }

    /**
     * Create a new banner
     *
     * @param   array  $dataInsert  [$dataInsert description]
     *
     * @return  [type]              [return description]
     */
    public static function createBannerAdmin(array $dataInsert) {

        return self::create($dataInsert);
    }

}
