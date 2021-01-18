<?php
namespace SCart\Core\Front\Controllers;

use App\Http\Controllers\RootFrontController;
use SCart\Core\Front\Models\ShopCategory;
use SCart\Core\Front\Models\ShopProduct;

class ShopCategoryController extends RootFrontController
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Process front get category all
     *
     * @param [type] ...$params
     * @return void
     */
    public function allCategoriesProcessFront(...$params) {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            sc_lang_switch($lang);
        }
        return $this->_allCategories();
    }

    /**
     * display list category root (parent = 0)
     * @return [view]  
     */
    private function _allCategories()
    {
        $sortBy = 'sort';
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopCategory)
            ->getCategoryRoot()
            ->setSort([$sortBy, $sortOrder])
            ->setPaginate()
            ->setLimit(sc_config('item_list'))
            ->getData();

        sc_check_view($this->templatePath . '.screen.shop_item_list');
        return view(
            $this->templatePath . '.screen.shop_item_list',
            array(
                'title' => trans('front.categories'),
                'itemsList' => $itemsList,
                'keyword' => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            )
        );
    }

    /**
     * Process front get category detail
     *
     * @param [type] ...$params
     * @return void
     */
    public function categoryDetailProcessFront(...$params) {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            $alias = $params[1] ?? '';
            sc_lang_switch($lang);
        } else {
            $alias = $params[0] ?? '';
        }
        return $this->_categoryDetail($alias);
    }


    /**
     * Category detail: list category child + product list
     * @param  [string] $alias
     * @return [view]
     */
    private function _categoryDetail($alias)
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

        $category = (new ShopCategory)->getDetail($alias, $type = 'alias');

        if ($category) {
            $products = (new ShopProduct)
                ->getProductToCategory([$category->id])
                ->setLimit(sc_config('product_list'))
                ->setPaginate()
                ->setSort([$sortBy, $sortOrder])
                ->getData();

            $subCategory = (new ShopCategory)
                ->setParent($category->id)
                ->setLimit(sc_config('item_list'))
                ->setPaginate()
                ->getData();

            sc_check_view($this->templatePath . '.screen.shop_product_list');
            return view($this->templatePath . '.screen.shop_product_list',
                array(
                    'title' => $category->title,
                    'description' => $category->description,
                    'keyword' => $category->keyword,
                    'products' => $products,
                    'subCategory' => $subCategory,
                    'layout_page' => 'product_list',
                    'og_image' => asset($category->getImage()),
                    'filter_sort' => $filter_sort,
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }

}
