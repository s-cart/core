<?php
namespace SCart\Core\Front\Models;

use SCart\Core\Front\Models\ShopAttributeGroup;
use SCart\Core\Front\Models\ShopCategory;
use SCart\Core\Front\Models\ShopProductCategory;
use SCart\Core\Front\Models\ShopProductDescription;
use SCart\Core\Front\Models\ShopProductGroup;
use SCart\Core\Front\Models\ShopProductPromotion;
use SCart\Core\Front\Models\ShopTax;
use SCart\Core\Front\Models\ShopStore;
use Illuminate\Database\Eloquent\Model;
use SCart\Core\Front\Models\ModelTrait;
class ShopProduct extends Model
{
    use ModelTrait;
    public $table = SC_DB_PREFIX.'shop_product';
    protected $guarded = [];

    protected $connection = SC_CONNECTION;

    protected  $sc_kind = 'all'; // 0:single, 1:bundle, 2:group
    protected  $sc_property = 'all'; // 0:physical, 1:download, 2:only view, 3: Service
    protected  $sc_promotion = 0; // 1: only produc promotion,
    protected  $sc_store = 0; 
    protected  $sc_category_store = 'all'; 
    protected  $sc_array_ID = []; // array ID product
    protected  $sc_category = []; // array category id
    protected  $sc_brand = []; // array brand id
    protected  $sc_supplier = []; // array supplier id

    
    public function brand()
    {
        return $this->belongsTo(ShopBrand::class, 'brand_id', 'id');
    }

    public function supplier()
    {
        return $this->belongsTo(ShopSupplier::class, 'supplier_id', 'id');
    }

    public function categories()
    {
        return $this->belongsToMany(ShopCategory::class, ShopProductCategory::class, 'product_id', 'category_id');
    }
    public function store()
    {
        return $this->belongsTo(ShopStore::class, 'store_id', 'id');
    }
    public function groups()
    {
        return $this->hasMany(ShopProductGroup::class, 'group_id', 'id');
    }
    public function builds()
    {
        return $this->hasMany(ShopProductBuild::class, 'build_id', 'id');
    }
    public function images()
    {
        return $this->hasMany(ShopProductImage::class, 'product_id', 'id');
    }

    public function descriptions()
    {
        return $this->hasMany(ShopProductDescription::class, 'product_id', 'id');
    }

    public function promotionPrice()
    {
        return $this->hasOne(ShopProductPromotion::class, 'product_id', 'id');
    }
    public function attributes()
    {
        return $this->hasMany(ShopProductAttribute::class, 'product_id', 'id');
    }
    public function downloadPath()
    {
        return $this->hasOne(ShopProductDownload::class, 'product_id', 'id');
    }

    //Function get text description 
    public function getText() {
        return $this->descriptions()->where('lang', sc_get_locale())->first();
    }
    public function getName() {
        return $this->getText()->name;
    }
    public function getDescription() {
        return $this->getText()->description;
    }
    public function getKeyword() {
        return $this->getText()->keyword;
    }
    public function getContent() {
        return $this->getText()->content;
    }
    //End  get text description

    /*
    *Get final price
    */
    public function getFinalPrice()
    {
        $promotion = $this->processPromotionPrice();
        if ($promotion != -1) {
            return $promotion;
        } else {
            return $this->price;
        }
    }

    /*
    *Get final price with tax
    */
    public function getFinalPriceTax()
    {
        return sc_tax_price($this->getFinalPrice(), $this->getTaxValue());
    }


    /**
     * [showPrice description]
     * @return [type]           [description]
     */
    public function showPrice()
    {
        if (!sc_config('product_price', $this->store_id)) {
            return false;
        }
        $price = $this->price;
        $priceFinal = $this->getFinalPrice();
        // Process with tax
        return  view('templates.'.sc_store('template').'.common.show_price', 
            [
                'price' => $price,
                'priceFinal' => $priceFinal,
                'kind' => $this->kind,
            ]
        )->render();
    }

    /**
     * [showPriceDetail description]
     *
     *
     * @return  [type]             [return description]
     */
    public function showPriceDetail()
    {
        if (!sc_config('product_price', $this->store_id)) {
            return false;
        }
        $price = $this->price;
        $priceFinal = $this->getFinalPrice();
        // Process with tax
        return  view('templates.'.sc_store('template').'.common.show_price_detail', 
            [
                'price' => $price,
                'priceFinal' => $priceFinal,
                'kind' => $this->kind,
            ]
        )->render();
    }

