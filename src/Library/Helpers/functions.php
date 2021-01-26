<?php

use SCart\Core\Front\Models\ShopStoreBlockContent;
use SCart\Core\Front\Models\ShopLink;
use SCart\Core\Front\Models\ShopStoreCss;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
use Illuminate\Support\Arr;

/*
Get all block content
 */
if (!function_exists('sc_link')) {
    function sc_link()
    {
        return ShopLink::getGroup();
    }
}

/*
Get all layouts
 */
if (!function_exists('sc_store_block')) {
    function sc_store_block()
    {
        return ShopStoreBlockContent::getLayout();
    }
}

/*
String to Url
 */
if (!function_exists('sc_word_format_url')) {
    function sc_word_format_url($str)
    {
        $unicode = array(
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
            'd' => 'đ',
            'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
            'i' => 'í|ì|ỉ|ĩ|ị',
            'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ',
            'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
            'D' => 'Đ',
            'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
            'I' => 'Í|Ì|Ỉ|Ĩ|Ị',
            'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
            'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
            'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
        );

        foreach ($unicode as $nonUnicode => $uni) {
            $str = preg_replace("/($uni)/i", $nonUnicode, $str);
        }
        return strtolower(preg_replace(
            array('/[\'\/~`\!@#\$%\^&\*\(\)\+=\{\}\[\]\|;:"\<\>,\.\?\\\]/', '/[\s-]+|[-\s]+|[--]+/', '/^[-\s_]|[-_\s]$/'),
            array('', '-', ''),
            strtolower($str)
        ));
    }
}


if (!function_exists('sc_store_css')) {
    function sc_store_css()
    {
        $css =  ShopStoreCss::where('store_id', config('app.storeId'))->first();
        if($css) {
            return $css->css;
        }
    }
}

if (!function_exists('sc_url_render')) {
    /*
    url render
     */
    function sc_url_render($string)
    {
        $arrCheckRoute = explode('route::', $string);
        $arrCheckUrl = explode('admin::', $string);

        if (count($arrCheckRoute) == 2) {
            $arrRoute = explode('::', $string);
            if (isset($arrRoute[2])) {
                return sc_route($arrRoute[1], [$arrRoute[2]]);
            } else {
                return sc_route($arrRoute[1]);               
            }
        }

        if (count($arrCheckUrl) == 2) {
            $string = Str::start($arrCheckUrl[1], '/');
            $string = SC_ADMIN_PREFIX . $string;
            return url($string);
        }
        return url($string);
    }
}


if (!function_exists('sc_html_render')) {
    /*
    Html render
     */
    function sc_html_render($string)
    {
        $string = htmlspecialchars_decode($string);
        return $string;
    }
}

if (!function_exists('sc_word_format_class')) {
    /*
    Format class name
     */
    function sc_word_format_class($word)
    {
        $word = Str::camel($word);
        $word = ucfirst($word);
        return $word;
    }
}

if (!function_exists('sc_word_limit')) {
    /*
    Truncates words
     */
    function sc_word_limit($word, $limit = 20, $arg = '')
    {
        $word = Str::limit($word, $limit, $arg);
        return $word;
    }
}

if (!function_exists('sc_token')) {
    /*
    Create random token
     */
    function sc_token($length = 32)
    {
        $token = Str::random($length);
        return $token;
    }
}

if (!function_exists('sc_report')) {
    /*
    Handle report
     */
    function sc_report($msg, array $ext = [])
    {
        $msg = date('Y-m-d H:i:s').':'.PHP_EOL.$msg.PHP_EOL;
        if(!in_array('slack', $ext)) {
            if (config('logging.channels.slack.url')) {
                try {
                    \Log::channel('slack')->error($msg);
                } catch(\Throwable $e) {
                    $msg .= $e->getFile().'- Line: '.$e->getLine().PHP_EOL.$e->getMessage().PHP_EOL; 
                }
            }
        }
        \Log::error($msg);
    }
}


