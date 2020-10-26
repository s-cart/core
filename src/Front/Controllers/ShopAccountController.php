<?php
namespace SCart\Core\Front\Controllers;

use App\Http\Controllers\RootFrontController;
use SCart\Core\Front\Models\ShopCountry;
use SCart\Core\Front\Models\ShopOrder;
use SCart\Core\Front\Models\ShopOrderStatus;
use SCart\Core\Front\Models\ShopShippingStatus;
use SCart\Core\Front\Models\ShopCustomer;
use SCart\Core\Front\Models\ShopAttributeGroup;
use SCart\Core\Front\Models\ShopCustomerAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use SCart\Core\Front\Controllers\Auth\AuthTrait;

class ShopAccountController extends RootFrontController
{
    use AuthTrait;

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Index user profile
     *
     * @return  [view]
     */
    public function index()
    {
        $customer = auth()->user();

        sc_check_view($this->templatePath . '.account.index');
        return view($this->templatePath . '.account.index')
            ->with(
                [
                    'title' => trans('account.my_profile'),
                    'customer' => $customer,
                    'layout_page' => 'shop_profile',
                ]
            );
    }

    /**
     * Form Change password
     *
     * @return  [view]
     */
    public function changePassword()
    {
        $customer = auth()->user();
        sc_check_view($this->templatePath . '.account.change_password');
        return view($this->templatePath . '.account.change_password')
        ->with(
            [
                'title' => trans('account.change_password'),
                'customer' => $customer,
                'layout_page' => 'shop_profile',
            ]
        );
    }

    /**
     * Post change password
     *
     * @param   Request  $request  [$request description]
     *
     * @return  [redirect]
     */
    public function postChangePassword(Request $request)
    {
        $dataUser = Auth::user();
        $password = $request->get('password');
        $password_old = $request->get('password_old');
        if (trim($password_old) == '') {
            return redirect()->back()
                ->with(
                    [
                        'password_old_error' => trans('account.password_old_required')
                    ]
                );
        } else {
            if (!\Hash::check($password_old, $dataUser->password)) {
                return redirect()->back()
                    ->with(
                        [
                            'password_old_error' => trans('account.password_old_notcorrect')
                        ]
                    );
            }
        }
        $messages = [
            'password.required' => trans('validation.required',['attribute'=> trans('account.password')]),
            'password.confirmed' => trans('validation.confirmed',['attribute'=> trans('account.password')]),
            'password_old.required' => trans('validation.required',['attribute'=> trans('account.password_old')]),
        ];
        $v = Validator::make(
            $request->all(), 
            [
                'password_old' => 'required',
                'password' => 'required|string|min:6|confirmed',
            ],
            $messages
        );
        if ($v->fails()) {
            return redirect()->back()->withErrors($v->errors());
        }
        $dataUser->password = bcrypt($password);
        $dataUser->save();

        return redirect()->route('customer.index')
            ->with(['success' => trans('account.update_success')]);
    }

    /**
     * Form change info
     *
     * @return  [view]
     */
    public function changeInfomation()
    {
        $customer = auth()->user();
        sc_check_view($this->templatePath . '.account.change_infomation');
        return view($this->templatePath . '.account.change_infomation')
            ->with(
                [
                    'title' => trans('account.change_infomation'),
                    'customer' => $customer,
                    'countries' => ShopCountry::getCodeAll(),
                    'layout_page' => 'shop_profile',
                ]
            );
    }

    /**
     * Process update info
     *
     * @param   Request  $request  [$request description]
     *
     * @return  [redirect] 
     */
    public function postChangeInfomation(Request $request)
    {
        $user = Auth::user();
        $id = $user->id;
        $data = request()->all();
        $data['id'] = $id;

        $dataMapping = $this->mappingValidatorEdit($data);

        $v =  Validator::make($data, $dataMapping['validate'], $dataMapping['messages']);
        if ($v->fails()) {
            return redirect()->back()
                ->withErrors($v)
                ->withInput();
        }
        ShopCustomer::updateInfo($dataMapping['dataUpdate'], $id);

        return redirect()->route('customer.index')
            ->with(['success' => trans('account.update_success')]);
    }

    /**
     * Render order list
     * @return [view]
     */
    public function orderList()
    {
        $statusOrder = ShopOrderStatus::getIdAll();
        sc_check_view($this->templatePath . '.account.order_list');
        return view($this->templatePath . '.account.order_list')
            ->with(
                [
                'title' => trans('account.order_list'),
                'statusOrder' => $statusOrder,
                'orders' => (new ShopOrder)->profile()->getData(),
                'layout_page' => 'shop_profile',
                ]
            );
    }

    /**
     * Render order detail
     * @return [view]
     */
    public function orderDetail($id)
    {
        $customer = auth()->user();
        $statusOrder = ShopOrderStatus::getIdAll();
        $statusShipping = ShopShippingStatus::getIdAll();
        $attributesGroup = ShopAttributeGroup::pluck('name', 'id')->all();
        $order = ShopOrder::where('id', $id) ->where('customer_id', $customer->id)->first();
        if($order) {
            $title = trans('account.order_detail').' #'.$order->id;
        } else {
            $title = trans('account.order_detail_notfound');
        }
        sc_check_view($this->templatePath . '.account.order_detail');
        return view($this->templatePath . '.account.order_detail')
        ->with(
            [
            'title' => $title,
            'statusOrder' => $statusOrder,
            'statusShipping' => $statusShipping,
            'countries' => ShopCountry::getCodeAll(),
            'attributesGroup' => $attributesGroup,
            'order' => $order,
            'layout_page' => 'shop_profile',
            ]
        );

    }


