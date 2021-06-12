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
        //Only apply for when plugin multi-vendor or multi-store active
        if ((sc_config_global('MultiVendorPro') || sc_config_global('MultiStorePro')) && sc_config_global('domain_strict')) {
            //Check domain exist
            $domain = sc_process_domain_store(url('/')); //domain currently
            $domainRoot = sc_process_domain_store(config('app.url')); //Domain root config in .env
            $arrDomain = ShopStore::getDomainPartner(); // List domain is partner active

            if (!in_array($domain, $arrDomain) && $domain != $domainRoot) {
                echo view('deny_domain')->render();
                exit();
            }
        }
        return $next($request);
    }
}
