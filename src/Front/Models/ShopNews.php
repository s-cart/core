<?php
#S-Cart/Core/Front/Models/ShopNews.php
namespace SCart\Core\Front\Models;

use SCart\Core\Front\Models\ShopNewsDescription;
use Illuminate\Database\Eloquent\Model;
use Cache;
use SCart\Core\Front\Models\ModelTrait;
class ShopNews extends Model
{
    use ModelTrait;

    public $table = SC_DB_PREFIX.'shop_news';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;

    public function descriptions()
    {
        return $this->hasMany(ShopNewsDescription::class, 'news_id', 'id');
    }

    //Function get text description 
    public function getText() {
        return $this->descriptions()->where('lang', sc_get_locale())->first();
    }
    public function getTitle() {
        return $this->getText()->title;
    }
    public function getDescription() {
        return $this->getText()->description;
    }
    public function getKeyword() {
        return $this->getText()->keyword;
    }
    public function getContent() {
        return $this->getText()->content;
    }
    //End  get text description

    /*
    Get thumb
    */
    public function getThumb()
    {
        return sc_image_get_path_thumb($this->image);
    }

    /*
    Get image
    */
    public function getImage()
    {
        return sc_image_get_path($this->image);

    }
    /**
     * [getUrl description]
     * @return [type] [description]
     */
    public function getUrl()
    {
        return sc_route('news.detail', ['alias' => $this->alias]);
    }

    //Scort
    public function scopeSort($query, $sortBy = null, $sortOrder = 'desc')
    {
        $sortBy = $sortBy ?? 'sort';
        return $query->orderBy($sortBy, $sortOrder);
    }


    /**
     * Get news detail
     *
     * @param   [string]  $key     [$key description]
     * @param   [string]  $type  [id, alias]
     *
     */
    public function getDetail($key, $type = null)
    {
        if(empty($key)) {
            return null;
        }
        $tableDescription = (new ShopNewsDescription)->getTable();
        $news = $this
            ->leftJoin($tableDescription, $tableDescription . '.news_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());

        if ($type === null) {
            $news = $news->where('id', (int) $key);
        } else {
            $news = $news->where($type, $key);
        }
        $news = $news->where('status', 1)
            ->where('store_id', config('app.storeId'))
            ->first();
        return $news;
    }

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($news) {
            $news->descriptions()->delete();
            }
        );
    }

    /**
     * Start new process get data
     *
     * @return  new model
     */
    public function start() {
        return new ShopNews;
    }

    /**
     * build Query
     */
    public function buildQuery() {
        $tableDescription = (new ShopNewsDescription)->getTable();

        //description
        $query = $this
            ->leftJoin($tableDescription, $tableDescription . '.news_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());
        //search keyword
        if ($this->sc_keyword !='') {
            $query = $query->where(function ($sql) use($tableDescription){
                $sql->where($tableDescription . '.title', 'like', '%' . $this->sc_keyword . '%')
                ->orWhere($tableDescription . '.keyword', 'like', '%' . $this->sc_keyword . '%')
                ->orWhere($tableDescription . '.description', 'like', '%' . $this->sc_keyword . '%');
            });
        }

        $query = $query->where('status', 1)
        ->where('store_id', config('app.storeId'));

        if (count($this->sc_moreWhere)) {
            foreach ($this->sc_moreWhere as $key => $where) {
                if(count($where)) {
                    $query = $query->where($where[0], $where[1], $where[2]);
                }
            }
        }

        if ($this->sc_random) {
            $query = $query->inRandomOrder();
        } else {
            if (is_array($this->sc_sort) && count($this->sc_sort)) {
                foreach ($this->sc_sort as  $rowSort) {
                    if(is_array($rowSort) && count($rowSort) == 2) {
                        $query = $query->sort($rowSort[0], $rowSort[1]);
                    }
                }
            }
        }

        return $query;
    }

}
