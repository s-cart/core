<?php

namespace SCart\Core\DB\Traits;

use Illuminate\Support\Str;
use DB;
trait DataSampleCmsSeederTrait
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function runProcess()
    {
        $db = DB::connection(SC_CONNECTION);

        $arrayIdNews = $this->arrayIdNews();

        $dataNews = $this->dataNews($arrayIdNews);
        $db->table(SC_DB_PREFIX.'shop_news')->insert($dataNews);

        $dataNewsDescription = $this->dataNewsDescription($arrayIdNews);
        $db->table(SC_DB_PREFIX.'shop_news_description')->insert($dataNewsDescription);

        $dataNewsStore = $this->dataNewsStore($arrayIdNews);
        $db->table(SC_DB_PREFIX.'shop_news_store')->insert($dataNewsStore);

        $dataBanner = $this->dataBanner();
        $db->table(SC_DB_PREFIX.'shop_banner')->insert($dataBanner);

        $dataBannerStore = $this->dataBannerStore($dataBanner);
        $db->table(SC_DB_PREFIX.'shop_banner_store')->insert($dataBannerStore);
    }

    public function arrayIdNews() {
        $ids = [];
        for ($i=1; $i <= 6; $i++) {
            $ids[$i] = (string)Str::orderedUuid();
        }
        return $ids;
    }

    public function dataNews($ids) {
        $dataNews = [];
        foreach ($ids as $key => $id) {
            $dataNews[] = [
                'id' => $id, 'alias' => 'demo-scart-blog-'.$key, 'image' => '/data/content/blog-'.$key.'.jpg', 'status' => 1, 'created_at' => date('Y-m-d H:i:s')
            ];
        }
        return $dataNews;
    }

    public function dataNewsDescription($ids) {
        $dataNewsDescription = [];
        foreach ($ids as $key => $id) {
            $dataNewsDescription[] = [
                'news_id' => $id, 'lang' => 'en', 'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','title' => 'Easy Polo Black Edition '.$key, 'content' =>  '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'
            ];
            $dataNewsDescription[] = [
                'news_id' => $id, 'lang' => 'vi', 'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','title' => 'Easy Polo Black Edition '.$key, 'content' =>  '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'
            ];
        }
        return $dataNewsDescription;
    }

    public function dataNewsStore($ids) {
        $dataNewsStore = [];
        foreach ($ids as $key => $id) {
            $dataNewsStore[] = [
                'news_id' => $id, 'store_id' => SC_ID_ROOT
            ];
        }
        return $dataNewsStore;
    }

    public function dataBanner() {
        $dataBanner = [];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner home 1 (s-cart-light)','image' => '/data/banner/banner-home-1.jpg','status' => 1, 'html' => '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 'target' => '_self', 'type' => 'banner'];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner home 2 (s-cart-light)','image' => '/data/banner/banner-home-2.jpg','status' => 1, 'html' => '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 'target' => '_self', 'type' => 'banner'];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner breadcrumb (s-cart-light)','image' => '/data/banner/breadcrumb.jpg','status' => 1, 'html' => '', 'target' => '_self', 'type' => 'breadcrumb'];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner store (s-cart-light)','image' => '/data/banner/banner-store.jpg','status' => 1, 'html' => '', 'target' => '_self', 'type' => 'banner-store'];
        return $dataBanner;
    }

    public function dataBannerStore($dataBanner) {
        $dataBannerStore = [];
        foreach ($dataBanner as  $banner) {
            $dataBannerStore[] = [
                'banner_id' => $banner['id'], 'store_id' => SC_ID_ROOT
            ];
        }
        return $dataBannerStore;
    }
}
