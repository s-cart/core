<?php
namespace SCart\Core\Front\Controllers;

use App\Http\Controllers\RootFrontController;
use SCart\Core\Front\Models\ShopBrand;
use SCart\Core\Front\Models\ShopProduct;

class ShopBrandController extends RootFrontController
{
    public function __construct()
    {
        parent::__construct();
    }
    
    /**
     * Process front get all brand
     *
     * @param [type] ...$params
     * @return void
     */
    public function allBrandsProcessFront(...$params) {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            sc_lang_switch($lang);
        }
        return $this->_allBrands();
    }

    /**
     * Get all brand
     * @return [view]
     */
    private function _allBrands()
    {
        $sortBy = 'sort';
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'name_desc' => ['name', 'desc'],
            'name_asc' => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopBrand)
            ->setSort([$sortBy, $sortOrder])
            ->setPaginate()
            ->setLimit(sc_config('item_list'))
            ->getData();

        sc_check_view($this->templatePath . '.screen.shop_item_list');
        return view(
            $this->templatePath . '.screen.shop_item_list',
            array(
                'title' => trans('front.brands'),
                'itemsList' => $itemsList,
                'keyword' => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            )
        );
    }

    /**
     * Process front get brand detail
     *
     * @param [type] ...$params
     * @return void
     */
    public function brandDetailProcessFront(...$params) {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            $alias = $params[1] ?? '';
            sc_lang_switch($lang);
        } else {
            $alias = $params[0] ?? '';
        }
        return $this->_brandDetail($alias);
    }

    /**
     * brand detail
     * @param  [string] $alias
     * @return [view] 
     */
    private function _brandDetail($alias)
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

        $brand = (new ShopBrand)->getDetail($alias, $type = 'alias');
        if($brand) {
            $products = (new ShopProduct)
            ->getProductToBrand($brand->id)
            ->setPaginate()
            ->setLimit(sc_config('product_list'))
            ->setSort([$sortBy, $sortOrder])
            ->getData();

            sc_check_view($this->templatePath . '.screen.shop_product_list');
            return view(
                $this->templatePath . '.screen.shop_product_list',
                array(
                    'title' => $brand->name,
                    'description' => $brand->description,
                    'keyword' => $brand->keyword,
                    'layout_page' => 'product_list',
                    'products' => $products,
                    'og_image' => asset($brand->getImage()),
                    'filter_sort' => $filter_sort,
                )
            );
        } else {
            return $this->itemNotFound();
        }
    }
}