    /**
     * Get product detail
     * @param  [string] $key [description]
     * @param  [string] $type id, sku, alias
     * @return [type]     [description]
     */
    public function getDetail($key = null, $type = null, $storeId = null)
    {
        if (empty($key)) {
            return null;
        }
        $tableDescription = (new ShopProductDescription)->getTable();

        $dataSelect = $this->getTable().'.*, '.$tableDescription.'.*'; 

        $storeId = empty($storeId) ? config('app.storeId') : $storeId;

        if (config('app.storeId') != 1) {
            //If the store is not the primary store
            //Cannot view the product in another store
            $storeId = config('app.storeId');
        }

        $product = $this->selectRaw($dataSelect)
            ->leftJoin($tableDescription, $tableDescription . '.product_id', $this->getTable() . '.id')
            ->where($this->getTable() . '.store_id', $storeId)
            ->where($tableDescription . '.lang', sc_get_locale());

        if (empty($type)) {
            $product = $product->where($this->getTable().'.id', (int)$key);  
        } elseif ($type == 'alias') {
            $product = $product->where($this->getTable().'.alias', $key);
        } elseif ($type == 'sku') {
            $product = $product->where($this->getTable().'.sku', $key);
        } else {
            return null;
        }

        $product = $product->where($this->getTable().'.status', 1);
        
        $product = $product
            ->with('images')
            ->with('store')
            ->with('promotionPrice');
        $product = $product->first();
        return $product;
    }

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($product) {
            $product->images()->delete();
            $product->descriptions()->delete();
            $product->promotionPrice()->delete();
            $product->groups()->delete();
            $product->attributes()->delete();
            $product->downloadPath()->delete();
            $product->builds()->delete();
            $product->categories()->detach();
            }
        );
    }

    /*
    *Get thumb
    */
    public function getThumb()
    {
        return sc_image_get_path_thumb($this->image);
    }

    /*
    *Get image
    */
    public function getImage()
    {
        return sc_image_get_path($this->image);

    }

    /**
     * [getUrl description]
     * @return [type] [description]
     */
    public function getUrl()
    {
        return sc_route('product.detail', ['alias' => $this->alias, 'storeId' => $this->store_id]);
    }

    /**
     * [getPercentDiscount description]
     * @return [type] [description]
     */
    public function getPercentDiscount()
    {
        return round((($this->price - $this->getFinalPrice()) / $this->price) * 100);
    }

    public function renderAttributeDetails()
    {
        return  view('templates.'.sc_store('template').'.common.render_attribute', 
            [
                'details' => $this->attributes()->get()->groupBy('attribute_group_id'),
                'groups' => ShopAttributeGroup::getListAll(),
            ]
        );
    }


