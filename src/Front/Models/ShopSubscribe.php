<?php
#S-Cart/Core/Front/Models/ShopSubscribe.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopSubscribe extends Model
{
    public $table = SC_DB_PREFIX.'shop_subscribe';
    protected $guarded      = [];
    protected $connection = SC_CONNECTION;
}
