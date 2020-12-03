<?php

namespace SCart\Core\Handlers;

class LfmConfigHandler extends \UniSharp\LaravelFilemanager\Handlers\ConfigHandler
{
    public function userField()
    {
        // If domain is root, dont split folder
        if (session('adminStoreId') == SC_ID_ROOT) {
            return ;
        }

        if (sc_config_global('MultiStorePro')) {
            return session('adminStoreId');
        } else {
            return;
        }
    }
}
