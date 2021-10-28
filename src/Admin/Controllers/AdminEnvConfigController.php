<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Admin\Models\AdminConfig;

class AdminEnvConfigController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function index()
    {
        $data = [
            'title'    => sc_language_render('admin.env.title'),
            'subTitle' => '',
            'icon'     => 'fa fa-indent',
        ];

        $dataCustomerConfig = [
            'code' => 'admin_dashboard',
            'storeId' => 0,
            'keyBy' => 'key',
        ];
        $configDashboard = AdminConfig::getListConfigByCode($dataCustomerConfig);

        $data['configDashboard'] = $configDashboard;
        $data['urlUpdateConfigGlobal'] = sc_route_admin('admin_config_global.update');
        return view($this->templatePathAdmin.'screen.env')
            ->with($data);
    }
}
