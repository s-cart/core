<?php
namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Front\Models\ShopProductProperty;
use Validator;

class AdminProductPropertyController extends RootAdminController
{

    public function __construct()
    {
        parent::__construct();
    }
    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        $data = [
            'title' => trans('product_property.admin.list'),
            'title_action' => '<i class="fa fa-plus" aria-hidden="true"></i> ' . trans('product_property.admin.add_new_title'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => sc_route_admin('admin_product_property.delete'),
            'removeList' => 0, // 1 - Enable function delete list item
            'buttonRefresh' => 0, // 1 - Enable button refresh
            'buttonSort' => 0, // 1 - Enable button sort
            'css' => '', 
            'js' => '',
            'url_action' => sc_route_admin('admin_product_property.create'),
        ];

        $listTh = [
            'id' => trans('product_property.admin.id'),
            'code' => trans('product_property.admin.code'),
            'name' => trans('product_property.admin.name'),
            'action' => trans('product_property.admin.action'),
        ];
        $obj = new ShopProductProperty;
        $obj = $obj->orderBy('id', 'desc');
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'id' => $row['id'],
                'code' => $row['code'] ?? 'N/A',
                'name' => $row['name'] ?? 'N/A',
                'action' => '
                    <a href="' . sc_route_admin('admin_product_property.edit', ['id' => $row['id']]) . '"><span title="' . trans('product_property.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                  <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('product_property.admin.delete') . '" class="btn btn-flat btn-danger"><i class="fas fa-trash-alt"></i></span>
                  ',
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links($this->templatePathAdmin.'component.pagination');
        $data['resultItems'] = trans('product_property.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

        $data['layout'] = 'index';
        return view($this->templatePathAdmin.'screen.product_property')
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
            'name' => 'required',
            'code' => 'required|unique:"'.ShopProductProperty::class.'",code',
        ], [
            'name.required' => trans('validation.required'),
        ]);

        if ($validator->fails()) {
            // dd($validator->messages());
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $data['code'] = sc_word_format_url($data['code']);
        $data['code'] = sc_word_limit($data['code'], 100);
        $dataInsert = [
            'code' => $data['code'],
            'name' => $data['name'],
        ];
        $obj = ShopProductProperty::create($dataInsert);
//
        return redirect()->route('admin_product_property.edit', ['id' => $obj['id']])->with('success', trans('product_property.admin.create_success'));

    }

/**
 * Form edit
 */
public function edit($id)
{
    $product_property = ShopProductProperty::find($id);
    if(!$product_property) {
        return 'No data';
    }
    $data = [
        'title' => trans('product_property.admin.list'),
        'title_action' => '<i class="fa fa-edit" aria-hidden="true"></i> ' . trans('product_property.admin.edit'),
        'subTitle' => '',
        'icon' => 'fa fa-indent',
        'urlDeleteItem' => sc_route_admin('admin_product_property.delete'),
        'removeList' => 0, // 1 - Enable function delete list item
        'buttonRefresh' => 0, // 1 - Enable button refresh
        'buttonSort' => 0, // 1 - Enable button sort
        'css' => '', 
        'js' => '',
        'url_action' => sc_route_admin('admin_product_property.edit', ['id' => $product_property['id']]),
        'product_property' => $product_property,
        'id' => $id,
    ];

    $listTh = [
        'id' => trans('product_property.admin.id'),
        'code' => trans('product_property.admin.code'),
        'name' => trans('product_property.admin.name'),
        'action' => trans('product_property.admin.action'),
    ];
    $obj = new ShopProductProperty;
    $obj = $obj->orderBy('id', 'desc');
    $dataTmp = $obj->paginate(20);

    $dataTr = [];
    foreach ($dataTmp as $key => $row) {
        $dataTr[] = [
            'id' => $row['id'],
            'code' => $row['code'] ?? 'N/A',
            'name' => $row['name'] ?? 'N/A',
            'action' => '
                <a href="' . sc_route_admin('admin_product_property.edit', ['id' => $row['id']]) . '"><span title="' . trans('product_property.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

              <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('product_property.admin.delete') . '" class="btn btn-flat btn-danger"><i class="fas fa-trash-alt"></i></span>
              ',
        ];
    }

    $data['listTh'] = $listTh;
    $data['dataTr'] = $dataTr;
    $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links($this->templatePathAdmin.'component.pagination');
    $data['resultItems'] = trans('product_property.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

    $data['layout'] = 'edit';
    return view($this->templatePathAdmin.'screen.product_property')
        ->with($data);
}

/**
 * update status
 */
    public function postEdit($id)
    {
        $data = request()->all();
        $dataOrigin = request()->all();
        $obj = ShopProductProperty::find($id);
        $validator = Validator::make($dataOrigin, [
            'code' => 'required|unique:"'.ShopProductProperty::class.'",code,' . $obj->id . ',id',
            'name' => 'required',
        ], [
            'name.required' => trans('validation.required'),
        ]);

        if ($validator->fails()) {
            // dd($validator->messages());
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        //Edit
        $data['code'] = sc_word_format_url($data['code']);
        $data['code'] = sc_word_limit($data['code'], 100);
        $dataUpdate = [
            'code' => $data['code'],
            'name' => $data['name'],
        ];
        $obj->update($dataUpdate);
//
        return redirect()->back()->with('success', trans('product_property.admin.edit_success'));

    }

/*
    Delete list item
    Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => trans('admin.method_not_allow')]);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            ShopProductProperty::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

}
