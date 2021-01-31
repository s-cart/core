<?php

namespace SCart\Core;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use SCart\Core\Front\Models\ShopProduct;
use SCart\Core\Front\Models\ShopCategory;
use SCart\Core\Front\Models\ShopBanner;
use SCart\Core\Front\Models\ShopBrand;
use SCart\Core\Front\Models\ShopNews;
use SCart\Core\Front\Models\ShopPage;
use SCart\Core\Front\Models\ShopStore;
use SCart\Core\Commands\Customize;
use SCart\Core\Commands\Backup;
use SCart\Core\Commands\Restore;
use SCart\Core\Commands\MakePlugin;
use SCart\Core\Commands\Infomation;
class ScartServiceProvider extends ServiceProvider
{
    protected $commands = [
        Customize::class,
        Backup::class,
        Restore::class,
        MakePlugin::class,
        Infomation::class,
    ];

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $this->mergeConfigFrom(__DIR__.'/Config/admin.php', 'admin');
        $this->mergeConfigFrom(__DIR__.'/Config/validation.php', 'validation');
        $this->mergeConfigFrom(__DIR__.'/Config/lfm.php', 'lfm');
        $this->mergeConfigFrom(__DIR__.'/Config/s-cart.php', 's-cart');
        $this->loadViewsFrom(__DIR__.'/Admin/Views', 's-cart');

        $this->registerPublishing();
        
    if(!file_exists(public_path('install.php'))) {
        foreach (glob(__DIR__.'/Library/Helpers/*.php') as $filename) {
            require_once $filename;
        }
        foreach (glob(app_path() . '/Library/Helpers/*.php') as $filename) {
            require_once $filename;
        }

        foreach (glob(app_path() . '/Plugins/*/*/Provider.php') as $filename) {
            require_once $filename;
        }

        $this->bootScart();

        //Route Admin
        if (file_exists($routes = __DIR__.'/Admin/routes.php')) {
            $this->loadRoutesFrom($routes);
        }

        //Route Api
        if (file_exists($routes = __DIR__.'/Api/routes.php')) {
            $this->loadRoutesFrom($routes);
        }

        //Route Front
        if (file_exists($routes = __DIR__.'/Front/routes.php')) {
            $this->loadRoutesFrom($routes);
        }

        try {
            DB::connection(SC_CONNECTION)->getPdo();
        } catch(\Throwable $e) {
            sc_report($e->getMessage());
            return;
        }
    }

        $this->validationExtend();

    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        if (file_exists(__DIR__.'/Library/Const.php')) {
            require_once (__DIR__.'/Library/Const.php');
        }
        $this->app->bind('cart', '\SCart\Core\Library\ShoppingCart\Cart');
        
        $this->registerRouteMiddleware();

