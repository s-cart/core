<?php
#S-Cart/Core/Front/Models/ShopPage.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;
use Cache;
use SCart\Core\Front\Models\ShopStore;


class ShopPage extends Model
{
    
    use \SCart\Core\Front\Models\ModelTrait;
    use \SCart\Core\Front\Models\UuidTrait;

    public $table          = SC_DB_PREFIX.'shop_page';
    protected $connection  = SC_CONNECTION;
    protected $guarded     = [];

    public function stores()
    {
        return $this->belongsToMany(ShopStore::class, ShopPageStore::class, 'page_id', 'store_id');
    }

    public function descriptions()
    {
        return $this->hasMany(ShopPageDescription::class, 'page_id', 'id');
    }

    //Function get text description
    public function getText()
    {
        return $this->descriptions()->where('lang', sc_get_locale())->first();
    }
    public function getTitle()
    {
        return $this->getText()->title ?? '';
    }
    public function getDescription()
    {
        return $this->getText()->description ?? '';
    }
    public function getKeyword()
    {
        return $this->getText()->keyword?? '';
    }
    public function getContent()
    {
        return $this->getText()->content;
    }
    //End  get text description


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

    public function getUrl($lang = null)
    {
        return sc_route('page.detail', ['alias' => $this->alias, 'lang' => $lang ?? app()->getLocale()]);
    }

    /**
     * Get page detail
     *
     * @param   [string]  $key     [$key description]
     * @param   [string]  $type  [id, alias]
     * @param   [int]  $checkActive
     *
     */
    public function getDetail($key, $type = null, $checkActive = 1)
    {
        if (empty($key)) {
            return null;
        }
        $tableDescription = (new ShopPageDescription)->getTable();

        $dataSelect = $this->getTable().'.*, '.$tableDescription.'.*';
        $page = $this->selectRaw($dataSelect)
            ->leftJoin($tableDescription, $tableDescription . '.page_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());

        $storeId = config('app.storeId');
        if (sc_check_multi_shop_installed()) {
            $tablePageStore = (new ShopPageStore)->getTable();
            $tableStore = (new ShopStore)->getTable();
            $page = $page->join($tablePageStore, $tablePageStore.'.page_id', $this->getTable() . '.id');
            $page = $page->join($tableStore, $tableStore . '.id', $tablePageStore.'.store_id');
            $page = $page->where($tableStore . '.status', '1');
            $page = $page->where($tablePageStore.'.store_id', $storeId);
        }

        if ($type === null) {
            $page = $page->where($this->getTable() .'.id', $key);
        } else {
            $page = $page->where($type, $key);
        }
        if ($checkActive) {
            $page = $page->where($this->getTable() .'.status', 1);
        }

        return $page->first();
    }

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(
            function ($page) {
                $page->descriptions()->delete();
                $page->stores()->detach();

                //Delete custom field
                (new ShopCustomFieldDetail)
                ->join(SC_DB_PREFIX.'shop_custom_field', SC_DB_PREFIX.'shop_custom_field.id', SC_DB_PREFIX.'shop_custom_field_detail.custom_field_id')
                ->where(SC_DB_PREFIX.'shop_custom_field_detail.rel_id', $page->id)
                ->where(SC_DB_PREFIX.'shop_custom_field.type', 'shop_page')
                ->delete();
            }
        );
        //Uuid
        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = sc_generate_id($type = 'shop_page');
            }
        });
    }


    /**
     * Start new process get data
     *
     * @return  new model
     */
    public function start()
    {
        return new ShopPage;
    }

    /**
     * build Query
     */
    public function buildQuery()
    {
        $tableDescription = (new ShopPageDescription)->getTable();

        $dataSelect = $this->getTable().'.*, '.$tableDescription.'.*';
        $query = $this->selectRaw($dataSelect)
            ->leftJoin($tableDescription, $tableDescription . '.page_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());

        $storeId = config('app.storeId');
        if (sc_check_multi_shop_installed()) {
            $tablePageStore = (new ShopPageStore)->getTable();
            $tableStore = (new ShopStore)->getTable();
            $query = $query->join($tablePageStore, $tablePageStore.'.page_id', $this->getTable() . '.id');
            $query = $query->join($tableStore, $tableStore . '.id', $tablePageStore.'.store_id');
            $query = $query->where($tableStore . '.status', '1');
            $query = $query->where($tablePageStore.'.store_id', $storeId);
        }

        //search keyword
        if ($this->sc_keyword !='') {
            $query = $query->where(function ($sql) use ($tableDescription) {
                $sql->where($tableDescription . '.title', 'like', '%' . $this->sc_keyword . '%')
                ->orWhere($tableDescription . '.keyword', 'like', '%' . $this->sc_keyword . '%')
                ->orWhere($tableDescription . '.description', 'like', '%' . $this->sc_keyword . '%');
            });
        }

        $query = $query->where($this->getTable() .'.status', 1);

        /**
        Note: sc_moreWhere will remove in the next version
         */
        if (count($this->sc_moreWhere)) {
            foreach ($this->sc_moreWhere as $key => $where) {
                if (count($where)) {
                    $query = $query->where($where[0], $where[1], $where[2]);
                }
            }
        }
        $query = $this->processMoreQuery($query);
        

        if ($this->random) {
            $query = $query->inRandomOrder();
        } else {
            if (is_array($this->sc_sort) && count($this->sc_sort)) {
                foreach ($this->sc_sort as  $rowSort) {
                    if (is_array($rowSort) && count($rowSort) == 2) {
                        $query = $query->sort($rowSort[0], $rowSort[1]);
                    }
                }
            }
        }

        return $query;
    }
}
