<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;  
class AdminPluginsOnlineController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index($code)
    {
        $code = sc_word_format_class($code);
        $action = request('action');
        $pluginKey = request('pluginKey');
        if ($action == 'config' && $pluginKey != '') {
            $namespace = sc_get_class_plugin_config($code, $pluginKey);
            $body = (new $namespace)->config();
        } else {
            $body = $this->pluginCode($code);
        }
        return $body;
    }

    protected function pluginCode($code)
    {
        $arrPluginLibrary = [];
        $sc_version = config('s-cart.core');
        $filter_free = request('filter_free', '');
        $filter_type = request('filter_type', '');
        $filter_keyword = request('filter_keyword', '');

        $page = request('page') ?? 1;

        $url = config('s-cart.api_link').'/plugins/'.$code.'?page[size]=20&page[number]='.$page;
        $url .='&version='.$sc_version;
        $url .='&filter_free='.$filter_free;
        $url .='&filter_type='.$filter_type;
        $url .='&filter_keyword='.$filter_keyword;
        $ch            = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        $dataApi   = curl_exec($ch);
        curl_close($ch);
        $dataApi = json_decode($dataApi, true);
        if(!empty($dataApi['data'])) {
            foreach ($dataApi['data'] as $key => $data) {
                $arrPluginLibrary[] = [
                    'sku' => $data['sku'] ?? '',
                    'key' => $data['key'] ?? '',
                    'name' => $data['name'] ?? '',
                    'description' => $data['description'] ?? '',
                    'image' => $data['image'] ?? '',
                    'path' => $data['path'] ?? '',
                    'file' => $data['file'] ?? '',
                    'scart_version' => $data['scart_version'] ?? '',
                    'version' => $data['version'] ?? '',
                    'price' => $data['price'] ?? 0,
                    'price_final' => $data['price_final'] ?? 0,
                    'is_free' => $data['is_free'] ?? 0,
                    'download' => $data['download'] ?? 0,
                    'username' =>  $data['username'] ?? '',
                    'times' =>  $data['times'] ?? 0,
                    'points' =>  $data['points'] ?? 0,
                    'rated' =>  $data['rated'] ?? 0,
                    'date' =>  $data['date'] ?? '',
                    'link' =>  $data['link'] ?? '',
                ];
            }
        }
        $resultItems = sc_language_render('admin.result_item', ['item_from' => $dataApi['from'] ?? 0, 'item_to' => $dataApi['to']??0, 'total' =>  $dataApi['total'] ?? 0]);
        $code = sc_word_format_class($code);

        $arrPluginLocal = sc_get_all_plugin($code);
        $title = sc_language_render('admin.plugin.' . $code.'_plugin');

        return view($this->templatePathAdmin.'screen.plugin_online')->with(
            [
                "title" => $title,
                "arrPluginLocal" => $arrPluginLocal,
                "code" => $code,
                "filter_keyword" => $filter_keyword ?? '',
                "filter_type" => $filter_type ?? '',
                "filter_free" => $filter_free ?? '',
                "arrPluginLibrary" => $arrPluginLibrary,
                "resultItems" => $resultItems,
                "dataApi" => $dataApi,
            ]);
    }

    public function install()
    {
        $code = request('code');
        $key = request('key');
        $pathPlugin = 'Plugins/'.$code.'/'.$key;
        $path = request('path');
        try {
            $data = file_get_contents($path);
            $pathTmp = $code.'_'.$key.'_'.time();
            $fileTmp = $pathTmp.'.zip';
            Storage::disk('tmp')->put($pathTmp.'/'.$fileTmp, $data);
            $unzip = sc_unzip(storage_path('tmp/'.$pathTmp.'/'.$fileTmp), storage_path('tmp/'.$pathTmp));
            if($unzip) {
                $checkConfig = glob(storage_path('tmp/'.$pathTmp) . '/*/src/config.json');
                if(!$checkConfig) {
                    return $response = ['error' => 1, 'msg' => 'Cannot found file config.json'];
                }
                $folderName = explode('/src',$checkConfig[0]);
                $folderName = explode('/', $folderName[0]);
                $folderName = end($folderName);
                File::copyDirectory(storage_path('tmp/'.$pathTmp.'/'.$folderName.'/public'), public_path($pathPlugin));
                File::copyDirectory(storage_path('tmp/'.$pathTmp.'/'.$folderName.'/src'), app_path($pathPlugin));
                File::deleteDirectory(storage_path('tmp/'.$pathTmp));
                $namespace = sc_get_class_plugin_config($code, $key);
                $response = (new $namespace)->install();
            } else {
                $response = ['error' => 1, 'msg' => 'error while unzip'];
            }
        } catch(\Exception $e) {
            $response = ['error' => 1, 'msg' => $e->getMessage()];
        }
        return response()->json($response);
    }
}