        $this->commands($this->commands);
    }

    public function bootScart()
    {
        // Set store id
        // Default is domain root
        $storeId = SC_ID_ROOT;

        //Process for multi store
        if(sc_config_global('MultiStorePro')) {
            $domain = sc_process_domain_store(url('/'));
            $arrDomain = ShopStore::getDomainPartner();
            if (in_array($domain, $arrDomain)) {
                $storeId =  array_search($domain, $arrDomain);
            }
        }
        //End process multi store

        config(['app.storeId' => $storeId]);
        // end set store Id

        if (sc_config_global('LOG_SLACK_WEBHOOK_URL')) {
            config(['logging.channels.slack.url' => sc_config_global('LOG_SLACK_WEBHOOK_URL')]);
        }

        //Config language url
        config(['app.seoLang' => (sc_config_global('url_seo_lang') ? '{lang?}/' : '')]);

        //Title app
        config(['app.name' => sc_store('title')]);

        //Config for  email
        if ($storeId != SC_ID_ROOT && sc_config_global('MultiStorePro')) {
            // Must use smtp for supplier if use multi-store
            config(['mail.default' => 'smtp']);
            $smtpHost     = sc_config('smtp_host');
            $smtpPort     = sc_config('smtp_port');
            $smtpSecurity = sc_config('smtp_security');
            $smtpUser     = sc_config('smtp_user');
            $smtpPassword = sc_config('smtp_password');
            config(['mail.mailers.smtp.host' => $smtpHost]);
            config(['mail.mailers.smtp.port' => $smtpPort]);
            config(['mail.mailers.smtp.encryption' => $smtpSecurity]);
            config(['mail.mailers.smtp.username' => $smtpUser]);
            config(['mail.mailers.smtp.password' => $smtpPassword]);
        }

        if ($storeId == SC_ID_ROOT) {
            // Use smtp config from admin if smtp_mode enable
            if (sc_config_global('smtp_mode')) {
                config(['mail.default' => 'smtp']);
                $smtpHost     = sc_config('smtp_host');
                $smtpPort     = sc_config('smtp_port');
                $smtpSecurity = sc_config('smtp_security');
                $smtpUser     = sc_config('smtp_user');
                $smtpPassword = sc_config('smtp_password');
                config(['mail.mailers.smtp.host' => $smtpHost]);
                config(['mail.mailers.smtp.port' => $smtpPort]);
                config(['mail.mailers.smtp.encryption' => $smtpSecurity]);
                config(['mail.mailers.smtp.username' => $smtpUser]);
                config(['mail.mailers.smtp.password' => $smtpPassword]);
            }
        }


        config(
            [
                'mail.from.address' => sc_store('email'),
                'mail.from.name' => sc_store('title')
            ]
        );
        //email

        // Time zone
        config(['app.timezone' => (sc_store('timezone') ?? config('app.timezone'))]);
        // End time zone

        //Share variable for view
        view()->share('sc_languages', sc_language_all());
        view()->share('sc_currencies', sc_currency_all());
        view()->share('sc_blocksContent', sc_store_block());
        view()->share('sc_layoutsUrl', sc_link());
        view()->share('sc_templatePath', 'templates.' . sc_store('template'));
        view()->share('sc_templateFile', 'templates/' . sc_store('template'));
        //variable model
        view()->share('modelProduct', (new ShopProduct));
        view()->share('modelCategory', (new ShopCategory));
        view()->share('modelBanner', (new ShopBanner));
        view()->share('modelBrand', (new ShopBrand));
        view()->share('modelNews', (new ShopNews));
        view()->share('modelPage', (new ShopPage));
        //
        view()->share('templatePathAdmin', (config('admin.customize') ? 'admin.': 's-cart::'));


    }

    /**
     * The application's route middleware.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'localization'     => Front\Middleware\Localization::class,
        'currency'         => Front\Middleware\Currency::class,
        'api.connection'   => Api\Middleware\ApiConnection::class,
        'checkdomain'      => Front\Middleware\CheckDomain::class,
        'json.response'    => Api\Middleware\ForceJsonResponse::class,
        //Admin
        'admin.auth'       => Admin\Middleware\Authenticate::class,
        'admin.log'        => Admin\Middleware\LogOperation::class,
        'admin.permission' => Admin\Middleware\PermissionMiddleware::class,
        'admin.storeId'    => Admin\Middleware\AdminStoreId::class,
        'admin.theme'      => Admin\Middleware\AdminTheme::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'admin' => [
            'admin.auth',
            'admin.permission',
            'admin.log',
            'admin.storeId',
            'admin.theme',
            'localization',
        ],
        'front' => [
            'localization',
            'currency',
            'checkdomain',
        ],
        'api.extent' => [
            'json.response',
            'api.connection',
            'throttle:1000',
        ],
    ];

    /**
     * Register the route middleware.
     *
     * @return void
     */
    protected function registerRouteMiddleware()
    {
        // register route middleware.
        foreach ($this->routeMiddleware as $key => $middleware) {
            app('router')->aliasMiddleware($key, $middleware);
        }

        // register middleware group.
        foreach ($this->middlewareGroups as $key => $middleware) {
            app('router')->middlewareGroup($key, $middleware);
        }
    }


    /**
     * Validattion extend
     *
     * @return  [type]  [return description]
     */
    protected function validationExtend() {
        Validator::extend('product_sku_unique', function ($attribute, $value, $parameters, $validator) {
            $productId = $parameters[0] ?? '';
            return (new Admin\Models\AdminProduct)
                ->checkProductValidationAdmin('sku', $value, $productId, session('adminStoreId'));
        });

        Validator::extend('product_alias_unique', function ($attribute, $value, $parameters, $validator) {
            $productId = $parameters[0] ?? '';
            return (new Admin\Models\AdminProduct)
                ->checkProductValidationAdmin('alias', $value, $productId, session('adminStoreId'));
        });

    }

    /**
     * Register the package's publishable resources.
     *
     * @return void
     */
    protected function registerPublishing()
    {
        if ($this->app->runningInConsole()) {
            $this->publishes([__DIR__.'/Admin/Views'  => resource_path('views/admin')], 'sc:view-admin');
            $this->publishes([__DIR__.'/Config/admin.php' => config_path('admin.php')], 'sc:config-admin');
            $this->publishes([__DIR__.'/Config/validation.php' => config_path('validation.php')], 'sc:config-validation');
        }
    }
}
