<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Admin\Models\AdminStore;
use SCart\Core\Front\Models\ShopLanguage;
use SCart\Core\Front\Models\ShopCurrency;

class AdminStoreInfoController extends RootAdminController
{
    public $templates, $currencies, $languages, $timezones;

    public function __construct()
    {
        parent::__construct();
        $allTemplate = sc_get_all_template();
        $templates = [];
        foreach ($allTemplate as $key => $template) {
            $templates[$key] = empty($template['config']['name']) ? $key : $template['config']['name'];
        }
        foreach (timezone_identifiers_list() as $key => $value) {
            $timezones[$value] = $value;
        }
        $this->templates = $templates;
        $this->currencies = ShopCurrency::getCodeActive();
        $this->languages = ShopLanguage::getListActive();
        $this->timezones = $timezones;

    }

    /*
    Update value config
    */
    public function updateInfo()
    {
        $data      = request()->all();
        $storeId   = $data['storeId'];
        $fieldName = $data['name'];
        $value     = $data['value'];
        $parseName = explode('__', $fieldName);
        $name      = $parseName[0];
        $lang      = $parseName[1] ?? '';
        $msg       = '';
        // Check store
        $store     = AdminStore::find($storeId);
        if (!$store) {
            return response()->json(['error' => 1, 'msg' => 'Store not found!']);
        }

        if (!$lang) {
            try {
                if ($name == 'type') {
                    // Can not change type in here
                    $error = 1;
                    $msg = trans('store.admin.value_cannot_change');
                } else if ($name == 'domain') {
                    if ($storeId == SC_ID_ROOT || (function_exists('sc_store_is_partner') && sc_store_is_partner($storeId))) {
                        // Only store root can edit domain
                        $domain = sc_process_domain_store($value);
                        if (AdminStore::where('domain', $domain)->where('id', '<>', $storeId)->first()) {
                            $error = 1;
                            $msg = trans('store.admin.domain_exist');
                        } else {
                            AdminStore::where('id', $storeId)->update([$name => $domain]);
                            $error = 0;
                        }
                    } else {
                        $error = 1;
                        $msg = trans('store.admin.value_cannot_change');
                    }
                } else {
                    AdminStore::where('id', $storeId)->update([$name => $value]);
                    $error = 0;
                }

            } catch (\Throwable $e) {
                $error = 1;
                $msg = $e->getMessage();
            }
        } else {
            // Process description
            $dataUpdate = [
                'storeId' => $storeId,
                'lang' => $lang,
                'name' => $name,
                'value' => $value,
            ];
            try {
                AdminStore::updateDescription($dataUpdate);
                $error = 0;
            } catch (\Throwable $e) {
                $error = 1;
                $msg = $e->getMessage();
            }
            
        }
        return response()->json(['error' => $error, 'msg' => $msg]);

    }

    public function index() {
        $id = session('adminStoreId');
        $store = AdminStore::find($id);
        if (!$store) {
            $data = [
                'title' => trans('store.admin.title'),
                'subTitle' => '',
                'icon' => 'fas fa-cogs',
                'dataNotFound' => 1
            ];
            return view($this->templatePathAdmin.'screen.store_info')
            ->with($data);
        }
        $data = [
            'title' => trans('store.admin.title'),
            'subTitle' => '',
            'icon' => 'fas fa-cogs',        
        ];
        $data['store'] = $store;
        $data['templates'] = $this->templates;
        $data['timezones'] = $this->timezones;
        $data['languages'] = $this->languages;
        $data['currencies'] =$this->currencies;
        $data['storeId'] = $id;

        return view($this->templatePathAdmin.'screen.store_info')
        ->with($data);
    }

    /**
     * Switch store
     *
     * @param   [type]  $storeId  [$storeId description]
     *
     * @return  [type]            [return description]
     */
    public function switchStore($storeId) {
        $listStoreId = \Admin::user()->listStoreId();
        if(in_array($storeId, $listStoreId)) {
            session(['adminStoreId' => $storeId]);
            return back()->with(['success' => trans('admin.store_swicth_success')]);
        } else {
            return redirect()->route('admin.deny');
        }

    }

}
