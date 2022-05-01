<?php
#S-Cart/Core/Front/Models/ShopOrderDetail.php
namespace SCart\Core\Front\Models;

use SCart\Core\Front\Models\ShopProduct;
use Illuminate\Database\Eloquent\Model;

class ShopOrderDetail extends Model
{
    use \SCart\Core\Front\Models\ModelTrait;
    use \SCart\Core\Front\Models\UuidTrait;
    
    protected $table = SC_DB_PREFIX.'shop_order_detail';
    protected $connection = SC_CONNECTION;
    protected $guarded = [];
    public function order()
    {
        return $this->belongsTo(ShopOrder::class, 'order_id', 'id');
    }

    public function product()
    {
        return $this->belongsTo(ShopProduct::class, 'product_id', 'id');
    }

    public function updateDetail($id, $data)
    {
        return $this->where('id', $id)->update($data);
    }
    public function addNewDetail(array $data)
    {
        if ($data) {
            $this->insert($data);
            //Update stock, sold
            foreach ($data as $key => $item) {
                //Update stock, sold
                ShopProduct::updateStock($item['product_id'], $item['qty']);
            }
        }
    }

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(
            function ($model) {
                //
            }
        );

        //Uuid
        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = sc_generate_id($type = 'shop_order_detail');
            }
        });
    }
}