//Scort
    public function scopeSort($query, $sortBy = null, $sortOrder = 'desc')
    {
        $sortBy = $sortBy ?? 'id';
        return $query->orderBy($sortBy, $sortOrder);
    }

    /**
    *Condition:
    * -Active
    * -In of stock or allow order out of stock
    * -Date availabe
    * -Not SC_PRODUCT_GROUP
    */
    public function allowSale()
    {
        if (!sc_config('product_price', $this->store_id)) {
            return false;
        }
        if ($this->status &&
            (sc_config('product_preorder', $this->store_id) == 1 || $this->date_available === null || date('Y-m-d H:i:s') >= $this->date_available) 
            && (sc_config('product_buy_out_of_stock', $this->store_id) || $this->stock || empty(sc_config('product_stock', $this->store_id))) 
            && $this->kind != SC_PRODUCT_GROUP
        ) {
            return true;
        } else {
            return false;
        }
    }

    /*
    Check promotion price
    */
    private function processPromotionPrice()
    {
        $promotion = $this->promotionPrice;
        if ($promotion) {
            if (($promotion['date_end'] >= date("Y-m-d") || $promotion['date_end'] === null)
                && ($promotion['date_start'] <= date("Y-m-d") || $promotion['date_start'] === null)
                && $promotion['status_promotion'] = 1) {
                return $promotion['price_promotion'];
            }
        }

        return -1;
    }

    /*
    Upate stock, sold
     */
    public static function updateStock($product_id, $qty_change)
    {
        $item = self::find($product_id);
        if ($item) {
            $item->stock = $item->stock - $qty_change;
            $item->sold = $item->sold + $qty_change;
            $item->save();

            //Process build
            $product = self::find($product_id);
            if ($product->kind == SC_PRODUCT_BUILD) {
                foreach ($product->builds as $key => $build) {
                    $productBuild = $build->product;
                    $productBuild->stock -= $qty_change * $build->quantity;
                    $productBuild->sold += $qty_change * $build->quantity;
                    $productBuild->save();
                }
            }

        }

    }

    /**
     * Start new process get data
     *
     * @return  new model
     */
    public function start() {
        return new ShopProduct;
    }
    
    /**
     * Set product kind
     */
    private function setKind($kind) {
        if ($kind === 'all') {
            $this->sc_kind = $kind;
        } else {
            $this->sc_kind = (int)$kind;
        }
        return $this;
    }

    /**
     * Set property product
     */
    private function setVirtual($property) {
        if ($property === 'all') {
            $this->sc_property = $property;
        } else {
            $this->sc_property = (int)$property;
        }
        return $this;
    }

    /**
     * Set array category 
     *
     * @param   [array|int]  $category 
     *
     */
    private function setCategory($category) {
        if (is_array($category)) {
            $this->sc_category = $category;
        } else {
            $this->sc_category = array((int)$category);
        }
        return $this;
    }

    /**
     * Set sub category 
     *
     * @param   [int]  $category 
     *
     */
    private function setCategoryStore($category) {
        $this->sc_category_store = (int)$category;
        return $this;
    }
    /**
     * Set array brand 
     *
     * @param   [array|int]  $brand 
     *
     */
    private function setBrand($brand) {
        if (is_array($brand)) {
            $this->sc_brand = $brand;
        } else {
            $this->sc_brand = array((int)$brand);
        }
        return $this;
    }

    /**
     * Set product promotion 
     *
     */
    private function setPromotion() {
        $this->sc_promotion = 1;
        return $this;
    }

    /**
     * Set store id
     *
     */
    public function setStore($id) {
        $this->sc_store = (int)$id;
        return $this;
    }

    /**
     * Set array ID product 
     *
     * @param   [array|int]  $arrID 
     *
     */
    private function setArrayID($arrID) {
        if (is_array($arrID)) {
            $this->sc_array_ID = $arrID;
        } else {
            $this->sc_array_ID = array((int)$arrID);
        }
        return $this;
    }

    
    /**
     * Set array supplier 
     *
     * @param   [array|int]  $supplier 
     *
     */
    private function setSupplier($supplier) {
        if (is_array($supplier)) {
            $this->sc_supplier = $supplier;
        } else {
            $this->sc_supplier = array((int)$supplier);
        }
        return $this;
    }

    /**
     * Product hot
     */
    public function getProductHot() {
        return $this->getProductPromotion();
    }

    /**
     * Product build
     */
    public function getProductBuild() {
        $this->setKind(SC_PRODUCT_BUILD);
        return $this;
    }

    /**
     * Product group
     */
    public function getProductGroup() {
        $this->setKind(SC_PRODUCT_GROUP);
        return $this;
    }

    /**
     * Product single
     */
    public function getProductSingle() {
        $this->setKind(SC_PRODUCT_SINGLE);
        return $this;
    }

    /**
     * Get product to array Catgory
     * @param   [array|int]  $arrCategory 
     */
    public function getProductToCategory($arrCategory) {
        $this->setCategory($arrCategory);
        return $this;
    }

    /**
     * Get product to  Catgory store
     * @param   [int]  $category 
     */
    public function getProductToCategoryStore($category) {
        $this->setCategoryStore($category);
        return $this;
    }

    /**
     * Get product to array Brand
     * @param   [array|int]  $arrBrand 
     */
    public function getProductToBrand($arrBrand) {
        $this->setBrand($arrBrand);
        return $this;
    }
    
    /**
     * Get product to array Supplier
     * @param   [array|int]  $arrSupplier 
     */
    private function getProductToSupplier($arrSupplier) {
        $this->setSupplier($arrSupplier);
        return $this;
    }


    /**
     * Get product latest
     */
    public function getProductLatest() {
        $this->setLimit(10);
        $this->setSort(['id', 'desc']);
        return $this;
    }

    /**
     * Get product last view
     */
    public function getProductLastView() {
        $this->setLimit(10);
        $this->setSort(['date_available', 'desc']);
        return $this;
    }

    /**
     * Get product best sell
     */
    public function getProductBestSell() {
        $this->setLimit(10);
        $this->setSort(['sold', 'desc']);
        return $this;
    }

    /**
     * Get product promotion
     */
    public function getProductPromotion() {
        $this->setLimit(10);
        $this->setPromotion();
        return $this;
    }

    /**
     * Get product from list ID product
     *
     * @param   [array]  $arrID  array id product
     *
     * @return  [type]          [return description]
     */
    public function getProductFromListID($arrID) {
        if (is_array($arrID)) {
            $this->setArrayID($arrID);
        }
        return $this;
    }

    /**
     * build Query
     */
    public function buildQuery() {

        $tableDescription = (new ShopProductDescription)->getTable();

        //description
        $query = $this
            ->leftJoin($tableDescription, $tableDescription . '.product_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());
        //search keyword
        if ($this->sc_keyword !='') {
            $query = $query->where(function ($sql) use($tableDescription){
                $sql->where($tableDescription . '.name', 'like', '%' . $this->sc_keyword . '%')
                    ->orWhere($tableDescription . '.keyword', 'like', '%' . $this->sc_keyword . '%')
                    ->orWhere($tableDescription . '.description', 'like', '%' . $this->sc_keyword . '%')
                    ->orWhere($this->getTable() . '.sku', 'like', '%' . $this->sc_keyword . '%');
            });
        }

        //Promotion
        if ($this->sc_promotion == 1) {
            $tablePromotion = (new ShopProductPromotion)->getTable();
            $query = $query->join($tablePromotion,$this->getTable() . '.id', '=', $tablePromotion . '.product_id')
                ->where($tablePromotion . '.status_promotion', 1)
                ->where(function ($query) use ($tablePromotion) {
                    $query->where($tablePromotion . '.date_end', '>=', date("Y-m-d"))
                        ->orWhereNull($tablePromotion . '.date_end');
                })
                ->where(function ($query) use($tablePromotion){
                    $query->where($tablePromotion . '.date_start', '<=', date("Y-m-d"))
                        ->orWhereNull($tablePromotion . '.date_start');
                });
        }

        $query = $query->with('promotionPrice');
            

        if (count($this->sc_category)) {
            $tablePTC = (new ShopProductCategory)->getTable();
            $query = $query->leftJoin($tablePTC, $tablePTC . '.product_id', $this->getTable() . '.id');
            $query = $query->whereIn($tablePTC . '.category_id', $this->sc_category);
        }
        $storeId = $this->sc_store ? $this->sc_store : config('app.storeId');

        //Process store
        if (!empty($this->sc_store) || config('app.storeId') != 1) {
            //If the store is specified or the default is not the primary store
            //Only get products from eligible stores
            $query = $query->where($this->getTable().'.store_id', $storeId);
        }
        //End store

        if (count($this->sc_array_ID)) {
            $query = $query->whereIn($this->getTable().'.id', $this->sc_array_ID);
        }

        $query = $query->where($this->getTable().'.status', 1);

        if ($this->sc_kind !== 'all') {
            $query = $query->where($this->getTable().'.kind', $this->sc_kind);
        }

        
        if ($this->sc_property !== 'all') {
            $query = $query->where($this->getTable().'.property', $this->sc_property);
        }

        if (count($this->sc_brand)) {
            $query = $query->whereIn($this->getTable().'.brand_id', $this->sc_brand);
        }

        if ($this->sc_category_store !== 'all') {
            $query = $query->where($this->getTable().'.category_store_id', $this->sc_category_store);
        }

        if (count($this->sc_supplier)) {
            $query = $query->whereIn($this->getTable().'.supplier_id', $this->sc_supplier);
        }

        if (count($this->sc_moreWhere)) {
            foreach ($this->sc_moreWhere as $key => $where) {
                if (count($where)) {
                    $query = $query->where($where[0], $where[1], $where[2]);
                }
            }
        }

        if ($this->sc_random) {
            $query = $query->inRandomOrder();
        } else {
            if (is_array($this->sc_sort) && count($this->sc_sort)) {
                foreach ($this->sc_sort as  $rowSort) {
                    if (is_array($rowSort) && count($rowSort) == 2) {
                        $query = $query->orderBy($rowSort[0], $rowSort[1]);
                    }
                }
            }
            $query = $query->orderBy($this->getTable().'.id', 'desc');
        }

        //Hidden product out of stock
        if (empty(sc_config('product_display_out_of_stock', $storeId)) && !empty(sc_config('product_stock', $storeId))) {
            $query = $query->where($this->getTable().'.stock', '>', 0);
        }

        return $query;
    }

    /**
     * Get tax ID
     *
     * @return  [type]  [return description]
     */
    public function getTaxId() {
        if (!ShopTax::checkStatus()) {
            return 0;
        }
        if ($this->tax_id == 'auto') {
            return ShopTax::checkStatus();
        } else {
            $arrTaxList = ShopTax::getListAll();
            if ($this->tax_id == 0 || !$arrTaxList->has($this->tax_id)) {
                return 0;
            }
        }
        return $this->tax_id;
    }

    /**
     * Get value tax (%)
     *
     * @return  [type]  [return description]
     */
    public function getTaxValue() {
        $taxId = $this->getTaxId();
        if ($taxId) {
            $arrValue = ShopTax::getArrayValue();
            return $arrValue[$taxId] ?? 0;
        } else {
            return 0;
        }
    }

    /**
     * Go to shop
     *
     * @return  [type]  [return description]
     */
    public function goToStore() {
        return url('store/'.$this->store->code);
    }

}
