<?php

use SCart\Core\Front\Models\ShopLanguage;

if (!function_exists('sc_language_all')) {
    //Get all language
    function sc_language_all()
    {
        return ShopLanguage::getListActive();
    }
}

if (!function_exists('sc_language_render')) {
    /*
    Render language
     */
    function sc_language_render($string)
    {
        $arrCheck = explode('lang::', $string);
        if (count($arrCheck) == 2) {
            return trans($arrCheck[1]);
        } else {
            return trans($string);
        }
    }
}


if (!function_exists('sc_get_locale')) {
    /*
    Get locale
    */
    function sc_get_locale()
    {
        return app()->getLocale();
    }
}


if (!function_exists('sc_lang_switch')) {
    /**
     * Switch language
     *
     * @param   [string]  $lang
     *
     * @return  [mix]
     */
    function sc_lang_switch($lang = null)
    {
        if (!$lang) {
            return ;
        }

        $languages = sc_language_all()->keys()->all();
        if (in_array($lang, $languages)) {
            app()->setLocale($lang);
            session(['locale' => $lang]);
        } else {
            return abort(404);
        }

    }
}