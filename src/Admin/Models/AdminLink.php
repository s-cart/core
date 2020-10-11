<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopLink;

class AdminLink extends ShopLink
{
    /**
     * Get link detail in admin
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public static function getLinkAdmin($id) {
        return self::where('id', $id)
        ->where('store_id', session('adminStoreId'))
        ->first();
    }

    /**
     * Get list link in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getLinkListAdmin() {
        $linkList = (new AdminLink)
            ->where('store_id', session('adminStoreId'))
            ->orderBy('id', 'desc');
        $linkList = $linkList->paginate(20);

        return $linkList;
    }

    /**
     * Create a new link
     *
     * @param   array  $dataInsert  [$dataInsert description]
     *
     * @return  [type]              [return description]
     */
    public static function createLinkAdmin(array $dataInsert) {
        $dataInsert = sc_clean($dataInsert);
        return self::create($dataInsert);
    }

}
