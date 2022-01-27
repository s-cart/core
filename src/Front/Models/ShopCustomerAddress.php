<?php
#S-Cart/Core/Front/Models/ShopCustomerAddress.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopCustomerAddress extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_customer_address';
    protected $connection = SC_CONNECTION;
}
