<?php
#S-Cart/Core/Front/Models/ShopLength.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopLength extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    public $table = SC_DB_PREFIX.'shop_length';
    protected $connection = SC_CONNECTION;
    protected $guarded           = [];
    protected static $getList = null;

    public static function getListAll()
    {
        if (!self::$getList) {
            self::$getList = self::pluck('description', 'name')->all();
        }
        return self::$getList;
    }
}
