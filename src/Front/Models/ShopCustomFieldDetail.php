<?php
#S-Cart/Core/Front/Models/ShopCustomFieldDetail.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;
use Cache;
class ShopCustomFieldDetail extends Model
{
    public $timestamps     = false;
    public $table          = SC_DB_PREFIX.'shop_custom_field_detail';
    protected $connection  = SC_CONNECTION;
    protected $guarded     = [];

    //Function get text description 
    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($obj) {
            //
        }
        );
    }

}
