<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopLink;
use SCart\Core\Front\Models\ShopLinkStore;

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
        $data = self::where('id', $id);
        if (sc_config_global('MultiVendorPro')) {
            if (session('adminStoreId') != SC_ID_ROOT) {
                $tableLinkStore = (new ShopLinkStore)->getTable();
                $tableLink = (new ShopLink)->getTable();
                $data = $data->leftJoin($tableLinkStore, $tableLinkStore . '.link_id', $tableLink . '.id');
                $data = $data->where($tableLinkStore . '.store_id', session('adminStoreId'));
            }
        }
        $data = $data->first();
        return $data;
    }

    /**
     * Get list link in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getLinkListAdmin() {
        $linkList = (new AdminLink);
        $tableLink = $linkList->getTable();
        if (sc_config_global('MultiVendorPro')) {
            if (session('adminStoreId') != SC_ID_ROOT) {
                $tableLinkStore = (new ShopLinkStore)->getTable();
                $linkList = $linkList->leftJoin($tableLinkStore, $tableLinkStore . '.link_id', $tableLink . '.id');
                $linkList = $linkList->where($tableLinkStore . '.store_id', session('adminStoreId'));
            }
        }
        $linkList = $linkList->orderBy($tableLink.'.id', 'desc');

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
