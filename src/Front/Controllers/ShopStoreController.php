<?php
namespace SCart\Core\Front\Controllers;

use SCart\Core\Front\Controllers\RootFrontController;
use SCart\Core\Front\Models\ShopBanner;
use SCart\Core\Front\Models\ShopProduct;
use SCart\Core\Front\Models\ShopEmailTemplate;
use SCart\Core\Front\Models\ShopNews;
use SCart\Core\Front\Models\ShopPage;
use SCart\Core\Front\Models\ShopSubscribe;
use Illuminate\Http\Request;

class ShopStoreController extends RootFrontController
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Process front shop page
     *
     * @param [type] ...$params
     * @return void
     */
    public function shopProcessFront(...$params)
    {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            sc_lang_switch($lang);
        }
        return $this->_shop();
    }

    /**
     * Shop page
     * @return [view]
     */
    private function _shop()
    {
        $sortBy = 'sort';
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'price_desc' => ['price', 'desc'],
            'price_asc' => ['price', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }
        $keyword = request('keyword') ?? '';
        $cid = request('cid') ?? '';
        $bid = request('bid') ?? '';
        $price = request('price') ?? '';
        $products = (new ShopProduct)->setKeyword($keyword);
        //Filter category
        if ($cid) {
            $products = $products->getProductToCategory($cid);
        }
        //filter brand
        if ($bid) {
            $products = $products->getProductToBrand($bid);
        }
        //Filter price
        if ($price) {
            $products = $products->setRangePrice($price);
        }

        $products = $products
            ->setLimit(sc_config('product_list'))
            ->setPaginate()
            ->setSort([$sortBy, $sortOrder])
            ->getData();

        sc_check_view($this->templatePath . '.screen.shop_home');
        return view(
            $this->templatePath . '.screen.shop_home',
            array(
                'title'       => sc_language_render('front.shop'),
                'keyword'     => sc_store('keyword'),
                'description' => sc_store('description'),
                'products'    => $products,
                'layout_page' => 'shop_home',
                'filter_sort' => $filter_sort,
                'breadcrumbs'        => [
                    ['url'           => '', 'title' => sc_language_render('front.shop')],
                ],
            )
        );
    }

    /**
     * Process front search page
     *
     * @param [type] ...$params
     * @return void
     */
    public function searchProcessFront(...$params)
    {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            sc_lang_switch($lang);
        }
        return $this->_search();
    }

    /**
     * search product
     * @return [view]
     */
    private function _search()
    {
        $sortBy = 'sort';
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'price_desc' => ['price', 'desc'],
            'price_asc'  => ['price', 'asc'],
            'sort_desc'  => ['sort', 'desc'],
            'sort_asc'   => ['sort', 'asc'],
            'id_desc'    => ['id', 'desc'],
            'id_asc'     => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }
        $keyword = request('keyword') ?? '';
        $cid = request('cid') ?? '';
        $bid = request('bid') ?? '';
        $price = request('price') ?? '';
        $products = (new ShopProduct)->setKeyword($keyword);
        //Filter category
        if ($cid) {
            $products = $products->getProductToCategory($cid);
        }
        //filter brand
        if ($bid) {
            $products = $products->getProductToBrand($bid);
        }
        //Filter price
        if ($price) {
            $products = $products->setRangePrice($price);
        }
        $products = $products->setSort([$sortBy, $sortOrder])
            ->setPaginate()
            ->setLimit(sc_config('product_list'))
            ->getData();

        $view = $this->templatePath . '.screen.shop_product_list';

        if (view()->exists($this->templatePath . '.screen.shop_search')) {
            $view = $this->templatePath . '.screen.shop_search';
        }
        sc_check_view($view);
        return view(
            $view,
            array(
                'title'       => sc_language_render('action.search') . ': ' . $keyword,
                'products'    => $products,
                'layout_page' => 'shop_search',
                'filter_sort' => $filter_sort,
                'breadcrumbs' => [
                    ['url'    => '', 'title' => sc_language_render('action.search')],
                ],
            )
        );
    }
}
