<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\Controller;

class RootAdminController extends Controller
{
    public $templatePathAdmin;
    public function __construct()
    {
        $this->templatePathAdmin = config('admin.path_view');
    }

}
