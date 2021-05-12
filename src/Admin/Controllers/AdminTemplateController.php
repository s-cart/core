<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Admin\Models\AdminStore;
use Illuminate\Support\Facades\File;

class AdminTemplateController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function index()
    {
        $data = [
            'title' => sc_language_render('admin.template.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',        ];

        $data["templates"] = sc_get_all_template();
        $data["templatesUsed"] = AdminStore::getAllTemplateUsed();
        return view($this->templatePathAdmin.'screen.template')
            ->with($data);
    }

    public function changeTemplate()
    {
        $key = request('key');
        $process = AdminStore::first()->update(['template' => $key]);
        if ($process) {
            $return = ['error' => 0, 'msg' => 'Change template success!'];
        } else {
            $return = ['error' => 1, 'msg' => 'Have an error!'];
        }
        return response()->json($return);
    }

    /**
     * Remove template
     *
     * @return void
     */
    public function remove()
    {
        $key = request('key');

        //Run function process before remove template
        if (file_exists($fileProcess = resource_path() . '/views/templates/'.$key.'/Provider.php')) {
            include_once $fileProcess;
            if (function_exists('sc_template_uninstall')) {
                sc_template_uninstall();
            }
        }

        try {
            File::deleteDirectory(public_path('templates/'.$key));
            File::deleteDirectory(resource_path('views/templates/'.$key));
            $response = ['error' => 0, 'msg' => 'Remove template success'];
        } catch(\Throwable $e) {
            $response = ['error' => 0, 'msg' => $e->getMessage()];
        }
        return response()->json($response);
    }

    /**
     * Refresh action install template
     *
     * @return void
     */
    public function refresh()
    {
        $key = request('key');

        //Run function process before remove template
        if (file_exists($fileProcess = resource_path() . '/views/templates/'.$key.'/Provider.php')) {
            include_once $fileProcess;
            if (function_exists('sc_template_refresh')) {
                sc_template_refresh();
            } else {
                if (function_exists('sc_template_uninstall') && function_exists('sc_template_install')) {
                    sc_template_uninstall();
                    sc_template_install();
                }
            }
        }
        $response = ['error' => 0, 'msg' => 'Refresh template success'];
        return response()->json($response);
    }

    
    /**
     * Import template
     */
    public function importTemplate() {
        $data =  [
            'title' => sc_language_render('admin.template.import')
        ];
        return view($this->templatePathAdmin.'screen.template_upload')
        ->with($data);
    }

    /**
     * Process import
     *
     * @return  [type]  [return description]
     */
    public function processImport() {
        $data = request()->all();
        $validator = \Validator::make(
            $data,
            [
                'file'   => 'required|mimetypes:application/zip|max:51200',
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $pathTmp = time();
        $pathFile = sc_file_upload($data['file'],'tmp', $pathFolder = $pathTmp)['pathFile'] ?? '';
        if($pathFile) {
            $unzip = sc_unzip(storage_path('tmp/'.$pathFile), storage_path('tmp/'.$pathTmp));
            if($unzip) {
                $checkConfig = glob(storage_path('tmp/'.$pathTmp) . '/*/src/config.json');
                if($checkConfig) {
                    $folderName = explode('/src',$checkConfig[0]);
                    $folderName = explode('/', $folderName[0]);
                    $folderName = end($folderName);
                    $config = json_decode(file_get_contents($checkConfig[0]), true);
                    $configKey = $config['configKey'] ?? '';
                    $configKey = str_replace('.','-', $configKey);
                    if (!$configKey) {
                        File::deleteDirectory(storage_path('tmp/'.$pathTmp));
                        return redirect()->back()->with('error', sc_language_render('admin.template.error_config'));
                    }

                    $arrTemplateLocal = sc_get_all_template();
                    if(array_key_exists($configKey, $arrTemplateLocal)) {
                        File::deleteDirectory(storage_path('tmp/'.$pathTmp));
                        return redirect()->back()->with('error', sc_language_render('admin.template.error_exist'));
                    }
                    try {
                        File::copyDirectory(storage_path('tmp/'.$pathTmp.'/'.$folderName.'/public'), public_path('templates/'.$configKey));
                        File::copyDirectory(storage_path('tmp/'.$pathTmp.'/'.$folderName.'/src'), resource_path('views/templates/'.$configKey));
                        File::deleteDirectory(storage_path('tmp/'.$pathTmp));

                        //Run function process after install template
                        if (file_exists($fileProcess = resource_path() . '/views/templates/'.$configKey.'/Provider.php')) {
                            include_once $fileProcess;
                            if (function_exists('sc_template_install')) {
                                sc_template_install();
                            }
                        }

                    } catch(\Throwable $e) {
                        File::deleteDirectory(storage_path('tmp/'.$pathTmp));
                        return redirect()->back()->with('error', $e->getMessage());
                    }

                } else {
                    File::deleteDirectory(storage_path('tmp/'.$pathTmp));
                    return redirect()->back()->with('error', sc_language_render('admin.template.error_check_config'));
                }
            } else {
                return redirect()->back()->with('error', sc_language_render('admin.template.error_unzip'));
            }
        } else {
            return redirect()->back()->with('error', sc_language_render('admin.template.error_upload'));
        }
        return redirect()->route('admin_template.index')->with('success', sc_language_render('admin.template.import_success')); 
    }
}
