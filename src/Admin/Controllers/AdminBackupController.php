<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use Illuminate\Support\Facades\Artisan;

class AdminBackupController extends RootAdminController
{

    public function __construct()
    {
        parent::__construct();
    }
    
    public function index()
    {
        $download = request('download') ?? '';
        if ($download) {
            $file = storage_path() . "/backups/" . $download;
            if (file_exists($file)) {
                $headers = array(
                    'Content-Type' => 'application/octet-stream',
                );
                return response()->download($file, '', $headers);
            }
        }
        $arrFiles = [];
        foreach (glob(storage_path() . "/backups/*.sql") as $file) {
            if (file_exists($file)) {
                $fileInfo         = [];
                $fileInfo['path'] = $file;
                $arr              = explode('/', $file);
                $fileInfo['name'] = end($arr);
                $fileInfo['size'] = number_format(filesize($file) / 1048576, 2) . 'MB';
                $fileInfo['time'] = date('Y-m-d H:i:s', filemtime($file));
                $arrFiles[]       = $fileInfo;
            }
        }
        rsort($arrFiles);
        return view($this->templatePathAdmin.'screen.backup')->with(
            [
                "title"    => trans('backup.title'),
                "arrFiles" => $arrFiles,
            ])->render();
    }

    public function processBackupFile()
    {
        $file     = request('file');
        $action   = request('action');
        $pathFull = storage_path() . "/backups/" . $file;
        $return   = ['error' => '', 'msg' => ''];
        if ($action === 'remove') {
            try {
                unlink($pathFull);
                $return = ['error' => 0, 'msg' => trans('backup.remove_success')];
            } catch (\Throwable $e) {
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else if ($action === 'restore') {
            try {
                $return = Artisan::call("sc:restore --path=".$file);
            } catch (\Throwable $e) {
                sc_report($e->getMessage());
                $return = json_encode(['error' => 1, 'msg' => $e->getMessage()]);
            }
        }

        return $return;
    }

    public function generateBackup()
    {
        $return = Artisan::call("sc:backup");
        return $return;
    }

}
