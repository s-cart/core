<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopPage;
use Cache;
use SCart\Core\Front\Models\ShopPageDescription;

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
        return self::where('id', $id)
        ->where('store_id', session('adminStoreId'))
        ->first();
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
            ->where('store_id', session('adminStoreId'))
            ->where($tableDescription . '.lang', sc_get_locale());

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
            $pageList = $pageList->orderBy('id', 'desc');
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
                    self::$getListTitleAdmin = self::join($tableDescription, $tableDescription.'.page_id', $table.'.id')
                    ->where('lang', sc_get_locale())
                    ->where('store_id', session('adminStoreId'))
                    ->pluck('title', 'id')
                    ->toArray();
                }
                sc_set_cache(session('adminStoreId').'_cache_page_'.sc_get_locale(), self::$getListTitleAdmin);
            }
            return Cache::get(session('adminStoreId').'_cache_page_'.sc_get_locale());
        } else {
            if (self::$getListTitleAdmin === null) {
                self::$getListTitleAdmin = self::join($tableDescription, $tableDescription.'.page_id', $table.'.id')
                ->where('lang', sc_get_locale())
                ->where('store_id', session('adminStoreId'))
                ->pluck('title', 'id')
                ->toArray();
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
