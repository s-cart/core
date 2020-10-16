<?php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;
use SCart\Core\Front\Models\ModelTrait;
class ShopBanner extends Model
{
    use ModelTrait;

    public $table = SC_DB_PREFIX.'shop_banner';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;

    protected  $sc_type = 'all'; // all or interger
    protected  $sc_store = 0; // 1: only produc promotion,
    /*
    Get thumb
    */
    public function getThumb()
    {
        return sc_image_get_path_thumb($this->image);
    }

    /*
    Get image
    */
    public function getImage()
    {
        return sc_image_get_path($this->image);

    }
//Scort
    public function scopeSort($query, $sortBy = null, $sortOrder = 'desc')
    {
        $sortBy = $sortBy ?? 'sort';
        return $query->orderBy($sortBy, $sortOrder);
    }

    /**
     * Get info detail
     *
     * @param   [int]  $id     
     * @param   [int]  $status 
     *
     */
    public function getDetail($id) {

        return $this->where('id', (int)$id)->where('status', 1)
        ->where('store_id', config('app.storeId'))
        ->first();
    }

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($banner) {
        });
    }


    /**
     * Start new process get data
     *
     * @return  new model
     */
    public function start() {
        return new ShopBanner;
    }

    /**
     * Set type
     */
    private function setType($type) {
        $this->sc_type = $type;
        return $this;
    }

    /**
     * Get banner
     */
    public function getBanner() {
        $this->setType('banner');
        return $this;
    }

    /**
     * Get banner
     */
    public function getBannerStore() {
        $this->setType('banner-store');
        return $this;
    }

    /**
     * Get background
     */
    public function getBackground() {
        $this->setType('background');
        $this->setLimit(1);
        return $this;
    }

    /**
     * Get background
     */
    public function getBackgroundStore() {
        $this->setType('background-store');
        $this->setLimit(1);
        return $this;
    }

    /**
     * Get banner
     */
    public function getBreadcrumb() {
        $this->setType('breadcrumb');
        $this->setLimit(1);
        return $this;
    }

    /**
     * Get banner
     */
    public function getBreadcrumbStore() {
        $this->setType('breadcrumb-store');
        $this->setLimit(1);
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
     * build Query
     */
    public function buildQuery() {
        $query = $this;

        $query = $query->where('status', 1);

        if ($this->sc_type !== 'all') {
            $query = $query->where('type', $this->sc_type);
        }

        if (count($this->sc_moreWhere)) {
            foreach ($this->sc_moreWhere as $key => $where) {
                if(count($where)) {
                    $query = $query->where($where[0], $where[1], $where[2]);
                }
            }
        }

        //Get product active for store
        if (!empty($this->sc_store)) {
            //If sepcify store id
            $query = $query->where($this->getTable().'.store_id', $this->sc_store);
        } else {
            // If stor ID is 1, will get product of all stores
            $query = $query->where($this->getTable().'.store_id', config('app.storeId'));
        }
        //End store

        if ($this->sc_random) {
            $query = $query->inRandomOrder();
        } else {
            if (is_array($this->sc_sort) && count($this->sc_sort)) {
                foreach ($this->sc_sort as  $rowSort) {
                    if(is_array($rowSort) && count($rowSort) == 2) {
                        $query = $query->sort($rowSort[0], $rowSort[1]);
                    }
                }
            }
        }

        return $query;
    }

}
