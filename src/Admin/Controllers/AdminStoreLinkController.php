<?php
namespace SCart\Core\Admin\Controllers;

use SCart\Core\Admin\Controllers\RootAdminController;
use SCart\Core\Admin\Models\AdminLink;
use Validator;

class AdminStoreLinkController extends RootAdminController
{
    protected $arrTarget;

    public function __construct()
    {
        parent::__construct();
        $this->arrTarget = ['_blank' => '_blank', '_self' => '_self'];
    }

    public function arrGroup()
    {
        return   [
            'menu' => sc_language_render('admin.link_position.menu'),
            'menu_left' => sc_language_render('admin.link_position.menu_left'),
            'menu_right' => sc_language_render('admin.link_position.menu_right'),
            'footer' => sc_language_render('admin.link_position.footer'),
            'footer_right' => sc_language_render('admin.link_position.footer_right'),
            'footer_left' => sc_language_render('admin.link_position.footer_left'),
            'sidebar' => sc_language_render('admin.link_position.sidebar'),
        ];
    }
    public function index()
    {
        $data = [
            'title' => sc_language_render('admin.link.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => sc_route_admin('admin_store_link.delete'),
            'removeList' => 0, // 1 - Enable function delete list item
            'buttonRefresh' => 1, // 1 - Enable button refresh
            'buttonSort' => 0, // 1 - Enable button sort
            'css' => '',
            'js' => '',
        ];
        //Process add content
        $data['menuRight'] = sc_config_group('menuRight', \Request::route()->getName());
        $data['menuLeft'] = sc_config_group('menuLeft', \Request::route()->getName());
        $data['topMenuRight'] = sc_config_group('topMenuRight', \Request::route()->getName());
        $data['topMenuLeft'] = sc_config_group('topMenuLeft', \Request::route()->getName());
        $data['blockBottom'] = sc_config_group('blockBottom', \Request::route()->getName());

        $listTh = [
            'name' => sc_language_render('admin.link.name'),
            'url' => sc_language_render('admin.link.url'),
            'target' => sc_language_render('admin.link.target'),
            'group' => sc_language_render('admin.link.group'),
            'sort' => sc_language_render('admin.link.sort'),
            'status' => sc_language_render('admin.link.status'),
        ];

        if (sc_check_multi_shop_installed() && session('adminStoreId') == SC_ID_ROOT) {
            // Only show store info if store is root
            $listTh['shop_store'] = sc_language_render('front.store_list');
        }
        $listTh['action'] = sc_language_render('action.title');

        $dataTmp = AdminLink::getLinkListAdmin();

        if (sc_check_multi_shop_installed() && session('adminStoreId') == SC_ID_ROOT) {
            $arrId = $dataTmp->pluck('id')->toArray();
            // Only show store info if store is root

            if (function_exists('sc_get_list_store_of_link')) {
                $dataStores = sc_get_list_store_of_link($arrId);
            } else {
                $dataStores = [];
            }
        }

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataMap = [
                'name' => sc_language_render($row['name']),
                'url' => $row['url'],
                'target' => $this->arrTarget[$row['target']] ?? '',
                'group' => $this->arrGroup()[$row['group']] ?? '',
                'sort' => $row['sort'],
                'status' => $row['status'] ? '<span class="badge badge-success">ON</span>' : '<span class="badge badge-danger">OFF</span>',
            ];

            if (sc_check_multi_shop_installed() && session('adminStoreId') == SC_ID_ROOT) {
                // Only show store info if store is root
                if (!empty($dataStores[$row['id']])) {
                    $storeTmp = $dataStores[$row['id']]->pluck('code', 'id')->toArray();
                    $storeTmp = array_map(function ($code) {
                        return '<a target=_new href="'.sc_get_domain_from_code($code).'">'.$code.'</a>';
                    }, $storeTmp);
                    $dataMap['shop_store'] = '<i class="nav-icon fab fa-shopify"></i> '.implode('<br><i class="nav-icon fab fa-shopify"></i> ', $storeTmp);
                } else {
                    $dataMap['shop_store'] = '';
                }
            }
            $dataMap['action'] = '<a href="' . sc_route_admin('admin_store_link.edit', ['id' => $row['id'] ? $row['id'] : 'not-found-id']) . '"><span title="' . sc_language_render('action.edit') . '" type="button" class="btn btn-flat btn-sm btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;
            <span onclick="deleteItem(\'' . $row['id'] . '\');"  title="' . sc_language_render('action.delete') . '" class="btn btn-flat btn-sm btn-danger"><i class="fas fa-trash-alt"></i></span>
            ';
            $dataTr[$row['id']] = $dataMap;
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links($this->templatePathAdmin.'component.pagination');
        $data['resultItems'] = sc_language_render('admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'total' =>  $dataTmp->total()]);

        //menuRight
        $data['menuRight'][] = '<a href="' . sc_route_admin('admin_store_link.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
                           <i class="fa fa-plus" title="' . sc_language_render('admin.link.add_new') . '"></i>
                           </a>';
        //=menuRight

        return view($this->templatePathAdmin.'screen.list')
            ->with($data);
    }

    /**
     * Form create new item in admin
     * @return [type] [description]
     */
    public function create()
    {
        $data = [
            'title'             => sc_language_render('admin.link.add_new_title'),
            'subTitle'          => '',
            'title_description' => sc_language_render('admin.link.add_new_des'),
            'icon'              => 'fa fa-plus',
            'link'              => [],
            'arrTarget'         => $this->arrTarget,
            'arrGroup'          => $this->arrGroup(),
            'url_action'        => sc_route_admin('admin_store_link.create'),
        ];
        return view($this->templatePathAdmin.'screen.store_link')
            ->with($data);
    }

    /**
     * Post create new item in admin
     * @return [type] [description]
     */
    public function postCreate()
    {
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'name'   => 'required',
            'url'    => 'required',
            'group'  => 'required',
            'target' => 'required',
        ]);

        if ($validator->fails()) {
            // dd($validator->messages());
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $dataInsert = [
            'name'     => $data['name'],
            'url'      => $data['url'],
            'target'   => $data['target'],
            'group'    => $data['group'],
            'sort'     => $data['sort'],
            'status'   => empty($data['status']) ? 0 : 1,
        ];
        $dataInsert = sc_clean($dataInsert, [], true);
        $link = AdminLink::createLinkAdmin($dataInsert);

        $shopStore        = $data['shop_store'] ?? [session('adminStoreId')];
        $link->stores()->detach();
        if ($shopStore) {
            $link->stores()->attach($shopStore);
        }

        return redirect()->route('admin_store_link.index')->with('success', sc_language_render('action.create_success'));
    }

    /**
     * Form edit
     */
    public function edit($id)
    {
        $link = AdminLink::getLinkAdmin($id);
        if (!$link) {
            return redirect()->route('admin.data_not_found')->with(['url' => url()->full()]);
        }
        $data = [
            'title' => sc_language_render('action.edit'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-edit',
            'link' => $link,
            'arrTarget' => $this->arrTarget,
            'arrGroup' => $this->arrGroup(),
            'url_action' => sc_route_admin('admin_store_link.edit', ['id' => $link['id']]),
        ];
        return view($this->templatePathAdmin.'screen.store_link')
            ->with($data);
    }

    /**
     * update status
     */
    public function postEdit($id)
    {
        $link = AdminLink::getLinkAdmin($id);
        if (!$link) {
            return redirect()->route('admin.data_not_found')->with(['url' => url()->full()]);
        }
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'name'   => 'required',
            'url'    => 'required',
            'group'  => 'required',
            'target' => 'required',
        ]);

        if ($validator->fails()) {
            // dd($validator->messages());
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        //Edit
        $dataUpdate = [
            'name'     => $data['name'],
            'url'      => $data['url'],
            'target'   => $data['target'],
            'group'    => $data['group'],
            'sort'     => $data['sort'],
            'status'   => empty($data['status']) ? 0 : 1,
        ];
        $dataUpdate = sc_clean($dataUpdate, [], true);
        $link->update($dataUpdate);

        $shopStore        = $data['shop_store'] ?? [session('adminStoreId')];
        $link->stores()->detach();
        if ($shopStore) {
            $link->stores()->attach($shopStore);
        }

        return redirect()->route('admin_store_link.index')->with('success', sc_language_render('action.edit_success'));
    }

    /*
    Delete list item
    Need mothod destroy to boot deleting in model
    */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => sc_language_render('admin.method_not_allow')]);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            $arrDontPermission = [];
            foreach ($arrID as $key => $id) {
                if (!$this->checkPermisisonItem($id)) {
                    $arrDontPermission[] = $id;
                }
            }
            if (count($arrDontPermission)) {
                return response()->json(['error' => 1, 'msg' => sc_language_render('admin.remove_dont_permisison') . ': ' . json_encode($arrDontPermission)]);
            }
            AdminLink::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

    /**
     * Check permisison item
     */
    public function checkPermisisonItem($id)
    {
        return AdminLink::getLinkAdmin($id);
    }
}
