<?php
#S-Cart/Core/Front/Models/ShopStore.php
namespace S-Cart\Core\Front\Models;

use App\Admin\Models\AdminConfig;
use Illuminate\Database\Eloquent\Model;
class ShopStore extends Model
{
    public $timestamps = false;
    public $table = SC_DB_PREFIX.'admin_store';
    protected $guarded = [];
    protected static $getAll = null;
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
            if ($store->id == 1) {
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
     * Get all domain and id store active
     *
     * @return  [array]  [return description]
     */
    public static function getDomainActive()
    {
        return self::where('status', 1)
            ->pluck('domain', 'id')
            ->all();
    }

}
