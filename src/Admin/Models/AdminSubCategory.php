<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopSubCategory;
use Cache;
use SCart\Core\Front\Models\ShopSubCategoryDescription;

class AdminSubCategory extends ShopSubCategory
{
    protected static $getListTitleAdmin = null;
    protected static $getListSubCategoryGroupByParentAdmin = null;
    /**
     * Get category detail in admin
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getSubCategoryAdmin($id) {
        return self::where('id', $id)
        ->first();
    }

    /**
     * Get list category in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getSubCategoryListAdmin(array $dataSearch) {
        $keyword          = $dataSearch['keyword'] ?? '';
        $sort_order       = $dataSearch['sort_order'] ?? '';
        $arrSort          = $dataSearch['arrSort'] ?? '';
        $tableDescription = (new ShopSubCategoryDescription)->getTable();
        $tableSubCategory     = (new ShopSubCategory)->getTable();

        $categoryList = (new ShopSubCategory)
            ->leftJoin($tableDescription, $tableDescription . '.sub_category_id', $tableSubCategory . '.id')
            ->where($tableSubCategory.'.store_id', session('adminStoreId'))
            ->where($tableDescription . '.lang', sc_get_locale());

        if ($keyword) {
            $categoryList = $categoryList->where(function ($sql) use($tableDescription, $keyword){
                $sql->where($tableDescription . '.title', 'like', '%' . $keyword . '%')
                    ->orWhere($tableDescription . '.keyword', 'like', '%' . $keyword . '%')
                    ->orWhere($tableDescription . '.description', 'like', '%' . $keyword . '%');
            });
        }

        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $categoryList = $categoryList->sort($field, $sort_field);
        } else {
            $categoryList = $categoryList->sort('id', 'desc');
        }
        $categoryList = $categoryList->paginate(20);

        return $categoryList;
    }


    /**
     * Get array title category
     * user for admin 
     *
     * @return  [type]  [return description]
     */
    public static function getListTitleAdmin()
    {
        $tableDescription = (new ShopSubCategoryDescription)->getTable();
        $table = (new AdminSubCategory)->getTable();
        if (sc_config_global('cache_status') && sc_config_global('cache_category')) {
            if (!Cache::has(session('adminStoreId').'_cache_sub_category_'.sc_get_locale())) {
                if (self::$getListTitleAdmin === null) {
                    self::$getListTitleAdmin = self::join($tableDescription, $tableDescription.'.sub_category_id', $table.'.id')
                    ->where($table.'.store_id', session('adminStoreId'))
                    ->where('lang', sc_get_locale())
                    ->pluck('title', 'id')
                    ->toArray();
                }
                sc_set_cache(session('adminStoreId').'_cache_sub_category_'.sc_get_locale(), self::$getListTitleAdmin);
            }
            return Cache::get(session('adminStoreId').'_cache_sub_category_'.sc_get_locale());
        } else {
            if (self::$getListTitleAdmin === null) {
                self::$getListTitleAdmin = self::join($tableDescription, $tableDescription.'.sub_category_id', $table.'.id')
                ->where('lang', sc_get_locale())
                ->where($table.'.store_id', session('adminStoreId'))
                ->pluck('title', 'id')
                ->toArray();
            }
            return self::$getListTitleAdmin;
        }
    }


    /**
     * Create a new category
     *
     * @param   array  $dataInsert  [$dataInsert description]
     *
     * @return  [type]              [return description]
     */
    public static function createSubCategoryAdmin(array $dataInsert) {
        $dataInsert = sc_clean($dataInsert);
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
        $dataInsert = sc_clean($dataInsert);
        return ShopSubCategoryDescription::create($dataInsert);
    }

}
