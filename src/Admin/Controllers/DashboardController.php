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
        //Check user allow view dasdboard
        if(!\Admin::user()->checkUrlAllowAccess(route('admin.home')))
        {
            $data['title'] = sc_language_render('admin.dashboard');
            return view($this->templatePathAdmin.'default', $data);
        }

        $data                   = [];
        $data['title']          = sc_language_render('admin.dashboard');
        $data['totalOrder']     = AdminOrder::getTotalOrder();
        $data['totalProduct']   = AdminProduct::getTotalProduct();
        $data['totalNews']      = AdminNews::getTotalNews();
        $data['totalCustomer']  = AdminCustomer::getTotalCustomer();
        $data['topCustomer']    = AdminCustomer::getTopCustomer();
        $data['topOrder']       = AdminOrder::getTopOrder();
        $data['mapStyleStatus'] = AdminOrder::$mapStyleStatus;

        //Device statistics
        $dataCountries = AdminOrder::getDeviceInYear();
        $arrDevice   = [];
        foreach ($dataCountries as $key => $row) {
            $arrDevice[] =  [
                'name' => ucfirst($row->device_type),
                'y' => $row->count,
                'sliced' => true,
                'selected' => ($key == 0) ? true : false,
            ];
        }
        $data['dataPie'] = json_encode($arrDevice);
        //End Device statistics


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
            'title' => sc_language_render('admin.data_not_found'),
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
            'title' => sc_language_render('admin.deny'),
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
