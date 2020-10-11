<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Admin\Models\AdminConfig;
class AdminConfigController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    public function webhook()
    {
        $data = [
            'title' => trans('config.admin.webhook'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',  
        ];
        return view($this->templatePathAdmin.'screen.webhook')
            ->with($data);
    }

    /*
    Update value config
    */
    public function updateInfo()
    {
        $data = request()->all();
        $name = $data['name'];
        $value = $data['value'];
        $storeId = $data['storeId'] ?? 0;
        try {
            AdminConfig::where('key', $name)
                ->where('store_id', $storeId)
                ->update(['value' => $value]);
            $error = 0;
            $msg = trans('admin.update_success');
        } catch (\Throwable $e) {
            $error = 1;
            $msg = $e->getMessage();
        }
        return response()->json([
            'error' => $error,
                'field' => $name,
                'value' => $value,
                'msg' => $msg,
            ]
        );

    }

    /*
    Delete list item
    Need mothod destroy to boot deleting in model
    */
    public function deleteList()
    {
        if (!request()->ajax()) {
            $error = 1;
            $msg = trans('admin.method_not_allow');
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            try {
                AdminConfig::destroy($arrID);
                $error = 0;
                $msg = '';
            } catch (\Throwable $e) {
                $error = 1;
                $msg = $e->getMessage();
            }
            return response()->json(['error' => $error, 'msg' => $msg]);
        }
    }

}
