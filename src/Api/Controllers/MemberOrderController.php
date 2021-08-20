<?php

namespace SCart\Core\Api\Controllers;

use App\Http\Controllers\RootFrontController;
use Illuminate\Http\Request;
use SCart\Core\Front\Models\ShopOrder;

class MemberOrderController extends RootFrontController
{

    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function orders(Request $request)
    {
        $orders = $request->user()->orders()
                ->jsonPaginate();
        return response()->json($orders, 200);
    }

    /**
     * Get order detail
     *
     * @return [json] user object
     */
    public function orderDetail(Request $request, $id)
    {
        $id = (int)$id;
        $user = $request->user();
        $order = (new ShopOrder)->where('id', $id)
                ->with('details')
                ->where('customer_id', $user->id)
                ->first();
        if($order) {
            $dataReturn = $order;
        } else {
            $dataReturn = [
                'error' => 1,
                'msg' => 'Not found',
                'detail' => 'Order not found or no permission!',
            ];
        }
        return response()->json($dataReturn, 200);
    }

    /**
     * Create new order
     *
     * @return void
     */
    public function createOrder() {
        $data = request()->all();
        $user = request()->user();
        $dataOrder = $data['dataOrder'];
        $dataTotal = $data['dataTotal'];
        $itemDetail = $data['itemDetail'];
        $dataOrder['customer_id'] = $user->id;
        $dataReturn = (new ShopOrder)->createOrder($dataOrder, $dataTotal, $itemDetail);
        if ($dataReturn['error'] == 1) {
            sc_report($dataReturn['msg']);
        }
        return response()->json($dataReturn, 200);
    }

}