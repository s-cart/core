<?php

namespace SCart\Core\Admin\Middleware;

use Closure;
use Session;

class AdminStoreId
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(\Admin::user()) {
            $allStoreId = \SCart\Core\Admin\Models\AdminStore::getArrayStoreId();
            if (!Session::has('adminStoreId') || !in_array(session('adminStoreId'), $allStoreId)) {
                //Get array list store id of user
                $arrStoreId = \Admin::user()->listStoreId();
                //Compare with list Id store
                $fillterStoreId = array_intersect($arrStoreId, $allStoreId);
                if ($fillterStoreId) {
                    $adminStoreId = min($fillterStoreId);
                    session(['adminStoreId' => $adminStoreId]);
                } else {
                    session(['adminStoreId' => 0]);
                    //Check access vendor admin
                    if (function_exists('sc_vendor_check_access_vendor_admin')) {
                        sc_vendor_check_access_vendor_admin();
                    }
                }
            }
        } else {
            session()->forget('adminStoreId');
        }
        return $next($request);
    }
}
