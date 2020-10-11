<?php

namespace SCart\Core\Handlers;

class LfmConfigHandler extends \UniSharp\LaravelFilemanager\Handlers\ConfigHandler
{
    public function userField()
    {
        if(sc_config_global('MultiStorePro') && !in_array(0, \Admin::user()->listStoreId())) {
            return session('adminStoreId');
        } else {
            return;
        }
    }
}
