<?php
namespace SCart\Core\Front\Models;

use SCart\Core\Front\Models\ShopSubCategoryDescription;
use SCart\Core\Front\Models\ShopProduct;
use SCart\Core\Front\Models\ShopStore;
use Illuminate\Database\Eloquent\Model;
use SCart\Core\Front\Models\ModelTrait;

class ShopSubCategory extends Model
{
    use ModelTrait;

    public $timestamps = false;
    public $table = SC_DB_PREFIX . 'shop_sub_category';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;

    protected  $sc_store = 0; 

    public function products()
    {
        return $this->hasMany(ShopProduct::class, 'sub_category_id', 'id');
    }

    public function descriptions()
    {
        return $this->hasMany(ShopSubCategoryDescription::class, 'sub_category_id', 'id');
    }

    public function store()
    {
        return $this->belongsTo(ShopStore::class, 'store_id', 'id');
    }

    //Function get text description 
    public function getText() {
        return $this->descriptions()->where('lang', sc_get_locale())->first();
    }
    public function getTitle() {
        return $this->getText()->title;
    }
    public function getDescription() {
        return $this->getText()->description;
    }
    public function getKeyword() {
        return $this->getText()->keyword;
    }
    //End  get text description

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($category) {
            //Delete category descrition
            $category->descriptions()->delete();
        });
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

    public function getUrl()
    {
        return route('sub_category.detail', ['alias' => $this->alias, 'storeId' => $this->store_id]);
    }

    /**
     * Set store id
     *
     */
    public function setStore($id) {
        $this->sc_store = (int)$id;
        return $this;
    }

    //Scort
    public function scopeSort($query, $sortBy = null, $sortOrder = 'desc')
    {
        $sortBy = $sortBy ?? 'sort';
        return $query->orderBy($sortBy, $sortOrder);
    }

    /**
     * Get sub category detail
     *
     * @param   [type]$key        [$key description]
     * @param   [type]$type       [$type description]
     * @param   null  $storeCode  [$storeCode description]
     *
     * @return  [type]            [return description]
     */
    public function getDetail($key, $type = null, $storeId = null)
    {
        if(empty($key)) {
            return null;
        }
        $storeId = empty($storeId) ? config('app.storeId') : $storeId;
        $tableDescription = (new ShopSubCategoryDescription)->getTable();
        $category = $this
            ->leftJoin($tableDescription, $tableDescription . '.sub_category_id', $this->getTable() . '.id')
            ->where($this->getTable() . '.store_id', $storeId)
            ->where($tableDescription . '.lang', sc_get_locale());

        if ($type === null) {
            $category = $category->where($this->getTable() .'.id', (int) $key);
        } else {
            $category = $category->where($type, $key);
        }
        $category = $category->where($this->getTable() .'.status', 1);
        return $category->first();
    }
    


    /**
     * Start new process get data
     *
     * @return  new model
     */
    public function start() {
        return new ShopSubCategory;
    }

    /**
     * build Query
     */
    public function buildQuery() {
        $tableDescription = (new ShopSubCategoryDescription)->getTable();

        //description
        $query = $this
            ->leftJoin($tableDescription, $tableDescription . '.sub_category_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());
        //search keyword
        if ($this->sc_keyword !='') {
            $query = $query->where(function ($sql) use($tableDescription){
                $sql->where($tableDescription . '.title', 'like', '%' . $this->sc_keyword . '%')
                    ->orWhere($tableDescription . '.keyword', 'like', '%' . $this->sc_keyword . '%')
                    ->orWhere($tableDescription . '.description', 'like', '%' . $this->sc_keyword . '%');
            });
        }

        $query = $query->where('status', 1);

        //Get product active for store
        if (!empty($this->sc_store)) {
            //If sepcify store id
            $query = $query->where($this->getTable().'.store_id', $this->sc_store);
        } elseif (config('app.storeId') != 1) {
            // If stor ID is 1, will get product of all stores
            $query = $query->where($this->getTable().'.store_id', config('app.storeId'));
        }
        //End store


        if (count($this->sc_moreWhere)) {
            foreach ($this->sc_moreWhere as $key => $where) {
                if(count($where)) {
                    $query = $query->where($where[0], $where[1], $where[2]);
                }
            }
        }

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
