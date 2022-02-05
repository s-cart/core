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
use SCart\Core\Commands\ClearCart;
use SCart\Core\Commands\Update;
use Laravel\Passport\Passport;
use Laravel\Passport\Console\ClientCommand;
use Laravel\Passport\Console\InstallCommand;
use Laravel\Passport\Console\KeysCommand;

class ScartServiceProvider extends ServiceProvider
{
    protected $commands = [
        Customize::class,
        Backup::class,
        Restore::class,
        MakePlugin::class,
        Infomation::class,
        ClearCart::class,
        Update::class,
    ];

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadTranslationsFrom(__DIR__.'/Lang', 's-cart');

        if (!file_exists(public_path('install.php')) && file_exists(base_path('.env'))) {
            //Load helper from front
            try {
                foreach (glob(__DIR__.'/Library/Helpers/*.php') as $filename) {
                    require_once $filename;
                }
            } catch (\Throwable $e) {
                $msg = '#SC001::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                // sc_report($msg);
                echo $msg;
                exit;
            }

            //Load helper from vendor
            try {
                foreach (glob(app_path() . '/Library/Helpers/*.php') as $filename) {
                    require_once $filename;
                }
            } catch (\Throwable $e) {
                $msg = '#SC002::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }
            //Check connection
            try {
                DB::connection(SC_CONNECTION)->getPdo();
            } catch (\Throwable $e) {
                $msg = '#SC003::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }
            //Load Plugin Provider
            try {
                foreach (glob(app_path() . '/Plugins/*/*/Provider.php') as $filename) {
                    require_once $filename;
                }
            } catch (\Throwable $e) {
                $msg = '#SC004::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }

            //Boot process S-Cart
            try {
                $this->bootScart();
            } catch (\Throwable $e) {
                $msg = '#SC005::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }

            //Route Admin
            try {
                if (file_exists($routes = __DIR__.'/Admin/routes.php')) {
                    $this->loadRoutesFrom($routes);
                }
            } catch (\Throwable $e) {
                $msg = '#SC006::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }

            //Route Api
            try {
                if (sc_config_global('api_mode')) {
                    if (file_exists($routes = __DIR__.'/Api/routes.php')) {
                        $this->loadRoutesFrom($routes);
                    }
                }
            } catch (\Throwable $e) {
                $msg = '#SC007::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }

            //Route Front
            try {
                if (file_exists($routes = __DIR__.'/Front/routes.php')) {
                    $this->loadRoutesFrom($routes);
                }
            } catch (\Throwable $e) {
                $msg = '#SC008::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
                sc_report($msg);
                echo $msg;
                exit;
            }
        }

        try {
            $this->registerPublishing();
        } catch (\Throwable $e) {
            $msg = '#SC009::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
            sc_report($msg);
            echo $msg;
            exit;
        }
        
        try {
            $this->registerRouteMiddleware();
        } catch (\Throwable $e) {
            $msg = '#SC010::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
            sc_report($msg);
            echo $msg;
            exit;
        }
        
        try {
            $this->commands($this->commands);
        } catch (\Throwable $e) {
            $msg = '#SC011::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
            sc_report($msg);
            echo $msg;
            exit;
        }
        
        try {
            $this->validationExtend();
        } catch (\Throwable $e) {
            $msg = '#SC012::Message: ' .$e->getMessage().' - Line: '.$e->getLine().' - File: '.$e->getFile();
            sc_report($msg);
            echo $msg;
            exit;
        }

        //===========Laravel Passport====================
        //https://laravel.com/docs/8.x/passport
        Passport::routes();
        Passport::tokensExpireIn(now()->addDays(config('passport.config.tokensExpireIn', 15)));
        Passport::refreshTokensExpireIn(now()->addDays(config('passport.config.refreshTokensExpireIn', 30)));
        Passport::personalAccessTokensExpireIn(now()->addMonths(config('passport.config.personalAccessTokensExpireIn', 6)));

        /**
         * Run command line passport outside console
         */
        $this->commands([
            InstallCommand::class,
            ClientCommand::class,
            KeysCommand::class,
        ]);

        Passport::tokensCan([
            'user' => 'User default',
            'user-guest' => 'User guest',
            'admin' => 'Admin shop',
            'admin-supper' => 'Admin supper',
        ]);

        Passport::setDefaultScope([
            'user-guest',
        ]);
    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        if (file_exists(__DIR__.'/Library/Const.php')) {
            require_once(__DIR__.'/Library/Const.php');
        }
        $this->app->bind('cart', '\SCart\Core\Library\ShoppingCart\Cart');
        
        $this->mergeConfigFrom(__DIR__.'/Config/admin.php', 'admin');
        $this->mergeConfigFrom(__DIR__.'/Config/validation.php', 'validation');
        $this->mergeConfigFrom(__DIR__.'/Config/lfm.php', 'lfm');
        $this->mergeConfigFrom(__DIR__.'/Config/s-cart.php', 's-cart');
        $this->mergeConfigFrom(__DIR__.'/Config/cart.php', 'cart');
        $this->mergeConfigFrom(__DIR__.'/Config/middleware.php', 'middleware');
        $this->loadViewsFrom(__DIR__.'/Views/admin', 's-cart-admin');
        $this->loadViewsFrom(__DIR__.'/Views/front', 's-cart-front');

        //Dont use migrate from library passport
        Passport::ignoreMigrations();
    }

    public function bootScart()
    {
        // Set store id
        // Default is domain root
        $storeId = SC_ID_ROOT;

        //Process for multi store
        if (sc_check_multi_shop_installed()) {
            $domain = sc_process_domain_store(url('/'));
            if (sc_check_multi_vendor_installed()) {
                $arrDomain = ShopStore::getDomainPartner();
            }
            if (sc_check_multi_store_installed()) {
                $arrDomain = ShopStore::getDomainStore();
            }
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
        if (
            // Default use smtp mode for for supplier if use multi-store
            ($storeId != SC_ID_ROOT && sc_check_multi_shop_installed())
            ||
            // Use smtp config from admin if root domain have smtp_mode enable
            ($storeId == SC_ID_ROOT && sc_config_global('smtp_mode'))
            ) {
            $smtpHost     = sc_config('smtp_host');
            $smtpPort     = sc_config('smtp_port');
            $smtpSecurity = sc_config('smtp_security');
            $smtpUser     = sc_config('smtp_user');
            $smtpPassword = sc_config('smtp_password');
            $smtpName     = sc_config('smtp_name');
            $smtpFrom     = sc_config('smtp_from');
            config(['mail.default'                 => 'smtp']);
            config(['mail.mailers.smtp.host'       => $smtpHost]);
            config(['mail.mailers.smtp.port'       => $smtpPort]);
            config(['mail.mailers.smtp.encryption' => $smtpSecurity]);
            config(['mail.mailers.smtp.username'   => $smtpUser]);
            config(['mail.mailers.smtp.password' => $smtpPassword]);
            config(['mail.from.address' => ($smtpFrom ?? sc_store('email'))]);
            config(['mail.from.name' => ($smtpName ?? sc_store('title'))]);
        } else {
            //Set default
            config(['mail.from.address' => (config('mail.from.address')) ? config('mail.from.address'): sc_store('email')]);
            config(['mail.from.name' => (config('mail.from.name')) ? config('mail.from.name'): sc_store('title')]);
        }
        //email

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
        view()->share('templatePathAdmin', config('admin.path_view'));
    }

    /**
     * The application's route middleware.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'localization'     => Front\Middleware\Localization::class,
        'email.verify'     => Front\Middleware\EmailIsVerified::class,
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
        //Passport
        'scopes' => \Laravel\Passport\Http\Middleware\CheckScopes::class,
        'scope' => \Laravel\Passport\Http\Middleware\CheckForAnyScope::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected function middlewareGroups()
    {
        return [
            'admin' => config('middleware.admin'),
            'front' => config('middleware.front'),
            'api.extend' => config('middleware.api_extend'),
        ];
    }

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
        foreach ($this->middlewareGroups() as $key => $middleware) {
            app('router')->middlewareGroup($key, array_values($middleware));
        }
    }


    /**
     * Validattion extend
     *
     * @return  [type]  [return description]
     */
    protected function validationExtend()
    {
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
            $this->publishes([__DIR__.'/Views/admin'  => resource_path('views/vendor/s-cart-admin')], 'sc:view-admin');
            $this->publishes([__DIR__.'/Views/front'  => resource_path('views/vendor/s-cart-front')], 'sc:view-front');
            $this->publishes([__DIR__.'/Config/admin.php' => config_path('admin.php')], 'sc:config-admin');
            $this->publishes([__DIR__.'/Config/validation.php' => config_path('validation.php')], 'sc:config-validation');
            $this->publishes([__DIR__.'/Config/cart.php' => config_path('cart.php')], 'sc:config-cart');
        }
    }
}
