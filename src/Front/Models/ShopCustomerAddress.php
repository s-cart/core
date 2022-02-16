<?php
#S-Cart/Core/Front/Models/ShopCustomerAddress.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopCustomerAddress extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    use \SCart\Core\Front\Models\UuidTrait;

    protected $guarded    = [];
    public $table = SC_DB_PREFIX.'shop_customer_address';
    protected $connection = SC_CONNECTION;

    protected static function boot()
    {
        parent::boot();
        //Uuid
        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = sc_generate_id($type = 'shop_customer_address');
            }
        });
    }
}
