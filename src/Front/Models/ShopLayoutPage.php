<?php
#S-Cart/Core/Front/Models/ShopLayoutPage.php
namespace S-Cart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopLayoutPage extends Model
{
    public $timestamps = false;
    public $table = SC_DB_PREFIX.'shop_layout_page';
    protected $connection = SC_CONNECTION;

    public static function getPages()
    {
        return self::pluck('name', 'key')->all();
    }
}
