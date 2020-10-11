<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopCustomer;
use SCart\Core\Front\Models\ShopCustomerAddress;

class AdminCustomer extends ShopCustomer
{
    protected static $getListTitleAdmin = null;
    protected static $getListCustomerGroupByParentAdmin = null;
    private static $getList = null;
    /**
     * Get page detail in admin
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getCustomerAdmin($id) {
        return self::with('addresses')
        ->where('id', $id)
        ->where('store_id', session('adminStoreId'))
        ->first();
    }

    /**
     * Get page detail in admin json
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getCustomerAdminJson($id) {
        return self::getCustomerAdmin($id)
        ->toJson();
    }

    /**
     * Get list page in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getCustomerListAdmin(array $dataSearch) {
        $keyword          = $dataSearch['keyword'] ?? '';
        $sort_order       = $dataSearch['sort_order'] ?? '';
        $arrSort          = $dataSearch['arrSort'] ?? '';

        $pageList = (new ShopCustomer)
            ->where('store_id', session('adminStoreId'));

        if ($keyword) {
            $pageList->where('email', 'like', '%' . $keyword . '%')
            ->orWhere('last_name', 'like', '%' . $keyword . '%')
            ->orWhere('first_name', 'like', '%' . $keyword . '%');
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
     * Find address id
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getAddress($id) {
        return ShopCustomerAddress::find($id);
    }

    /**
     * Delete address id
     *
     * @return  [type]  [return description]
     */
    public static function deleteAddress($id) {
        return ShopCustomerAddress::where('id', $id)->delete();
    }

    /**
     * Get total customer of store
     *
     * @return  [type]  [return description]
     */
    public static function getTotalCustomerStore() {
        return self::where('store_id', session('adminStoreId'))->count();
    }


    /**
     * Get total customer of store
     *
     * @return  [type]  [return description]
     */
    public static function getTopCustomerStore() {
        return self::where('store_id', session('adminStoreId'))
            ->orderBy('id', 'desc')
            ->limit(10)
            ->get();
    }

    /**
     * [getListAll description]
     * Performance can be affected if the data is too large
     * @return  [type]  [return description]
     */
    public static function getListAll()
    {
        if (self::$getList === null) {
            self::$getList = self::where('store_id', session('adminStoreId'))
                ->get()->keyBy('id');
        }
        return self::$getList;
    }

}
