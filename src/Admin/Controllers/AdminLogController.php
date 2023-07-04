<?php
namespace SCart\Core\Admin\Controllers;

use SCart\Core\Admin\Models\AdminLog;
use SCart\Core\Admin\Models\AdminUser;
use SCart\Core\Admin\Controllers\RootAdminController;

class AdminLogController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function index()
    {
        $data = [
            'title' => sc_language_render('admin.log.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => sc_route_admin('admin_log.delete'),
            'removeList' => 1, // 1 - Enable function delete list item
            'buttonRefresh' => 1, // 1 - Enable button refresh
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
            'id' => 'ID',
            'user' => sc_language_render('admin.log.user'),
            'method' => sc_language_render('admin.log.method'),
            'path' => sc_language_render('admin.log.path'),
            'ip' => sc_language_render('admin.log.ip'),
            'user_agent' => sc_language_render('admin.log.user_agent'),
            'input' => sc_language_render('admin.log.input'),
            'created_at' => sc_language_render('admin.log.created_at'),
            'action' => sc_language_render('action.title'),
        ];

        $keyword     = sc_clean(request('keyword') ?? '');
        $sort_order = sc_clean(request('sort_order') ?? 'id_desc');
        $arrSort = [
            'id__desc' => sc_language_render('filter_sort.id_desc'),
            'id__asc' => sc_language_render('filter_sort.id_asc'),
            'user_id__desc' => sc_language_render('filter_sort.value_desc', ['value' => 'ID']),
            'user_id__asc' => sc_language_render('filter_sort.value_asc', ['value' => 'ID']),
            'path__desc' => sc_language_render('filter_sort.alpha_desc', ['alpha' => 'path']),
            'path__asc' => sc_language_render('filter_sort.alpha_asc', ['alpha' => 'path']),
            'user_agent__desc' => sc_language_render('filter_sort.alpha_desc', ['alpha' => 'User agent']),
            'user_agent__asc' => sc_language_render('filter_sort.alpha_asc', ['alpha' => 'User agent']),
            'method__desc' => sc_language_render('filter_sort.alpha_desc', ['alpha' => 'Method']),
            'method__asc' => sc_language_render('filter_sort.alpha_asc', ['alpha' => 'Method']),
            'ip__desc' => sc_language_render('filter_sort.alpha_desc', ['alpha' => 'Ip']),
            'ip__asc' => sc_language_render('filter_sort.alpha_asc', ['alpha' => 'Ip']),

        ];
        $obj = new AdminLog;
        if ($keyword) {
            $obj = $obj->where(function ($query) use($keyword){
                $query->where('ip', $keyword)
                      ->orWhere('path', $keyword);
            });
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);
        } else {
            $obj = $obj->orderBy('id', 'desc');
        }
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[$row['id']] = [
                'id' => $row['id'],
                'user_id' => ($user = AdminUser::find($row['user_id'])) ? $user->name : 'N/A',
                'method' => '<span class="badge bg-' . (AdminLog::$methodColors[$row['method']] ?? '') . '">' . $row['method'] . '</span>',
                'path' => '<code>' . $row['path'] . '</code>',
                'ip' => $row['ip'],
                'user_agent' => $row['user_agent'],
                'input' => htmlspecialchars($row['input']),
                'created_at' => $row['created_at'],
                'action' => '
                  <span  onclick="deleteItem(\'' . $row['id'] . '\');"  title="' . sc_language_render('action.delete') . '" class="btn btn-flat btn-sm btn-danger"><i class="fas fa-trash-alt"></i></span>
                  ',
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links($this->templatePathAdmin.'component.pagination');
        $data['resultItems'] = sc_language_render('admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'total' =>  $dataTmp->total()]);

        //menuSearch
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }
        //=menuSort

        //topMenuRight
        $data['topMenuRight'][] ='
                <form action="' . sc_route_admin('admin_log.index') . '" id="button_search">
                <div class="input-group input-group float-left">
                    <select class="form-control rounded-0 select2" name="sort_order" id="sort_order">
                    '.$optionSort.'
                    </select> &nbsp;
                    <input type="text" name="keyword" class="form-control rounded-0 float-right" placeholder="Search: IP,Path,Name" value="' . $keyword . '">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                </form>';
        //=topMenuRight

        return view($this->templatePathAdmin.'screen.list')
            ->with($data);
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
            AdminLog::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }
}
