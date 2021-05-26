<?php

use SCart\Core\Front\Models\ShopLanguage;
use Illuminate\Support\Str;

if (!function_exists('sc_language_all')) {
    //Get all language
    function sc_language_all()
    {
        return ShopLanguage::getListActive();
    }
}

if (!function_exists('sc_languages')) {
    /*
    Render language
    WARNING: Dont call this function (or functions that call it) in __construct or midleware, it may cause the display language to be incorrect
     */
    function sc_languages($locale)
    {
        $languages = \SCart\Core\Front\Models\Languages::getListAll($locale);
        return $languages;
    }
}

if (!function_exists('sc_language_replace')) {
    /*
    Replace language
     */
    function sc_language_replace($line, $replace)
    {
        foreach ($replace as $key => $value) {
            $line = str_replace(
                [':'.$key, ':'.Str::upper($key), ':'.Str::ucfirst($key)],
                [$value, Str::upper($value), Str::ucfirst($value)],
                $line
            );
        }
        return $line;
    }
}


if (!function_exists('sc_language_render')) {
    /*
    Render language
    WARNING: Dont call this function (or functions that call it) in __construct or midleware, it may cause the display language to be incorrect
     */
    function sc_language_render($string, $replace = [], $locale = null)
    {
        $locale = $locale ? $locale : sc_get_locale();
        $languages = sc_languages($locale);
        return !empty($languages[$string]) ? sc_language_replace($languages[$string], $replace): trans($string, $replace);
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