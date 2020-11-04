<?php 
use SCart\Core\Admin\Models\AdminConfig;
use SCart\Core\Admin\Models\AdminStore;

if (!function_exists('sc_admin_can_config')) {
    /**
     * Get value config from table sc_admin_can_config
     *
     * @return  [type]          [return description]
     */
    function sc_admin_can_config()
    {
        return \SCart\Core\Admin\Admin::user()->checkPermissionconfig();
    }
}

if (!function_exists('sc_config')) {
    /**
     * Get value config from table sc_config
     *
     * @param   [string|array] $key      [$key description]
     * @param   [null|int]  $store    Store id.
     *
     * @return  [type]          [return description]
     */
    function sc_config($key = null, $storeId = null)
    {
        $storeId = ($storeId === null) ? config('app.storeId') : $storeId;
        //Update config
        if (is_array($key)) {
            if (count($key) == 1) {
                foreach ($key as $k => $v) {
                    return AdminConfig::where('store_id', $storeId)->where('key', $k)->update(['value' => $v]);
                }
            } else {
                return false;
            }
        }
        //End update

        $allConfig = AdminConfig::getAllConfigOfStore($storeId);

        if ($key === null) {
            return $allConfig;
        }
        return $allConfig[$key] ?? (sc_config_global()[$key] ?? null);
    }
}


if (!function_exists('sc_config_admin')) {
/**
 * Get config value in adin with session store id
 *
 * @param   [type]$key  [$key description]
 * @param   null        [ description]
 *
 * @return  [type]      [return description]
 */
    function sc_config_admin($key = null)
    {
        return sc_config($key, session('adminStoreId'));
    }
}


if (!function_exists('sc_config_global')) {
    /**
     * Get value config from table sc_config for store_id 0
     *
     * @param   [string|array] $key      [$key description]
     * @param   [null|int]  $store    Store id.
     *
     * @return  [type]          [return description]
     */
    function sc_config_global($key = null)
    {
        //Update config
        if (is_array($key)) {
            if (count($key) == 1) {
                foreach ($key as $k => $v) {
                    return AdminConfig::where('store_id', 0)->where('key', $k)->update(['value' => $v]);
                }
            } else {
                return false;
            }
        }
        //End update
        
        $allConfig = [];
        try {
            $allConfig = AdminConfig::getAllGlobal();
        } catch(\Throwable $e) {
            //
        }
        if ($key === null) {
            return $allConfig;
        }
        if (!array_key_exists($key, $allConfig)) {
            return null;
        } else {
            return trim($allConfig[$key]);
        }
    }
}

if (!function_exists('sc_config_group')) {
    /*
    Group Config info
     */
    function sc_config_group($group = null, $suffix = null)
    {
        $groupData = AdminConfig::getGroup($group, $suffix);
        return $groupData;
    }
}


if (!function_exists('sc_store')) {
    /**
     * Get info store
     *
     * @param   [string] $key      [$key description]
     * @param   [null|int]  $store    store id
     *
     * @return  [mix] 
     */
    function sc_store($key = null, $store = null)
    {
        $store = ($store == null) ? config('app.storeId') : $store;

        //Update store info
        if (is_array($key)) {
            if (count($key) == 1) {
                foreach ($key as $k => $v) {
                    return AdminStore::where('id', $store)->update([$k => $v]);
                }
            } else {
                return false;
            }
        }
        //End update

        $allStoreInfo = [];
        try {
            $allStoreInfo = AdminStore::getListAll()[$store]->toArray() ?? [];
        } catch(\Throwable $e) {
            //
        }

        $lang = app()->getLocale();
        $descriptions = $allStoreInfo['descriptions'] ?? [];
        foreach ($descriptions as $row) {
            if ($lang == $row['lang']) {
                $allStoreInfo += $row;
            }
        }
        if ($key == null) {
            return $allStoreInfo;
        }
        return $allStoreInfo[$key] ?? null;
    }
}

if (!function_exists('sc_store_active')) {
    function sc_store_active($field = null) {
        switch ($field) {
            case 'code':
                return AdminStore::getCodeActive();
                break;

            case 'domain':
                return AdminStore::getStoreActive();
                break;

            default:
                return AdminStore::getListAllActive();
                break;
        }
    }
}