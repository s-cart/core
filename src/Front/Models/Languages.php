<?php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;
use SCart\Core\Front\Models\ShopLanguage;

class Languages extends Model
{
    public $timestamps = false;
    public $table = SC_DB_PREFIX.'languages';
    protected $guarded = [];
    private static $getList = null;
    protected $connection = SC_CONNECTION;


    public static function getListAll($location)
    {
        if (self::$getList === null) {
            self::$getList = self::where('location', $location)->pluck('text', 'code');
        }
        return self::$getList;
    }

    /**
     * Get all positions
     *
     * @return void
     */
    public static function getPosition() {
        return self::groupBy('position')->pluck('position')->all();
    }

    /**
     * Get all 
     *
     * @param [type] $lang
     * @param [type] $position
     * @return void
     */
    public static function getLanguagesPosition($lang, $position) {
        if (!empty($lang) && !empty($position)) {
            $languages = ShopLanguage::getCodeAll();
            if (!in_array($lang, array_keys($languages))) {
                return  [];
            }
            return self::where('location', $lang)
            ->where('position', $position)
            ->get()
            ->keyBy('code')
            ->toArray();
        } else {
            return [];
        }
    }
}
