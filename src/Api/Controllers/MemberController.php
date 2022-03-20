<?php

namespace SCart\Core\Api\Controllers;

use SCart\Core\Front\Controllers\RootFrontController;
use Illuminate\Http\Request;
use SCart\Core\Front\Models\ShopOrder;

class MemberController extends RootFrontController
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
}
