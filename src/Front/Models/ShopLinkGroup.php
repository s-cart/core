<?php
#S-Cart/Core/Front/Models/ShopLinkGroup.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopLinkGroup extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    public $table = SC_DB_PREFIX.'shop_link_group';
    protected $guarded   = [];
    protected $connection = SC_CONNECTION;
}