if (!function_exists('sc_zip')) {
    /*
    Zip file or folder
     */
    function sc_zip(string $source, string $destination)
    {
        if (extension_loaded('zip')) {
            if (file_exists($source)) {
                $zip = new \ZipArchive();
                if ($zip->open($destination, \ZIPARCHIVE::CREATE)) {
                    $source = str_replace('\\', '/', realpath($source));
                    if (is_dir($source)) {
                        $iterator = new \RecursiveDirectoryIterator($source);
                        // skip dot files while iterating 
                        $iterator->setFlags(\RecursiveDirectoryIterator::SKIP_DOTS);
                        $files = new \RecursiveIteratorIterator($iterator, \RecursiveIteratorIterator::SELF_FIRST);
                        foreach ($files as $file) {
                            $file = str_replace('\\', '/', realpath($file));
                            if (is_dir($file)) {
                                $zip->addEmptyDir(str_replace($source . '/', '', $file . '/'));
                            } else if (is_file($file)) {
                                $zip->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
                            }
                        }
                    } else if (is_file($source)) {
                        $zip->addFromString(basename($source), file_get_contents($source));
                    }
                }
                return $zip->close();
            }
        }
        return false;
    }
}


if (!function_exists('sc_unzip')) {
    /**
     * Unzip file to folder
     *
     * @return  [type]  [return description]
     */
    function sc_unzip(string $source, string $destination)
    {
        $zip = new \ZipArchive();
        if ($zip->open(str_replace("//", "/", $source)) === true) {
            $zip->extractTo($destination);
            return $zip->close();
        }
        return false;
    }
}


if (!function_exists('sc_get_all_template')) {
    /*
    Get all template
    */
    function sc_get_all_template()
    {
        $arrTemplates = [];
        foreach (glob(resource_path() . "/views/templates/*") as $template) {
            if (is_dir($template)) {
                $infoTemlate['code'] = explode('templates/', $template)[1];
                $config = ['name' => '', 'auth' => '', 'email' => '', 'website' => ''];
                if (file_exists($template . '/config.json')) {
                    $config = json_decode(file_get_contents($template . '/config.json'), true);
                }
                $infoTemlate['config'] = $config;
                $arrTemplates[$infoTemlate['code']] = $infoTemlate;
            }
        }
        return $arrTemplates;
    }
}


if (!function_exists('sc_route')) {
    /**
     * Render route
     *
     * @param   [string]  $name
     * @param   [array]  $param
     *
     * @return  [type]         [return description]
     */
    function sc_route($name, $param = [])
    {
        if (!config('app.seoLang')) {
            $param = Arr::except($param, ['lang']);
        } else {
            if (!key_exists('lang', $param) && $name != 'locale' && $name != 'home') {
                $param['lang'] = app()->getLocale();
            }
        }
        if (Route::has($name)) {
            return route($name, $param);
        } else {
            return url('#'.$name);
        }
    }
}


if (!function_exists('sc_route_admin')) {
    /**
     * Render route admin
     *
     * @param   [string]  $name
     * @param   [array]  $param
     *
     * @return  [type]         [return description]
     */
    function sc_route_admin($name, $param = [])
    {
        if (Route::has($name)) {
            return route($name, $param);
        } else {
            return url('#'.$name);
        }
    }
}

if (!function_exists('sc_process_domain_store')) {
    /**
     * Process domain store
     *
     * @param   [string]  $domain
     *
     * @return  [string]         [$domain]
     */
    function sc_process_domain_store($domain)
    {
        $domain = str_replace(['http://', 'https://'], '', $domain);
        $domain = Str::lower($domain);
        $domain = rtrim($domain, '/');
        return $domain;
    }
}

if (!function_exists('sc_push_include_view')) {
    /**
     * Push view
     *
     * @param   [string]  $position
     * @param   [string]  $pathView
     *
     */
    function sc_push_include_view($position, $pathView)
    {
        $includePathView = config('sc_include_view.'.$position, []);
        $includePathView[] = $pathView;
        config(['sc_include_view.'.$position => $includePathView]);
    }
}


if (!function_exists('sc_push_include_script')) {
    /**
     * Push script
     *
     * @param   [string]  $position
     * @param   [string]  $pathScript
     *
     */
    function sc_push_include_script($position, $pathScript)
    {
        $includePathScript = config('sc_include_script.'.$position, []);
        $includePathScript[] = $pathScript;
        config(['sc_include_script.'.$position => $includePathScript]);
    }
}

if (!function_exists('sc_path_download_render')) {
    /*
    Render path download
     */
    function sc_path_download_render(string $string)
    {
        if (filter_var($string, FILTER_VALIDATE_URL)) {
            return $string;
        } else {
            return \Storage::disk('path_download')->url($string);
        }
    }
}