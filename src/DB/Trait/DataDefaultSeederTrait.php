<?php

namespace SCart\Core\DB\Trait;

trait DataDefaultSeederTrait
{
    public $adminUser = 'admin';
    //admin
    public $adminPassword = '$2y$10$JcmAHe5eUZ2rS0jU1GWr/.xhwCnh2RU13qwjTPcqfmtZXjZxcryPO';
    public $adminEmail = 'your-email@your-domain.com';
    public $language_default = 'en';
    public $title_en = 'Demo S-Cart : Free Laravel eCommerce';
    public $title_vi = 'Demo S-Cart: Mã nguồn website thương mại điện tử miễn phí';

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function runProcess()
    {
        //Insert admin
        $pathAdminFull = base_path('vendor/s-cart/core/src/DB/default.sql');
        if (!empty(session('infoInstall')['admin_user'])) {
            $this->adminUser = session('infoInstall')['admin_user'];
        }
        if (!empty(session('infoInstall')['admin_password'])) {
            $this->adminPassword = session('infoInstall')['admin_password'];
        }
        if (!empty(session('infoInstall')['admin_email'])) {
            $this->adminEmail = session('infoInstall')['admin_email'];
        }
        if (!empty(session('infoInstall')['website_title'])) {
            $this->title_en = session('infoInstall')['website_title'];
            $this->title_vi = session('infoInstall')['website_title'];
        }

        if (!empty(session('infoInstall')['language_default'])) {
            $this->language_default = session('infoInstall')['language_default'];
        }
        $search = [
            '__SC_DB_PREFIX__',
            '__SC_ADMIN_PREFIX__',
            '__adminUser__',
            '__adminPassword__',
            '__adminEmail__',
            '__language_default__',
            '__domain__',
            '__SC_TITLE_EN__',
            '__SC_TITLE_VN__',
        ];
        $replace = [
            SC_DB_PREFIX,
            SC_ADMIN_PREFIX,
            $this->adminUser,
            $this->adminPassword,
            $this->adminEmail,
            $this->language_default,
            str_replace(['http://','https://', '/install.php'], '', url('/')),
            $this->title_en,
            $this->title_vi,
        ];
        $content = str_replace(
            $search,
            $replace,
            file_get_contents($pathAdminFull)
        );

        \Illuminate\Support\Facades\DB::connection(SC_CONNECTION)->unprepared($content);
    }
}
