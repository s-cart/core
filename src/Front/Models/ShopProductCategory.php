<?php
#S-Cart/Core/Front/Models/ShopProductCategory.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductCategory extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    protected $primaryKey = ['category_id', 'product_id'];
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_product_category';
    protected $connection = SC_CONNECTION;
}
