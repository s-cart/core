<?php
#S-Cart/Core/Front/Models/ShopBannerType.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopBannerType extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    public $table = SC_DB_PREFIX.'shop_banner_type';
    protected $guarded   = [];
    protected $connection = SC_CONNECTION;
}
