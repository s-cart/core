<?php
#S-Cart/Core/Front/Models/ShopProductDownload.php
namespace SCart\Core\Front\Models;

use Illuminate\Database\Eloquent\Model;
use SCart\Core\Front\Models\ShopProduct;

class ShopProductDownload extends Model
{
    protected $primaryKey = ['download_path', 'product_id'];
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'shop_product_download';
    protected $connection = SC_CONNECTION;
    
    public function product()
    {
        return $this->belongsTo(ShopProduct::class, 'product_id', 'id');
    }
}
