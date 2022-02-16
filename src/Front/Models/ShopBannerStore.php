<?php
#S-Cart/Core/Front/Models/ShopBannerStore.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopBannerStore extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    protected $primaryKey = ['store_id', 'banner_id'];
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_banner_store';
    protected $connection = SC_CONNECTION;
}
