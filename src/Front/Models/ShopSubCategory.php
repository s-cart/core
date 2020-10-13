<?php
namespace SCart\Core\Front\Models;

use SCart\Core\Front\Models\ShopSubCategoryDescription;
use SCart\Core\Front\Models\ShopProduct;
use Illuminate\Database\Eloquent\Model;
use SCart\Core\Front\Models\ModelTrait;

class ShopSubCategory extends Model
{
    use ModelTrait;

    public $timestamps = false;
    public $table = SC_DB_PREFIX . 'shop_sub_category';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;

    public function products()
    {
        return $this->hasMany(ShopProduct::class, 'sub_category_id', 'id');
    }

    public function descriptions()
    {
        return $this->hasMany(ShopSubCategoryDescription::class, 'sub_category_id', 'id');
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
        return route('sub_category.detail', ['alias' => $this->alias]);
    }

    //Scort
    public function scopeSort($query, $sortBy = null, $sortOrder = 'desc')
    {
        $sortBy = $sortBy ?? 'sort';
        return $query->orderBy($sortBy, $sortOrder);
    }

    /**
     * Get categoy detail
     *
     * @param   [string]  $key     [$key description]
     * @param   [string]  $type  [id, alias]
     *
     */
    public function getDetail($key, $type = null)
    {
        if(empty($key)) {
            return null;
        }
        $tableDescription = (new ShopSubCategoryDescription)->getTable();
        $category = $this
            ->leftJoin($tableDescription, $tableDescription . '.sub_category_id', $this->getTable() . '.id')
            ->where( $this->getTable() . '.store_id', config('app.storeId'))
            ->where($tableDescription . '.lang', sc_get_locale());

        if ($type === null) {
            $category = $category->where('id', (int) $key);
        } else {
            $category = $category->where($type, $key);
        }
        $category = $category->where('status', 1);
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
        $query = $query->where('store_id', config('app.storeId'));

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
