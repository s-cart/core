<?php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;

class ShopSubCategoryDescription extends Model
{
    protected $primaryKey = ['sub_category_id', 'lang'];
    public $incrementing  = false;
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_sub_category_description';
    protected $connection = SC_CONNECTION;
    protected $guarded    = [];
}
