<?php
namespace SCart\Core\Admin\Controllers;

use SCart\Core\Admin\Controllers\RootAdminController;
use Validator;
use SCart\Core\Admin\Models\AdminNotice;
class AdminNoticeController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = [
            'title'         => sc_language_render('admin_notice.title'),
            'subTitle'      => '',
            'icon'          => 'fa fa-indent',
            'urlDeleteItem' => '',
            'removeList'    => 0, // 1 - Enable function delete list item
            'buttonRefresh' => 0, // 1 - Enable button refresh
            'css'           => '',
            'js'            => '',
        ];
        //Process add content
        $data['menuRight']    = sc_config_group('menuRight', \Request::route()->getName());
        $data['menuLeft']     = sc_config_group('menuLeft', \Request::route()->getName());
        $data['topMenuRight'] = sc_config_group('topMenuRight', \Request::route()->getName());
        $data['topMenuLeft']  = sc_config_group('topMenuLeft', \Request::route()->getName());
        $data['blockBottom']  = sc_config_group('blockBottom', \Request::route()->getName());

        $listTh = [
            'type'    => 'Type',
            'type_id' => 'Type ID',
            'content' => 'Content',
            'date'    => sc_language_render('admin.created_at')
        ];
        $dataTmp = (new AdminNotice)->getNoticeListAdmin();

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataMap = [
                'type' => '<a class="notice-'.(($row->status) ? 'read':'unread').'" href="'.sc_route_admin('admin_notice.url',['type' => $row->type,'typeId' => $row->type_id]).'">'.$row->type.'</a>',
                'type_id' => $row->type_id,
                'content' => sc_language_render($row->content),
                'date' => $row->created_at,
            ];
            $dataTr[$row['id']] = $dataMap;
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links($this->templatePathAdmin.'component.pagination');
        $data['resultItems'] = sc_language_render('admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'total' =>  $dataTmp->total()]);

        return view($this->templatePathAdmin.'screen.list')
            ->with($data);
    }

    /**
     * [markRead description]
     *
     * @return  [type]  [return description]
     */
    public function markRead() {
        (new AdminNotice)->where('admin_id', admin()->user()->id)->update(['status' => 1]);
        return redirect()->back();
    }

    public function url(string $type, string $typeId) {
        (new AdminNotice)
        ->where('admin_id', admin()->user()->id)
        ->where('type', $type)
        ->where('type_id', $typeId)
        ->update(['status' => 1]);
        if ((in_array($type, ['sc_order_created', 'sc_order_success', 'sc_order_update_status']))) {
            return redirect(sc_route_admin('admin_order.detail', ['id' => $typeId]));
        }
        if ((in_array($type, ['sc_customer_created']))) {
            return redirect(sc_route_admin('admin_customer.edit', ['id' => $typeId]));
        }
    }
}
