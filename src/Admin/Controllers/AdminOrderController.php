<?php
namespace SCart\Core\Admin\Controllers;

use SCart\Core\Admin\Admin;
use App\Http\Controllers\RootAdminController;
use SCart\Core\Front\Models\ShopAttributeGroup;
use SCart\Core\Front\Models\ShopCountry;
use SCart\Core\Front\Models\ShopCurrency;
use SCart\Core\Front\Models\ShopOrderDetail;
use SCart\Core\Front\Models\ShopOrderStatus;
use SCart\Core\Front\Models\ShopPaymentStatus;
use SCart\Core\Front\Models\ShopShippingStatus;
use SCart\Core\Admin\Models\AdminCustomer;
use SCart\Core\Admin\Models\AdminOrder;
use SCart\Core\Admin\Models\AdminProduct;
use Validator;

class AdminOrderController extends RootAdminController
{
    public $statusPayment, 
    $statusOrder, 
    $statusShipping, 
    $statusOrderMap, 
    $statusShippingMap, 
    $statusPaymentMap, 
    $currency, 
    $country, 
    $countryMap;

    public function __construct()
    {
        parent::__construct();
        $this->statusOrder    = ShopOrderStatus::getIdAll();
        $this->currency       = ShopCurrency::getListActive();
        $this->country        = ShopCountry::getCodeAll();
        $this->statusPayment  = ShopPaymentStatus::getIdAll();
        $this->statusShipping = ShopShippingStatus::getIdAll();

    }

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {

        $data = [
            'title'         => trans('order.admin.list'),
            'subTitle'      => '',
            'icon'          => 'fa fa-indent',
            'urlDeleteItem' => sc_route_admin('admin_order.delete'),
            'removeList'    => 1, // 1 - Enable function delete list item
            'buttonRefresh' => 1, // 1 - Enable button refresh
            'buttonSort'    => 1, // 1 - Enable button sort
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
            'id'             => trans('order.admin.id'),
            'email'          => trans('order.admin.email'),
            'subtotal'       => trans('order.admin.subtotal'),
            'shipping'       => trans('order.admin.shipping'),
            'discount'       => trans('order.admin.discount'),
            'total'          => trans('order.admin.total'),
            'payment_method' => trans('order.admin.payment_method_short'),
            'currency'       => trans('order.admin.currency'),
            'status'         => trans('order.admin.status'),
            'created_at'     => trans('order.admin.created_at'),
            'action'         => trans('order.admin.action'),
        ];
        $sort_order   = sc_clean(request('sort_order') ?? 'id_desc');
        $keyword      = sc_clean(request('keyword') ?? '');
        $email        = sc_clean(request('email') ?? '');
        $from_to      = sc_clean(request('from_to') ?? '');
        $end_to       = sc_clean(request('end_to') ?? '');
        $order_status = sc_clean(request('order_status') ?? '');
        $arrSort = [
            'id__desc'         => trans('order.admin.sort_order.id_desc'),
            'id__asc'          => trans('order.admin.sort_order.id_asc'),
            'email__desc'      => trans('order.admin.sort_order.email_desc'),
            'email__asc'       => trans('order.admin.sort_order.email_asc'),
            'created_at__desc' => trans('order.admin.sort_order.date_desc'),
            'created_at__asc'  => trans('order.admin.sort_order.date_asc'),
        ];
        $dataSearch = [
            'keyword'      => $keyword,
            'email'        => $email,
            'from_to'      => $from_to,
            'end_to'       => $end_to,
            'sort_order'   => $sort_order,
            'arrSort'      => $arrSort,
            'order_status' => $order_status,
        ];
        $dataTmp = (new AdminOrder)->getOrderListAdmin($dataSearch);

        $styleStatus = $this->statusOrder;
        array_walk($styleStatus, function (&$v, $k) {
            $v = '<span class="badge badge-' . (AdminOrder::$mapStyleStatus[$k] ?? 'light') . '">' . $v . '</span>';
        });
        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'id'             => $row['id'],
                'email'          => $row['email'] ?? 'N/A',
                'subtotal'       => sc_currency_render_symbol($row['subtotal'] ?? 0, $row['currency']),
                'shipping'       => sc_currency_render_symbol($row['shipping'] ?? 0, $row['currency']),
                'discount'       => sc_currency_render_symbol($row['discount'] ?? 0, $row['currency']),
                'total'          => sc_currency_render_symbol($row['total'] ?? 0, $row['currency']),
                'payment_method' => $row['payment_method'],
                'currency'       => $row['currency'] . '/' . $row['exchange_rate'],
                'status'         => $styleStatus[$row['status']],
                'created_at'     => $row['created_at'],
                'action'         => '
                                <a href="' . sc_route_admin('admin_order.detail', ['id' => $row['id']]) . '">
                                 <span title="' . trans('order.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span>
                                </a>&nbsp;
                                <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fas fa-trash-alt"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links($this->templatePathAdmin.'component.pagination');
        $data['resultItems'] = trans('order.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);


        //menuRight
        $data['menuRight'][] = '<a href="' . sc_route_admin('admin_order.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
                           <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
                           </a>';
        //=menuRight

        //menuSort        
        $optionSort = '';
        foreach ($arrSort as $key => $sort) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $sort . '</option>';
        }
        $data['optionSort'] = $optionSort;
        $data['urlSort'] = sc_route_admin('admin_order.index', request()->except(['_token', '_pjax', 'sort_order']));
        //=menuSort

        //menuSearch        
        $optionStatus = '';
        foreach ($this->statusOrder as $key => $status) {
            $optionStatus .= '<option  ' . (($order_status == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }
        $data['topMenuRight'][] = '
                <form action="' . sc_route_admin('admin_order.index') . '" id="button_search">
                    <div class="input-group float-left">
                        <input type="date" style="width: 120px;" name="from_to" id="from_to" class="form-control input-sm date_time rounded-0" placeholder="" /> &nbsp; 
                        <label>To</label> &nbsp;
                        <input type="date" style="width: 120px;" name="end_to" class="form-control input-sm date_time rounded-0" placeholder="" /> &nbsp;
                        <div class="btn-group">
                            <select class="form-control rounded-0" name="order_status">
                            <option value="">'.trans('order.admin.search_order_status').'</option>
                            ' . $optionStatus . '
                            </select>
                        </div> &nbsp;
                        <input type="text" name="email" class="form-control rounded-0 float-right" placeholder="' . trans('order.admin.search_email') . '" value="' . $email . '"> &nbsp;
                        <input type="text" name="keyword" class="form-control rounded-0 float-right" placeholder="' . trans('order.admin.search_id') . '" value="' . $keyword . '">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>';
    //=menuSearch


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
            'title'             => trans('order.admin.add_new_title'),
            'subTitle'          => '',
            'title_description' => trans('order.admin.add_new_des'),
            'icon'              => 'fa fa-plus',
        ];
        $paymentMethodTmp = sc_get_plugin_installed('payment', $onlyActive = false);
        foreach ($paymentMethodTmp as $key => $value) {
            $paymentMethod[$key] = sc_language_render($value->detail);
        }
        $shippingMethodTmp = sc_get_plugin_installed('shipping', $onlyActive = false);
        foreach ($shippingMethodTmp as $key => $value) {
            $shippingMethod[$key] = trans($value->detail);
        }
        $orderStatus            = $this->statusOrder;
        $currencies             = $this->currency;
        $countries              = $this->country;
        $currenciesRate         = json_encode(ShopCurrency::getListRate());
        $users                  = AdminCustomer::getListAll();
        $data['users']          = $users;
        $data['currencies']     = $currencies;
        $data['countries']      = $countries;
        $data['orderStatus']    = $orderStatus;
        $data['currenciesRate'] = $currenciesRate;
        $data['paymentMethod']  = $paymentMethod;
        $data['shippingMethod'] = $shippingMethod;

        return view($this->templatePathAdmin.'screen.order_add')
            ->with($data);
    }

    /**
     * Post create new item in admin
     * @return [type] [description]
     */
    public function postCreate()
    {
        $users = AdminCustomer::getListAll();
        $data = request()->all();
        $validate = [
            'first_name'      => 'required|max:100',
            'address1'        => 'required|max:100',
            'exchange_rate'   => 'required',
            'currency'        => 'required',
            'status'          => 'required',
            'payment_method'  => 'required',
            'shipping_method' => 'required',
        ];
        if(sc_config_admin('customer_lastname')) {
            $validate['last_name'] = 'required|max:100';
        }
        if(sc_config_admin('customer_address2')) {
            $validate['address2'] = 'required|max:100';
        }
        if(sc_config_admin('customer_phone')) {
            $validate['phone'] = 'required|regex:/^0[^0][0-9\-]{7,13}$/';
        }
        if(sc_config_admin('customer_country')) {
            $validate['country'] = 'required|min:2';
        }
        if(sc_config_admin('customer_postcode')) {
            $validate['postcode'] = 'required|min:5';
        }
        if(sc_config_admin('customer_company')) {
            $validate['company'] = 'required|min:3';
        }
        $messages = [
            'last_name.required'       => trans('validation.required',['attribute'=> trans('cart.last_name')]),
            'first_name.required'      => trans('validation.required',['attribute'=> trans('cart.first_name')]),
            'email.required'           => trans('validation.required',['attribute'=> trans('cart.email')]),
            'address1.required'        => trans('validation.required',['attribute'=> trans('cart.address1')]),
            'address2.required'        => trans('validation.required',['attribute'=> trans('cart.address2')]),
            'phone.required'           => trans('validation.required',['attribute'=> trans('cart.phone')]),
            'country.required'         => trans('validation.required',['attribute'=> trans('cart.country')]),
            'postcode.required'        => trans('validation.required',['attribute'=> trans('cart.postcode')]),
            'company.required'         => trans('validation.required',['attribute'=> trans('cart.company')]),
            'sex.required'             => trans('validation.required',['attribute'=> trans('cart.sex')]),
            'birthday.required'        => trans('validation.required',['attribute'=> trans('cart.birthday')]),
            'email.email'              => trans('validation.email',['attribute'=> trans('cart.email')]),
            'phone.regex'              => trans('validation.regex',['attribute'=> trans('cart.phone')]),
            'postcode.min'             => trans('validation.min',['attribute'=> trans('cart.postcode')]),
            'country.min'              => trans('validation.min',['attribute'=> trans('cart.country')]),
            'first_name.max'           => trans('validation.max',['attribute'=> trans('cart.first_name')]),
            'email.max'                => trans('validation.max',['attribute'=> trans('cart.email')]),
            'address1.max'             => trans('validation.max',['attribute'=> trans('cart.address1')]),
            'address2.max'             => trans('validation.max',['attribute'=> trans('cart.address2')]),
            'last_name.max'            => trans('validation.max',['attribute'=> trans('cart.last_name')]),
            'birthday.date'            => trans('validation.date',['attribute'=> trans('cart.birthday')]),
            'birthday.date_format'     => trans('validation.date_format',['attribute'=> trans('cart.birthday')]),
            'shipping_method.required' => trans('cart.validation.shippingMethod_required'),
            'payment_method.required'  => trans('cart.validation.paymentMethod_required'),
        ];


        $validator = Validator::make($data, $validate, $messages);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        //Create new order
        $dataInsert = [
            'customer_id'         => $data['customer_id'],
            'first_name'      => $data['first_name'],
            'last_name'       => $data['last_name'] ?? '',
            'status'          => $data['status'],
            'currency'        => $data['currency'],
            'address1'        => $data['address1'],
            'address2'        => $data['address2'] ?? '',
            'country'         => $data['country'] ?? '',
            'company'         => $data['company'] ?? '',
            'postcode'        => $data['postcode'] ?? '',
            'phone'           => $data['phone'] ?? '',
            'payment_method'  => $data['payment_method'],
            'shipping_method' => $data['shipping_method'],
            'exchange_rate'   => $data['exchange_rate'],
            'email'           => $users[$data['customer_id']]['email'],
            'comment'         => $data['comment'],
        ];
        $order = AdminOrder::create($dataInsert);
        AdminOrder::insertOrderTotal([
            ['code' => 'subtotal', 'value' => 0, 'title' => 'Subtotal', 'sort' => 1, 'order_id' => $order->id],
            ['code' => 'tax', 'value' => 0, 'title' => 'Tax', 'sort' => 2, 'order_id' => $order->id],
            ['code' => 'shipping', 'value' => 0, 'title' => 'Shipping', 'sort' => 10, 'order_id' => $order->id],
            ['code' => 'discount', 'value' => 0, 'title' => 'Discount', 'sort' => 20, 'order_id' => $order->id],
            ['code' => 'total', 'value' => 0, 'title' => 'Total', 'sort' => 100, 'order_id' => $order->id],
            ['code' => 'received', 'value' => 0, 'title' => 'Received', 'sort' => 200, 'order_id' => $order->id],
        ]);
        //
        return redirect()->route('admin_order.index')->with('success', trans('order.admin.create_success'));

    }

    /**
     * Order detail
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function detail($id)
    {
        $order = AdminOrder::getOrderAdmin($id);

        if (!$order) {
            return redirect()->route('admin.data_not_found')->with(['url' => url()->full()]);
        }
        $products = (new AdminProduct)->getProductSelectAdmin(['kind' => ['0', '1']]);
        $paymentMethodTmp = sc_get_plugin_installed('payment', $onlyActive = false);
        foreach ($paymentMethodTmp as $key => $value) {
            $paymentMethod[$key] = sc_language_render($value->detail);
        }
        $shippingMethodTmp = sc_get_plugin_installed('shipping', $onlyActive = false);
        foreach ($shippingMethodTmp as $key => $value) {
            $shippingMethod[$key] = sc_language_render($value->detail);
        }
        return view($this->templatePathAdmin.'screen.order_edit')->with(
            [
                "title" => trans('order.order_detail'),
                "subTitle" => '',
                'icon' => 'fa fa-file-text-o',
                "order" => $order,
                "products" => $products,
                "statusOrder" => $this->statusOrder,
                "statusPayment" => $this->statusPayment,
                "statusShipping" => $this->statusShipping,
                'dataTotal' => AdminOrder::getOrderTotal($id),
                'attributesGroup' => ShopAttributeGroup::pluck('name', 'id')->all(),
                'paymentMethod' => $paymentMethod,
                'shippingMethod' => $shippingMethod,
                'country' => $this->country,
            ]);
    }

    /**
     * [getInfoUser description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function getInfoUser()
    {
        $id = request('id');
        return AdminCustomer::getCustomerAdminJson($id);
    }

    /**
     * [getInfoProduct description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function getInfoProduct()
    {
        $id = request('id');
        $orderId = request('order_id');
        $oder = AdminOrder::getOrderAdmin($orderId);
        $product = AdminProduct::getProductAdmin($id);
        if (!$product) {
            return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => '#product:'.$id]), 'detail' => '']);
        }
        $arrayReturn = $product->toArray();
        $arrayReturn['renderAttDetails'] = $product->renderAttributeDetailsAdmin($oder->currency, $oder->exchange_rate);
        $arrayReturn['price_final'] = $product->getFinalPrice();
        return response()->json($arrayReturn);
    }

    /**
     * process update order
     * @return [json]           [description]
     */
    public function postOrderUpdate()
    {
        $id = request('pk');
        $code = request('name');
        $value = request('value');
        if ($code == 'shipping' || $code == 'discount' || $code == 'received') {
            $orderTotalOrigin = AdminOrder::getRowOrderTotal($id);
            $orderId = $orderTotalOrigin->orderId;
            $oldValue = $orderTotalOrigin->value;
            $order = AdminOrder::getOrderAdmin($orderId);
            if (!$order) {
                return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => 'order#'.$orderId]), 'detail' => '']);
            }
            $dataRowTotal = [
                'id' => $id,
                'code' => $code,
                'value' => $value,
                'text' => sc_currency_render_symbol($value, $order->currency),
            ];
            AdminOrder::updateRowOrderTotal($dataRowTotal);
        } else {
            $orderId = $id;
            $order = AdminOrder::getOrderAdmin($orderId);
            if (!$order) {
                return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => 'order#'.$orderId]), 'detail' => '']);
            }
            $oldValue = $order->{$code};
            $order->update([$code => $value]);
        }

        //Add history
        $dataHistory = [
            'order_id' => $orderId,
            'content' => 'Change <b>' . $code . '</b> from <span style="color:blue">\'' . $oldValue . '\'</span> to <span style="color:red">\'' . $value . '\'</span>',
            'admin_id' => Admin::user()->id,
            'order_status_id' => $order->status,
        ];
        (new AdminOrder)->addOrderHistory($dataHistory);

        $orderUpdated = AdminOrder::getOrderAdmin($orderId);
        if ($orderUpdated->balance == 0 && $orderUpdated->total != 0) {
            $style = 'style="color:#0e9e33;font-weight:bold;"';
        } else
        if ($orderUpdated->balance < 0) {
            $style = 'style="color:#ff2f00;font-weight:bold;"';
        } else {
            $style = 'style="font-weight:bold;"';
        }
        $blance = '<tr ' . $style . ' class="data-balance"><td>' . trans('order.balance') . ':</td><td align="right">' . sc_currency_format($orderUpdated->balance) . '</td></tr>';
        return response()->json(['error' => 0, 'detail' => 
            [
                'total' => sc_currency_format($orderUpdated->total),
                'subtotal' => sc_currency_format($orderUpdated->subtotal),
                'tax' => sc_currency_format($orderUpdated->tax),
                'shipping' => sc_currency_format($orderUpdated->shipping),
                'discount' => sc_currency_format($orderUpdated->discount),
                'received' => sc_currency_format($orderUpdated->received),
                'balance' => $blance,
            ],
            'msg' => trans('order.admin.update_success')
        ]);
    }

    /**
     * [postAddItem description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postAddItem()
    {
        $addIds = request('add_id');
        $add_price = request('add_price');
        $add_qty = request('add_qty');
        $add_att = request('add_att');
        $add_tax = request('add_tax');
        $orderId = request('order_id');
        $items = [];

        $order = AdminOrder::getOrderAdmin($orderId);

        foreach ($addIds as $key => $id) {
            //where exits id and qty > 0
            if ($id && $add_qty[$key]) {
                $product = AdminProduct::getProductAdmin($id);
                if (!$product) {
                    return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => '#'.$id]), 'detail' => '']);
                }
                $pAttr = json_encode($add_att[$id] ?? []);
                $items[] = array(
                    'order_id' => $orderId,
                    'product_id' => $id,
                    'name' => $product->name,
                    'qty' => $add_qty[$key],
                    'price' => $add_price[$key],
                    'total_price' => $add_price[$key] * $add_qty[$key],
                    'sku' => $product->sku,
                    'tax' => $add_tax[$key],
                    'attribute' => $pAttr,
                    'currency' => $order->currency,
                    'exchange_rate' => $order->exchange_rate,
                    'created_at' => date('Y-m-d H:i:s'),
                );
            }
        }
        if ($items) {
            try {
                (new ShopOrderDetail)->addNewDetail($items);
                //Add history
                $dataHistory = [
                    'order_id' => $orderId,
                    'content' => "Add product: <br>" . implode("<br>", array_column($items, 'name')),
                    'admin_id' => Admin::user()->id,
                    'order_status_id' => $order->status,
                ];
                (new AdminOrder)->addOrderHistory($dataHistory);

                AdminOrder::updateSubTotal($orderId);
                
                //end update total price
                return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
            } catch (\Throwable $e) {
                return response()->json(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);
            }

        }
        return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
    }

    /**
     * [postEditItem description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postEditItem()
    {
        try {
            $id = request('pk');
            $field = request('name');
            $value = request('value');
            $item = ShopOrderDetail::find($id);
            $fieldOrg = $item->{$field};
            $orderId = $item->order_id;
            $item->{$field} = $value;
            $item->total_price = $value * (($field == 'qty') ? $item->price : $item->qty);
            $item->save();
            $item = $item->fresh();
            $order = AdminOrder::getOrderAdmin($orderId);
            if (!$order) {
                return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => '#order:'.$orderId]), 'detail' => '']);
            }
            //Add history
            $dataHistory = [
                'order_id' => $orderId,
                'content' => trans('product.edit_product') . ' #' . $id . ': ' . $field . ' from ' . $fieldOrg . ' -> ' . $value,
                'admin_id' => Admin::user()->id,
                'order_status_id' => $order->status,
            ];
            (new AdminOrder)->addOrderHistory($dataHistory);

            //Update stock
            if ($field == 'qty') {
                $checkQty = $value - $fieldOrg;
                //Update stock, sold
                AdminProduct::updateStock($item->product_id, $checkQty);
            }

            //Update total price
            AdminOrder::updateSubTotal($orderId);
            //end update total price

            //fresh order info after update
            $orderUpdated = $order->fresh();

            if ($orderUpdated->balance == 0 && $orderUpdated->total != 0) {
                $style = 'style="color:#0e9e33;font-weight:bold;"';
            } else
            if ($orderUpdated->balance < 0) {
                $style = 'style="color:#ff2f00;font-weight:bold;"';
            } else {
                $style = 'style="font-weight:bold;"';
            }
            $blance = '<tr ' . $style . ' class="data-balance"><td>' . trans('order.balance') . ':</td><td align="right">' . sc_currency_format($orderUpdated->balance) . '</td></tr>';
            $arrayReturn = ['error' => 0, 'detail' => [
                'total'            => sc_currency_format($orderUpdated->total),
                'subtotal'         => sc_currency_format($orderUpdated->subtotal),
                'tax'              => sc_currency_format($orderUpdated->tax),
                'shipping'         => sc_currency_format($orderUpdated->shipping),
                'discount'         => sc_currency_format($orderUpdated->discount),
                'received'         => sc_currency_format($orderUpdated->received),
                'item_total_price' => sc_currency_render_symbol($item->total_price, $item->currency),
                'item_id'          => $id,
                'balance'          => $blance,
            ],'msg' => trans('order.admin.update_success')
            ];
        } catch (\Throwable $e) {
            $arrayReturn = ['error' => 1, 'msg' => $e->getMessage()];
        }
        return response()->json($arrayReturn);
    }

    /**
     * [postDeleteItem description]
     * @param   [description]
     * @return [type]           [description]
     */
    public function postDeleteItem()
    {
        try {
            $data = request()->all();
            $pId = $data['pId'] ?? 0;
            $itemDetail = (new ShopOrderDetail)->where('id', $pId)->first();
            if (!$itemDetail) {
                return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => 'detail#'.$pId]), 'detail' => '']);
            }
            $orderId = $itemDetail->order_id;
            $order = AdminOrder::getOrderAdmin($orderId);
            if (!$order) {
                return response()->json(['error' => 1, 'msg' => trans('admin.data_not_found_detail', ['msg' => 'order#'.$orderId]), 'detail' => '']);
            }

            $pId = $itemDetail->product_id;
            $qty = $itemDetail->qty;
            $itemDetail->delete(); //Remove item from shop order detail
            //Update total price
            AdminOrder::updateSubTotal($orderId);
            //Update stock, sold
            AdminProduct::updateStock($pId, -$qty);

            //Add history
            $dataHistory = [
                'order_id' => $orderId,
                'content' => 'Remove item pID#' . $pId,
                'admin_id' => Admin::user()->id,
                'order_status_id' => $order->status,
            ];
            (new AdminOrder)->addOrderHistory($dataHistory);
            return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
        } catch (\Throwable $e) {
            return response()->json(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);

        }
    }

    /*
    Delete list order ID
    Need mothod destroy to boot deleting in model
    */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => trans('admin.method_not_allow')]);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            $arrDontPermission = [];
            foreach ($arrID as $key => $id) {
                if(!$this->checkPermisisonItem($id)) {
                    $arrDontPermission[] = $id;
                }
            }
            if (count($arrDontPermission)) {
                return response()->json(['error' => 1, 'msg' => trans('admin.remove_dont_permisison') . ': ' . json_encode($arrDontPermission)]);
            } else {
                AdminOrder::destroy($arrID);
                return response()->json(['error' => 0, 'msg' => trans('order.admin.update_success')]);
            }
        }
    }

    /*
    Export order detail order
    */
    public function exportDetail()
    {
        $type = request('type');
        $orderId = request('order_id') ?? 0;
        $order = AdminOrder::getOrderAdmin($orderId);
        if ($order) {
            $data                    = array();
            $data['name']            = $order['first_name'] . ' ' . $order['last_name'];
            $data['address']         = $order['address1'] . ', ' . $order['address2'] . ', ' . $order['country'];
            $data['phone']           = $order['phone'];
            $data['email']           = $order['email'];
            $data['comment']         = $order['comment'];
            $data['payment_method']  = $order['payment_method'];
            $data['shipping_method'] = $order['shipping_method'];
            $data['created_at']      = $order['created_at'];
            $data['currency']        = $order['currency'];
            $data['exchange_rate']   = $order['exchange_rate'];
            $data['subtotal']        = $order['subtotal'];
            $data['tax']             = $order['tax'];
            $data['shipping']        = $order['shipping'];
            $data['discount']        = $order['discount'];
            $data['total']           = $order['total'];
            $data['received']        = $order['received'];
            $data['balance']         = $order['balance'];
            $data['id']              = $order->id;
            $data['details'] = [];

            $attributesGroup =  ShopAttributeGroup::pluck('name', 'id')->all();

            if ($order->details) {
                foreach ($order->details as $key => $detail) {
                    $arrAtt = json_decode($detail->attribute, true);
                    if($arrAtt) {
                        $htmlAtt = '';
                        foreach ($arrAtt as $groupAtt => $att) {
                            $htmlAtt .= $attributesGroup[$groupAtt] .':'.sc_render_option_price($att, $order['currency'], $order['exchange_rate']);
                        }
                        $name = $detail->name.'('.strip_tags($htmlAtt).')';
                    } else {
                        $name = $detail->name;
                    }
                    $data['details'][] = [
                        $key + 1, $detail->sku, $name, $detail->qty, $detail->price, $detail->total_price,
                    ];
                }
            }
            $options = ['filename' => 'Order ' . $orderId];
            return \Export::export($type, $data, $options);

        } else {
            return redirect()->route('admin.data_not_found')->with(['url' => url()->full()]);
        }
    }

    /**
     * Check permisison item
     */
    public function checkPermisisonItem($id) {
        return AdminOrder::getOrderAdmin($id);
    }

}
