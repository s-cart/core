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
    public static function getLinkAdmin($id, $storeId = null)
    {
        $data = self::where('id', $id);
        if ($storeId) {
            $tableLinkStore = (new ShopLinkStore)->getTable();
            $tableLink = (new ShopLink)->getTable();
            $data = $data->leftJoin($tableLinkStore, $tableLinkStore . '.link_id', $tableLink . '.id');
            $data = $data->where($tableLinkStore . '.store_id', $storeId);
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
    public static function getLinkListAdmin($storeId = null)
    {
        $linkList = (new AdminLink);
        $tableLink = $linkList->getTable();
        if ($storeId) {
            $tableLinkStore = (new ShopLinkStore)->getTable();
            $linkList = $linkList->leftJoin($tableLinkStore, $tableLinkStore . '.link_id', $tableLink . '.id');
            $linkList = $linkList->where($tableLinkStore . '.store_id', $storeId);
        }
        $linkList = $linkList->orderBy($tableLink.'.created_at', 'desc');

        $linkList = $linkList->paginate(20);

        return $linkList;
    }

    /**
     * Create a new link
     *
     * @param   array  $dataCreate  [$dataCreate description]
     *
     * @return  [type]              [return description]
     */
    public static function createLinkAdmin(array $dataCreate)
    {
        $dataCreate = sc_clean($dataCreate);
        return self::create($dataCreate);
    }
}
