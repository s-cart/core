<?php

namespace SCart\Core\Admin\Middleware;

use Closure;

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
        $adminStoreId = null;
        if(\Admin::user() && count($arrStoreId = \Admin::user()->listStoreId())) {
            if(in_array(0, $arrStoreId)) {
                $adminStoreId = $arrStoreId[1];
            } else {
                $adminStoreId = $arrStoreId[0];
            }
        } 
        session(['adminStoreId' => $adminStoreId]);
        return $next($request);
    }
}
