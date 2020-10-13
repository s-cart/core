<?php
namespace SCart\Core\Front\Controllers;

use App\Http\Controllers\RootFrontController;
use SCart\Core\Front\Models\ShopProduct;
use SCart\Core\Front\Models\ShopSupplier;

class ShopSupplierController extends RootFrontController
{
    public function __construct()
    {
        parent::__construct();
    }
    
    /**
     * all supplier
     * @return [view]
     */
    public function allSuppliers()
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
        $itemsList = (new ShopSupplier)
            ->setSort([$sortBy, $sortOrder])
            ->setPaginate()
            ->setLimit(sc_config('item_list'))
            ->getData();

        sc_check_view($this->templatePath . '.screen.shop_item_list');
        return view(
            $this->templatePath . '.screen.shop_item_list',
            array(
                'title' => trans('front.suppliers'),
                'itemsList' => $itemsList,
                'keyword' => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            )
        );
    }

    /**
     * supplier detail
     * @param  [string] alias [description]
     * @return [view]
     */
    public function supplierDetail($alias)
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

        $supplier = (new ShopSupplier)->getDetail($alias, $type = 'alias');
        if ($supplier) {
            $products = (new ShopProduct)
            ->getProductToSupplier($supplier->id)
            ->setPaginate()
            ->setLimit(sc_config('product_list'))
            ->setSort([$sortBy, $sortOrder])
            ->getData();

            sc_check_view($this->templatePath . '.screen.shop_product_list');
            return view($this->templatePath . '.screen.shop_product_list',
                array(
                    'title' => $supplier->name,
                    'description' => $supplier->description,
                    'keyword' => $supplier->keyword,
                    'layout_page' => 'product_list',
                    'products' => $products,
                    'og_image' => asset($supplier->getImage()),
                    'filter_sort' => $filter_sort,
                    )
            );
        } else {
            return $this->itemNotFound();
        }

    }

}
