<?php
#S-Cart/Core/Front/Models/ShopLinkStore.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopLinkStore extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    protected $primaryKey = ['store_id', 'link_id'];
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_link_store';
    protected $connection = SC_CONNECTION;
}
