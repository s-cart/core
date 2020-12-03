<?php
namespace SCart\Core\Front\Models;

use App\Admin\Models\AdminConfig;
use Illuminate\Database\Eloquent\Model;
class ShopStore extends Model
{
    public $timestamps = false;
    public $table = SC_DB_PREFIX.'admin_store';
    protected $guarded = [];
    protected static $getAll = null;
    protected static $getStoreActive = null;
    protected static $getCodeActive = null;
    protected static $getDomainPartner = null;
    protected static $getListAllActive = null;
    protected $connection = SC_CONNECTION;
    
    public function descriptions()
    {
        return $this->hasMany(ShopStoreDescription::class, 'store_id', 'id');
    }

    public function products()
    {
        return $this->hasMany(ShopProduct::class, 'store_id', 'id');
    }

    public function categories()
    {
        return $this->hasMany(ShopCategory::class, 'store_id', 'id');
    }


    public function banners()
    {
        return $this->hasMany(ShopBanner::class, 'store_id', 'id');
    }

    public function news()
    {
        return $this->hasMany(ShopNews::class, 'store_id', 'id');
    }

    public function pages()
    {
        return $this->hasMany(ShopPage::class, 'store_id', 'id');
    }


    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($store) {
            //Store id 1 is default
            if ($store->id == SC_ID_ROOT) {
                return false;
            }
            //Delete store descrition
            $store->descriptions()->delete();
            $store->news()->delete();
            $store->categories()->delete();
            $store->banners()->delete();
            $store->pages()->delete();
            AdminConfig::where('store_id', $store->id)->delete();
        });
    }


    /**
     * [getAll description]
     *
     * @return  [type]  [return description]
     */
    public static function getListAll()
    {
        if (self::$getAll === null) {
            self::$getAll = self::with('descriptions')
                ->get()
                ->keyBy('id');
        }
        return self::$getAll;
    }

    /**
     * [getAll active description]
     *
     * @return  [type]  [return description]
     */
    public static function getListAllActive()
    {
        if (self::$getListAllActive === null) {
            self::$getListAllActive = self::with('descriptions')
                ->where('active', 1)
                ->get()
                ->keyBy('id');
        }
        return self::$getListAllActive;
    }


    /**
     * Get all domain and id store unlock domain
     *
     * @return  [array]  [return description]
     */
    public static function getDomainPartner()
    {
        if (self::$getDomainPartner === null) {
            self::$getDomainPartner = self::where('partner', 1)
                ->whereNotNull('domain') 
                ->pluck('domain', 'id')
                ->all();
        }
        return self::$getDomainPartner;
    }
    

    /**
     * Get all domain and id store active
     *
     * @return  [array]  [return description]
     */
    public static function getStoreActive()
    {
        if (self::$getStoreActive === null) {
            self::$getStoreActive = self::where('active', 1)
                ->pluck('domain', 'id')
                ->all();
        }
        return self::$getStoreActive;
    }
    

    /**
     * Get all code and id store active
     *
     * @return  [array]  [return description]
     */
    public static function getCodeActive()
    {
        if (self::$getCodeActive === null) {
            self::$getCodeActive = self::where('active', 1)
                ->pluck('code', 'id')
                ->all();
        }
        return self::$getCodeActive;
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

}
