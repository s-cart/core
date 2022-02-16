<?php
#S-Cart/Core/Front/Models/ShopPaymentStatus.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopPaymentStatus extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    public $table = SC_DB_PREFIX.'shop_payment_status';
    protected $guarded   = [];
    protected $connection = SC_CONNECTION;
    protected static $listStatus = null;
    public static function getIdAll()
    {
        if (!self::$listStatus) {
            self::$listStatus = self::pluck('name', 'id')->all();
        }
        return self::$listStatus;
    }
}
