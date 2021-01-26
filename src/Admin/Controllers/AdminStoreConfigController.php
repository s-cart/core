<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Front\Models\ShopLanguage;
use SCart\Core\Front\Models\ShopCurrency;
use SCart\Core\Admin\Models\AdminConfig;
use SCart\Core\Front\Models\ShopTax;

class AdminStoreConfigController extends RootAdminController
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

    public function index() {
        $id = session('adminStoreId');
        $data = [
            'title' => trans('admin.menu_titles.config_store_default'),
            'subTitle' => '',
            'icon' => 'fas fa-cogs',        
        ];

        // Customer config
        $dataCustomerConfig = [
            'code' => 'customer_config_attribute',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $customerConfigs = AdminConfig::getListConfigByCode($dataCustomerConfig);
        
        $dataCustomerConfigRequired = [
            'code' => 'customer_config_attribute_required',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $customerConfigsRequired = AdminConfig::getListConfigByCode($dataCustomerConfigRequired);
        //End customer

        //Product config
        $taxs = ShopTax::pluck('name', 'id')->toArray();
        $taxs[0] = trans('tax.admin.non_tax');

        $productConfigQuery = [
            'code' => 'product_config',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $productConfig = AdminConfig::getListConfigByCode($productConfigQuery);

        $productConfigAttributeQuery = [
            'code' => 'product_config_attribute',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $productConfigAttribute = AdminConfig::getListConfigByCode($productConfigAttributeQuery);

        $productConfigAttributeRequiredQuery = [
            'code' => 'product_config_attribute_required',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $productConfigAttributeRequired = AdminConfig::getListConfigByCode($productConfigAttributeRequiredQuery);

        $orderConfigQuery = [
            'code' => 'order_config',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $orderConfig = AdminConfig::getListConfigByCode($orderConfigQuery);

        $configDisplayQuery = [
            'code' => 'display_config',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $configDisplay = AdminConfig::getListConfigByCode($configDisplayQuery);

        $configCaptchaQuery = [
            'code' => 'captcha_config',
            'storeId' => $id,
            'keyBy' => 'key',
        ];
        $configCaptcha = AdminConfig::getListConfigByCode($configCaptchaQuery);

        $emailConfigQuery = [
            'code' => ['smtp_config', 'email_action'],
            'storeId' => $id,
            'groupBy' => 'code',
            'sort'    => 'asc',
        ];
        $emailConfig = AdminConfig::getListConfigByCode($emailConfigQuery);

        $data['emailConfig'] = $emailConfig;
        $data['smtp_method'] = ['' => 'None Secirity', 'TLS' => 'TLS', 'SSL' => 'SSL'];
        $data['captcha_page'] = [
            'register' => trans('captcha.captcha_page_register'), 
            'forgot'   => trans('captcha.captcha_page_forgot_password'), 
            'checkout' => trans('captcha.captcha_page_checkout'), 
            'contact'  => trans('captcha.captcha_page_contact'),
            'review'   => trans('captcha.captcha_page_review'),
        ];
        //End email
        $data['customerConfigs']                = $customerConfigs;
        $data['customerConfigsRequired']        = $customerConfigsRequired;
        $data['productConfig']                  = $productConfig;
        $data['productConfigAttribute']         = $productConfigAttribute;
        $data['productConfigAttributeRequired'] = $productConfigAttributeRequired;
        $data['pluginCaptchaInstalled']         = sc_get_plugin_captcha_installed();
        $data['taxs']                           = $taxs;
        $data['configDisplay']                  = $configDisplay;
        $data['orderConfig']                    = $orderConfig;
        $data['configCaptcha']                  = $configCaptcha;
        $data['templates']                      = $this->templates;
        $data['timezones']                      = $this->timezones;
        $data['languages']                      = $this->languages;
        $data['currencies']                     = $this->currencies;
        $data['storeId']                        = $id;
        $data['urlUpdateConfig']                = sc_route_admin('admin_config.update');
        $data['urlUpdateConfigGlobal']          = sc_route_admin('admin_config_global.update');

        return view($this->templatePathAdmin.'screen.config_store_default')
        ->with($data);
    }

    /*
    Update value config store
    */
    public function update()
    {
        $data = request()->all();
        $name = $data['name'];
        $value = $data['value'];
        $storeId = $data['storeId'] ?? '';
        if (!$storeId) {
            return response()->json([
                'error' => 1,
                'field' => 'storeId',
                'value' => $storeId,
                'msg'   => 'Store ID can not empty!',
                ]
            );
        }

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
            'msg'   => $msg,
            ]
        );

    }

}