    /**
     * Render address list
     * @return [view]
     */
    public function addressList()
    {
        $customer = auth()->user();
        sc_check_view($this->templatePath . '.account.address_list');
        return view($this->templatePath . '.account.address_list')
            ->with(
                [
                'title' => trans('account.address_list'),
                'addresses' => $customer->addresses,
                'countries' => ShopCountry::getCodeAll(),
                'layout_page' => 'shop_profile',
                ]
            );
    }


    /**
     * Render address detail
     * @return [view]
     */
    public function updateAddress($id)
    {
        $customer = auth()->user();
        $address =  (new ShopCustomerAddress)->where('customer_id', $customer->id)
            ->where('id', $id)
            ->first();
        if($address) {
            $title = trans('account.address_detail').' #'.$address->id;
        } else {
            $title = trans('account.address_detail_notfound');
        }
        sc_check_view($this->templatePath . '.account.update_address');
        return view($this->templatePath . '.account.update_address')
        ->with(
            [
            'title' => $title,
            'address' => $address,
            'countries' => ShopCountry::getCodeAll(),
            'layout_page' => 'shop_profile',
            ]
        );

    }

    /**
     * Process update address
     *
     * @param   Request  $request  [$request description]
     *
     * @return  [redirect] 
     */
    public function postUpdateAddress(Request $request, $id)
    {
        $customer = auth()->user();
        $data = request()->all();
        $address =  (new ShopCustomerAddress)->where('customer_id', $customer->id)
            ->where('id', $id)
            ->first();
        
        $dataUpdate = [
            'first_name' => $data['first_name'],
            'address1' => $data['address1'],
        ];
        $validate = [
            'first_name' => 'required|string|max:100',
            'address1' => 'required|string|max:255',
        ];
        if(sc_config('customer_lastname')) {
            $validate['last_name'] = 'required|max:100';
            $dataUpdate['last_name'] = $data['last_name']??'';
        }
        if(sc_config('customer_address2')) {
            $validate['address2'] = 'required|max:100';
            $dataUpdate['address2'] = $data['address2']??'';
        }
        if(sc_config('customer_phone')) {
            $validate['phone'] = 'required|regex:/^0[^0][0-9\-]{7,13}$/';
            $dataUpdate['phone'] = $data['phone']??'';
        }
        if(sc_config('customer_country')) {
            $validate['country'] = 'required|min:2';
            $dataUpdate['country'] = $data['country']??'';
        }
        if(sc_config('customer_postcode')) {
            $validate['postcode'] = 'nullable|min:5';
            $dataUpdate['postcode'] = $data['postcode']??'';
        }

        $messages = [
            'last_name.required' => trans('validation.required',['attribute'=> trans('account.last_name')]),
            'first_name.required' => trans('validation.required',['attribute'=> trans('account.first_name')]),
            'address1.required' => trans('validation.required',['attribute'=> trans('account.address1')]),
            'address2.required' => trans('validation.required',['attribute'=> trans('account.address2')]),
            'phone.required' => trans('validation.required',['attribute'=> trans('account.phone')]),
            'country.required' => trans('validation.required',['attribute'=> trans('account.country')]),
            'postcode.required' => trans('validation.required',['attribute'=> trans('account.postcode')]),
            'phone.regex' => trans('validation.regex',['attribute'=> trans('account.phone')]),
            'postcode.min' => trans('validation.min',['attribute'=> trans('account.postcode')]),
            'country.min' => trans('validation.min',['attribute'=> trans('account.country')]),
            'first_name.max' => trans('validation.max',['attribute'=> trans('account.first_name')]),
            'address1.max' => trans('validation.max',['attribute'=> trans('account.address1')]),
            'address2.max' => trans('validation.max',['attribute'=> trans('account.address2')]),
            'last_name.max' => trans('validation.max',['attribute'=> trans('account.last_name')]),
        ];

        $v = Validator::make(
            $dataUpdate, 
            $validate, 
            $messages
        );
        if ($v->fails()) {
            return redirect()->back()->withErrors($v->errors());
        }

        $address->update(sc_clean($dataUpdate));

        if(!empty($data['default'])) {
            (new ShopCustomer)->find($customer->id)->update(['address_id' => $id]);
        }
        return redirect()->route('customer.address_list')
            ->with(['success' => trans('account.update_success')]);
    }



    /**
     * Get address detail 
     *
     * @return  [json] 
     */
    public function getAddress() {
        $customer = auth()->user();
        $id = request('id');
        $address =  (new ShopCustomerAddress)->where('customer_id', $customer->id)
            ->where('id', $id)
            ->first();
        if($address) {
            return $address->toJson();
        } else {
            return json_encode(['error' => 1, 'msg' => 'Address not found']);
        }
    }

    /**
     * Get address detail 
     *
     * @return  [json] 
     */
    public function deleteAddress() {
        $customer = auth()->user();
        $id = request('id');
        (new ShopCustomerAddress)->where('customer_id', $customer->id)
            ->where('id', $id)
            ->delete();
        return json_encode(['error' => 0, 'msg' => trans('account.delete_address_success')]);
    }

}
