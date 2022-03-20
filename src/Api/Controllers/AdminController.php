<?php

namespace SCart\Core\Api\Controllers;

use SCart\Core\Front\Controllers\RootFrontController;
use Illuminate\Http\Request;
use SCart\Core\Front\Models\ShopOrder;

class AdminController extends RootFrontController
{

    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function getInfo(Request $request)
    {
        return response()->json($request->user());
    }

    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function orders(Request $request)
    {
        return response()->json($request->user()->orders);
    }

    /**
     * Get order detail
     *
     * @return [json] user object
     */
    public function ordersDetail(Request $request, $id)
    {
        $user = $request->user();
        $order = (new ShopOrder)->where('id', $id)
                ->with('details')
                -> where('customer_id', $user->id)
                ->first();
        if ($order) {
            $dataReturn = $order;
        } else {
            $dataReturn = [
                'error' => 1,
                'msg' => 'Not found',
                'detail' => 'Order not found or no permission!',
            ];
        }
        return response()->json($dataReturn);
    }
}
