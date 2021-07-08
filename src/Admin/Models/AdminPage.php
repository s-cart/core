<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopPage;
use Cache;
use SCart\Core\Front\Models\ShopPageDescription;
use SCart\Core\Front\Models\ShopPageStore;

class AdminPage extends ShopPage
{
    protected static $getListTitleAdmin = null;
    protected static $getListPageGroupByParentAdmin = null;
    /**
     * Get page detail in admin
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getPageAdmin($id) {
        $data = self::where('id', $id);
        if (sc_config_global('MultiVendorPro')) {
            if (session('adminStoreId') != SC_ID_ROOT) {
                $tablePageStore = (new ShopPageStore)->getTable();
                $tablePage = (new ShopPage)->getTable();
                $data = $data->leftJoin($tablePageStore, $tablePageStore . '.page_id', $tablePage . '.id');
                $data = $data->where($tablePageStore . '.store_id', session('adminStoreId'));
            }
        }
        $data = $data->first();
        return $data;
    }

    /**
     * Get list page in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getPageListAdmin(array $dataSearch) {
        $keyword          = $dataSearch['keyword'] ?? '';
        $sort_order       = $dataSearch['sort_order'] ?? '';
        $arrSort          = $dataSearch['arrSort'] ?? '';
        $tableDescription = (new ShopPageDescription)->getTable();
        $tablePage     = (new AdminPage)->getTable();

        $pageList = (new ShopPage)
            ->leftJoin($tableDescription, $tableDescription . '.page_id', $tablePage . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());

        $tablePage = (new ShopPage)->getTable();
        if (sc_config_global('MultiVendorPro')) {
            if (session('adminStoreId') != SC_ID_ROOT) {
                $tablePageStore = (new ShopPageStore)->getTable();
                $pageList = $pageList->leftJoin($tablePageStore, $tablePageStore . '.page_id', $tablePage . '.id');
                $pageList = $pageList->where($tablePageStore . '.store_id', session('adminStoreId'));
            }
        }

        if ($keyword) {
            $pageList = $pageList->where(function ($sql) use($tableDescription, $keyword){
                $sql->where($tableDescription . '.title', 'like', '%' . $keyword . '%');
            });
        }

        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $pageList = $pageList->orderBy($field, $sort_field);
        } else {
            $pageList = $pageList->orderBy($tablePage.'.id', 'desc');
        }
        $pageList = $pageList->paginate(20);

        return $pageList;
    }


    /**
     * Get array title page
     * user for admin 
     *
     * @return  [type]  [return description]
     */
    public static function getListTitleAdmin()
    {
        $tableDescription = (new ShopPageDescription)->getTable();
        $table = (new AdminPage)->getTable();
        if (sc_config_global('cache_status') && sc_config_global('cache_page')) {
            if (!Cache::has(session('adminStoreId').'_cache_page_'.sc_get_locale())) {
                if (self::$getListTitleAdmin === null) {
                    $data = self::join($tableDescription, $tableDescription.'.page_id', $table.'.id')
                    ->where('lang', sc_get_locale());
                    if (sc_config_global('MultiVendorPro')) {
                        if (session('adminStoreId') != SC_ID_ROOT) {
                            $tablePageStore = (new ShopPageStore)->getTable();
                            $data = $data->leftJoin($tablePageStore, $tablePageStore . '.page_id', $table . '.id');
                            $data = $data->where($tablePageStore . '.store_id', session('adminStoreId'));
                        }
                    }
                    $data = $data->pluck('title', 'id')->toArray();
                    self::$getListTitleAdmin = $data;
                }
                sc_set_cache(session('adminStoreId').'_cache_page_'.sc_get_locale(), self::$getListTitleAdmin);
            }
            return Cache::get(session('adminStoreId').'_cache_page_'.sc_get_locale());
        } else {
            if (self::$getListTitleAdmin === null) {
                $data = self::join($tableDescription, $tableDescription.'.page_id', $table.'.id')
                ->where('lang', sc_get_locale());
                if (sc_config_global('MultiVendorPro')) {
                    if (session('adminStoreId') != SC_ID_ROOT) {
                        $tablePageStore = (new ShopPageStore)->getTable();
                        $data = $data->leftJoin($tablePageStore, $tablePageStore . '.page_id', $table . '.id');
                        $data = $data->where($tablePageStore . '.store_id', session('adminStoreId'));
                    }
                }
                $data = $data->pluck('title', 'id')->toArray();
                self::$getListTitleAdmin = $data;
            }
            return self::$getListTitleAdmin;
        }
    }


    /**
     * Create a new page
     *
     * @param   array  $dataInsert  [$dataInsert description]
     *
     * @return  [type]              [return description]
     */
    public static function createPageAdmin(array $dataInsert) {

        return self::create($dataInsert);
    }


    /**
     * Insert data description
     *
     * @param   array  $dataInsert  [$dataInsert description]
     *
     * @return  [type]              [return description]
     */
    public static function insertDescriptionAdmin(array $dataInsert) {

        return ShopPageDescription::create($dataInsert);
    }
}
