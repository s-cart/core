<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Front\Models\ShopStoreCss;

class AdminStoreCssController extends RootAdminController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Form edit
     */
    public function index()
    {
        $id = session('adminStoreId');;
        $cssContent = ShopStoreCss::where('store_id', $id)->first();
        if (!$cssContent) {
            return 'no data';
        }
        $data = [
            'title' => trans('store.css'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-edit',
            'css' => $cssContent->css,
            'url_action' => sc_route_admin('admin_store_css.index'),
        ];
        return view($this->templatePathAdmin.'screen.store_css')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit()
    {
        $id = session('adminStoreId');;
        $cssContent = ShopStoreCss::where('store_id', $id)->first();
        $cssContent->css = request('css');
        $cssContent->save();
        return redirect()->route('admin_store_css.index')->with('success', trans('store_maintain.admin.edit_success'));

    }
}
