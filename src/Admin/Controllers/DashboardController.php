<?php

namespace SCart\Core\Admin\Controllers;

use App\Http\Controllers\RootAdminController;
use SCart\Core\Admin\Models\AdminNews;
use SCart\Core\Admin\Models\AdminProduct;
use SCart\Core\Admin\Models\AdminCustomer;
use SCart\Core\Admin\Models\AdminOrder;
use Illuminate\Http\Request;

class DashboardController extends RootAdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function index(Request $request)
    {
        // Check redirect dashboard multi-store
        if (function_exists('sc_store_redirect_dashboard')) {
            if (sc_store_redirect_dashboard()) {
                return redirect(sc_store_redirect_dashboard());
            }
        }

        //Check user allow view dasdboard
        if(!\Admin::user()->checkUrlAllowAccess(route('admin.home')))
        {
            $data['title'] = trans('admin.dashboard');
            return view($this->templatePathAdmin.'default', $data);
        }

        $data                   = [];
        $data['title']          = trans('admin.dashboard');
        $data['totalOrder']     = AdminOrder::getTotalOrder();
        $data['totalProduct']   = AdminProduct::getTotalProduct();
        $data['totalNews']      = AdminNews::getTotalNews();
        $data['totalCustomer']  = AdminCustomer::getTotalCustomer();
        $data['topCustomer']    = AdminCustomer::getTopCustomer();
        $data['topOrder']       = AdminOrder::getTopOrder();
        $data['mapStyleStatus'] = AdminOrder::$mapStyleStatus;

        //Country statistics
        $dataCountries = AdminOrder::getCountryInYear();
        $arrCountryMap   = [];
        $ctTotal = 0;
        $ctTop = 0;
        foreach ($dataCountries as $key => $country) {
            $ctTotal +=$country->count;
            if($key <= 3) {
                $ctTop +=$country->count;
                $countryName = $country->country ?? $key ;
                if($key == 0) {
                    $arrCountryMap[] =  [
                        'name' => $countryName,
                        'y' => $country->count,
                        'sliced' => true,
                        'selected' => true,
                    ];
                } else {
                    $arrCountryMap[] =  [$countryName, $country->count];
                }
            }
        }
        $arrCountryMap[] = ['Other', ($ctTotal - $ctTop)];
        $data['dataPie'] = json_encode($arrCountryMap);
        //End country statistics


        //Order in 30 days
        $totalsInMonth = AdminOrder::getSumOrderTotalInMonth()->keyBy('md')->toArray();
        $rangDays = new \DatePeriod(
            new \DateTime('-1 month'),
            new \DateInterval('P1D'),
            new \DateTime('+1 day')
        );
        $orderInMonth  = [];
        $amountInMonth  = [];
        foreach ($rangDays as $i => $day) {
            $date = $day->format('m-d');
            $orderInMonth[$date] = $totalsInMonth[$date]['total_order'] ?? '';
            $amountInMonth[$date] = ($totalsInMonth[$date]['total_amount'] ?? 0);
        }
        $data['orderInMonth'] = $orderInMonth;
        $data['amountInMonth'] = $amountInMonth;

        //End order in 30 days
        
        //Order in 12 months
        $totalsMonth = AdminOrder::getSumOrderTotalInYear()
            ->pluck('total_amount', 'ym')->toArray();
        $dataInYear = [];
        for ($i = 12; $i >= 0; $i--) {
            $date = date("Y-m", strtotime(date('Y-m-01') . " -$i months"));
            $dataInYear[$date] = $totalsMonth[$date] ?? 0;
        }
        $data['dataInYear'] = $dataInYear;
        //End order in 12 months

        return view($this->templatePathAdmin.'dashboard', $data);
    }

    /**
     * Page not found
     *
     * @return  [type]  [return description]
     */
    public function dataNotFound()
    {
        $data = [
            'title' => trans('admin.data_not_found'),
            'icon' => '',
            'url' => session('url'),
        ];
        return view($this->templatePathAdmin.'data_not_found', $data);
    }


    /**
     * Page deny
     *
     * @return  [type]  [return description]
     */
    public function deny()
    {
        $data = [
            'title' => trans('admin.deny'),
            'icon' => '',
            'method' => session('method'),
            'url' => session('url'),
        ];
        return view($this->templatePathAdmin.'deny', $data);
    }

    /**
     * [denySingle description]
     *
     * @return  [type]  [return description]
     */
    public function denySingle()
    {
        $data = [
            'method' => session('method'),
            'url' => session('url'),
        ];
        return view($this->templatePathAdmin.'deny_single', $data);
    }
}
