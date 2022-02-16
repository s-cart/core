<?php
#S-Cart/Core/Front/Models/ShopProductProperty.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductProperty extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    public $table = SC_DB_PREFIX.'shop_product_property';
    protected $guarded   = [];
    protected $connection = SC_CONNECTION;
}
