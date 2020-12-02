<?php

namespace SCart\Core\Front\Middleware;

use Closure;
use SCart\Core\Front\Models\ShopStore;

class CheckDomain
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
        if (sc_config_global('MultiStorePro')) {
            //Check domain exist
            $domain = sc_process_domain_store(url('/'));
            $arrDomain = ShopStore::getDomainPartner();
            if (!in_array($domain, $arrDomain) && sc_config_global('domain_strict') ) {
                echo view('deny_domain')->render();
                exit();
            }
        }
        return $next($request);
    }
}
