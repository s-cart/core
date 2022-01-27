<?php
#S-Cart/Core/Front/Models/ShopCategoryStore.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopCategoryStore extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    protected $primaryKey = ['store_id', 'category_id'];
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_category_store';
    protected $connection = SC_CONNECTION;
}
