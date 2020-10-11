<?php
#S-Cart/Core/Front/Models/ShopStoreCss.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopStoreCss extends Model
{
    protected $primaryKey = 'store_id';
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_store_css';
    protected $connection = SC_CONNECTION;
}
