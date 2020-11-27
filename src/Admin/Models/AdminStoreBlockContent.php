<?php

namespace SCart\Core\Admin\Models;

use SCart\Core\Front\Models\ShopStoreBlockContent;

class AdminStoreBlockContent extends ShopStoreBlockContent
{
    /**
     * Get blockContent detail in admin
     *
     * @param   [type]  $id  [$id description]
     *
     * @return  [type]       [return description]
     */
    public function getStoreBlockContentAdmin($id) {
        return $this->where('id', $id)
        ->where('store_id', session('adminStoreId'))
        ->first();
    }

    /**
     * Get list blockContent in admin
     *
     * @param   [array]  $dataSearch  [$dataSearch description]
     *
     * @return  [type]               [return description]
     */
    public static function getStoreBlockContentListAdmin() {
        $blockContentList = self::where('store_id', session('adminStoreId'))
            ->orderBy('id', 'desc');
        $blockContentList = $blockContentList->paginate(20);

        return $blockContentList;
    }

    /**
     * Create a new blockContent
     *
     * @param   array  $dataInsert  [$dataInsert description]
     *
     * @return  [type]              [return description]
     */
    public static function createStoreBlockContentAdmin(array $dataInsert) {

        return self::create($dataInsert);
    }

}
