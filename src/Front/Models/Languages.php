<?php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;


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
}
