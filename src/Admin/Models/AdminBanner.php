<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopBanner;

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
        return self::where('id', $id)
        ->where('store_id', session('adminStoreId'))
        ->first();
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
        $bannerList = (new AdminBanner)
            ->where('store_id', session('adminStoreId'));
        if ($keyword) {
            $bannerList->where('title', 'like', '%'.$keyword.'%');
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $bannerList = $bannerList->sort($field, $sort_field);
        } else {
            $bannerList = $bannerList->sort('id', 'desc');
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
