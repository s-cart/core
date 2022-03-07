<?php

namespace SCart\Core\DB\Traits;

use Illuminate\Support\Str;
use DB;
trait DataSampleSeederTrait
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


        $arrayIdCategory = $this->arrayIdCategory();
        $dataCategory = $this->dataCategory($arrayIdCategory);
        $db->table(SC_DB_PREFIX.'shop_category')->insert($dataCategory);

        $dataCategoryStore = $this->dataCategoryStore($dataCategory);
        $db->table(SC_DB_PREFIX.'shop_category_store')->insert($dataCategoryStore);

        $dataCategoryDescription = $this->dataCategoryDescription($dataCategory);
        $db->table(SC_DB_PREFIX.'shop_category_description')->insert($dataCategoryDescription);

        $dataSupplier = $this->dataSupplier();
        $db->table(SC_DB_PREFIX.'shop_supplier')->insert($dataSupplier);

        $dataBrand = $this->dataBrand();
        $db->table(SC_DB_PREFIX.'shop_brand')->insert($dataBrand);

        $dataBrandStore = $this->dataBrandStore($dataBrand);
        $db->table(SC_DB_PREFIX.'shop_brand_store')->insert($dataBrandStore);

        $dataBanner = $this->dataBanner();
        $db->table(SC_DB_PREFIX.'shop_banner')->insert($dataBanner);

        $dataBannerStore = $this->dataBannerStore($dataBanner);
        $db->table(SC_DB_PREFIX.'shop_banner_store')->insert($dataBannerStore);


        $mappingIdProduct = $this->mappingIdProduct($arrayIdCategory);
        $arrayIdProduct = $mappingIdProduct['arrId'];

        $dataProduct = $this->dataProduct($dataBrand, $dataSupplier, $mappingIdProduct);
        $db->table(SC_DB_PREFIX.'shop_product')->insert($dataProduct);

        $dataProductStore = $this->dataProductStore($arrayIdProduct);
        $db->table(SC_DB_PREFIX.'shop_product_store')->insert($dataProductStore);

        $dataProductDescription = $this->dataProductDescription($dataProduct);
        $db->table(SC_DB_PREFIX.'shop_product_description')->insert($dataProductDescription);

        $db->table(SC_DB_PREFIX.'shop_product_build')->insert($mappingIdProduct['arrBuild']);
        $db->table(SC_DB_PREFIX.'shop_product_group')->insert($mappingIdProduct['arrGroup']);
        $db->table(SC_DB_PREFIX.'shop_product_promotion')->insert($mappingIdProduct['arrPromotion']);
        $db->table(SC_DB_PREFIX.'shop_product_image')->insert($mappingIdProduct['arrImage']);
        $db->table(SC_DB_PREFIX.'shop_product_category')->insert($mappingIdProduct['arrCategory']);
        $db->table(SC_DB_PREFIX.'shop_product_attribute')->insert($mappingIdProduct['arrAtt']);
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
                'news_id' => $id, 'lang' => 'en', 'title' => 'Easy Polo Black Edition '.$key, 'content' =>  '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'
            ];
            $dataNewsDescription[] = [
                'news_id' => $id, 'lang' => 'vi', 'title' => 'Easy Polo Black Edition '.$key, 'content' =>  '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'
            ];
        }
        return $dataNewsDescription;
    }

    public function dataNewsStore($ids) {
        $dataNewsStore = [];
        foreach ($ids as $key => $id) {
            $dataNewsStore[] = [
                'news_id' => $id, 'store_id' => 1
            ];
        }
        return $dataNewsStore;
    }

    public function arrayIdCategory() {
        $ids = [];
        for ($i=1; $i <= 13; $i++) {
            $ids[$i] = (string)Str::orderedUuid();
        }
        return $ids;
    }

    public function dataCategory($arrayIdCategory) {
        $dataCategory = [];
        $dataCategory[] = ['id' => $arrayIdCategory[1], 'alias' => 'am-thuc', 'image' => '/data/category/category.jpg', 'parent' => 0, 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[2], 'alias' => 'trai-cay', 'image' => '/data/category/category.jpg', 'parent' => 0, 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[3], 'alias' => 'thu-cong-my-nghe', 'image' => '/data/category/category.jpg', 'parent' => 0, 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[4], 'alias' => 'bun-pho', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[1], 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[5], 'alias' => 'banh-my', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[1], 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[6], 'alias' => 'trai-cay-nam-bo', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[2], 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[7], 'alias' => 'trai-cay-mien-bac', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[2], 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[8], 'alias' => 'che-thai-nguyen', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[2], 'top' => 0, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[9], 'alias' => 'toi-ly-son', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[2], 'top' => 0, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[10], 'alias' => 'gom-bat-trang', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[3], 'top' => 1, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[11], 'alias' => 'tranh-dong-ho', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[3], 'top' => 0, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[12], 'alias' => 'du-lich', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[3], 'top' => 0, 'sort' => 0, 'status' => 1];
        $dataCategory[] = ['id' => $arrayIdCategory[13], 'alias' => 'nhac-co-truyen', 'image' => '/data/category/category.jpg', 'parent' => $arrayIdCategory[2], 'top' => 0, 'sort' => 0, 'status' => 1];
        return $dataCategory;
    }

    public function dataCategoryStore($dataCate) {
        $dataCategoryStore = [];
        foreach ($dataCate as  $cate) {
            $dataCategoryStore[] = [
                'category_id' => $cate['id'], 'store_id' => 1
            ];
        }
        return $dataCategoryStore;
    }

    public function dataCategoryDescription($dataCate) {
        $dataCategoryDescription = [];
        foreach ($dataCate as  $cate) {
            $dataCategoryDescription[] = [
                'category_id' => $cate['id'],'lang' => 'en','title' => Str::title(str_replace('-', ' ', $cate['alias']))
            ];
            $dataCategoryDescription[] = [
                'category_id' => $cate['id'],'lang' => 'vi','title' => Str::title(str_replace('-', ' ', $cate['alias']))
            ];
        }
        return $dataCategoryDescription;
    }

    public function dataSupplier() {
        $dataSupplier = [];
        $id1 = (string)Str::orderedUuid();
        $id2 = (string)Str::orderedUuid();
        $dataSupplier[$id1] = ['id' => $id1, 'alias' => 'supplier-abc', 'name' => 'Supplier ABC','email' => 'abc@gmail.com','phone' => '0123456789', 'image' => '/data/supplier/supplier.jpg', 'store_id' => 1];
        $dataSupplier[$id2] = ['id' => $id2, 'alias' => 'supplier-xyz', 'name' => 'Supplier XYZ','email' => 'xyz@gmail.com','phone' => '0987654321', 'image' => '/data/supplier/supplier.jpg', 'store_id' => 1];
        return $dataSupplier;
    }

    public function dataBrand() {
        $dataBrand = [];
        for ($i=1; $i <=9 ; $i++) { 
            ${'id'.$i} = (string)(string)Str::orderedUuid();
        }
        $dataBrand[$id1] = ['id' => $id1, 'alias' => 'danang', 'name' => 'DaNang','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id2] = ['id' => $id2, 'alias' => 'saigon', 'name' => 'SaiGon','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id3] = ['id' => $id3, 'alias' => 'hanoi', 'name' => 'HaNoi','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id4] = ['id' => $id4, 'alias' => 'bentre', 'name' => 'BenTre','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id5] = ['id' => $id5, 'alias' => 'nghean', 'name' => 'NgheAn','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id6] = ['id' => $id6, 'alias' => 'longan', 'name' => 'LongAn','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id7] = ['id' => $id7, 'alias' => 'camau', 'name' => 'CaMau','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id8] = ['id' => $id8, 'alias' => 'hagiang', 'name' => 'HaGiang','image' => '/data/brand/brand.jpg','status' =>1];
        $dataBrand[$id9] = ['id' => $id9, 'alias' => 'thanhhoa', 'name' => 'ThanhHoa','image' => '/data/brand/brand.jpg','status' =>1];
        return $dataBrand;
    }

    public function dataBrandStore($dataBrand) {
        $dataBrandStore = [];
        foreach ($dataBrand as  $brand) {
            $dataBrandStore[] = [
                'brand_id' => $brand['id'], 'store_id' => 1
            ];
        }
        return $dataBrandStore;
    }

    public function dataBanner() {
        $dataBanner = [];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner home 1','image' => '/data/banner/banner-home-1.jpg','status' => 1, 'html' => '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 'target' => '_self', 'type' => 'banner'];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner home 2','image' => '/data/banner/banner-home-2.jpg','status' => 1, 'html' => '<h1 class="swiper-title-1" data-caption-animate="fadeScale" data-caption-delay="100">Top-notch Furniture</h1><p class="biggest text-white-70" data-caption-animate="fadeScale" data-caption-delay="200">Sofa Store provides the best furniture and accessories for homes and offices.</p><div class="button-wrap" data-caption-animate="fadeInUp" data-caption-delay="300"> <span class="button button-zachem-tak-delat button-white button-zakaria"> Shop now</span> </div>', 'target' => '_self', 'type' => 'banner'];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner breadcrumb','image' => '/data/banner/breadcrumb.jpg','status' => 1, 'html' => '', 'target' => '_self', 'type' => 'breadcrumb'];
        $dataBanner[] = ['id' => (string)Str::orderedUuid(), 'title' => 'Banner store','image' => '/data/banner/banner-store.jpg','status' => 1, 'html' => '', 'target' => '_self', 'type' => 'banner-store'];
        return $dataBanner;
    }

    public function dataBannerStore($dataBanner) {
        $dataBannerStore = [];
        foreach ($dataBanner as  $banner) {
            $dataBannerStore[] = [
                'banner_id' => $banner['id'], 'store_id' => 1
            ];
        }
        return $dataBannerStore;
    }

    public function mappingIdProduct($arrayIdCategory) {
        $arrId = [];
        $arrBuild = [];
        $arrBuildId = [];
        $arrGroup = [];
        $arrGroupId = [];
        $arrPromotion = [];
        $arrImage = [];
        $arrCategory = [];
        $arrAtt = [];
        for ($i=1; $i <= 24; $i++) {
            $arrId[$i] = (string)Str::orderedUuid();
        }
        $arrBuild[] = ['build_id' => $arrId['5'],'product_id' => $arrId['3'], 'quantity' => 1];
        $arrBuild[] = ['build_id' => $arrId['5'],'product_id' => $arrId['7'], 'quantity' => 2];
        $arrBuild[] = ['build_id' => $arrId['10'],'product_id' => $arrId['13'], 'quantity' => 1];
        $arrBuild[] = ['build_id' => $arrId['10'],'product_id' => $arrId['17'], 'quantity' => 2];
        $arrBuild[] = ['build_id' => $arrId['15'],'product_id' => $arrId['16'], 'quantity' => 1];
        $arrBuild[] = ['build_id' => $arrId['15'],'product_id' => $arrId['14'], 'quantity' => 2];
        $arrBuild[] = ['build_id' => $arrId['20'],'product_id' => $arrId['13'], 'quantity' => 2];
        $arrBuild[] = ['build_id' => $arrId['20'],'product_id' => $arrId['3'], 'quantity' => 2];

        $arrBuildId = [$arrId['5'],$arrId['10'],$arrId['15'],$arrId['20']];

        $arrGroup[] = ['group_id' => $arrId['4'],'product_id' => $arrId['2']];
        $arrGroup[] = ['group_id' => $arrId['4'],'product_id' => $arrId['6']];
        $arrGroup[] = ['group_id' => $arrId['14'],'product_id' => $arrId['2']];
        $arrGroup[] = ['group_id' => $arrId['14'],'product_id' => $arrId['12']];
        $arrGroup[] = ['group_id' => $arrId['19'],'product_id' => $arrId['11']];
        $arrGroup[] = ['group_id' => $arrId['19'],'product_id' => $arrId['21']];
        $arrGroup[] = ['group_id' => $arrId['23'],'product_id' => $arrId['3']];
        $arrGroup[] = ['group_id' => $arrId['23'],'product_id' => $arrId['7']];

        $arrGroupId = [$arrId['4'],$arrId['14'],$arrId['19'],$arrId['23']];

        $arrPromotion[] = ['product_id' => $arrId['1'], 'price_promotion' => 50];
        $arrPromotion[] = ['product_id' => $arrId['2'], 'price_promotion' => 30];
        $arrPromotion[] = ['product_id' => $arrId['6'], 'price_promotion' => 50];
        $arrPromotion[] = ['product_id' => $arrId['8'], 'price_promotion' => 40];
        $arrPromotion[] = ['product_id' => $arrId['12'], 'price_promotion' => 50];
        $arrPromotion[] = ['product_id' => $arrId['16'], 'price_promotion' => 30];
        $arrPromotion[] = ['product_id' => $arrId['18'], 'price_promotion' => 60];
        $arrPromotion[] = ['product_id' => $arrId['22'], 'price_promotion' => 50];

        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-2.png', 'product_id' => $arrId[1]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-11.png', 'product_id' => $arrId[1]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-8.png', 'product_id' => $arrId[11]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-6.png', 'product_id' => $arrId[2]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-13.png', 'product_id' => $arrId[11]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-12.png', 'product_id' => $arrId[5]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-17.png', 'product_id' => $arrId[5]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-11.png', 'product_id' => $arrId[2]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-5.png', 'product_id' => $arrId[2]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-12.png', 'product_id' => $arrId[9]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-15.png', 'product_id' => $arrId[8]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-19.png', 'product_id' => $arrId[7]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-12.png', 'product_id' => $arrId[7]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-1.png', 'product_id' => $arrId[5]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-12.png', 'product_id' => $arrId[4]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-7.png', 'product_id' => $arrId[15]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-12.png', 'product_id' => $arrId[15]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-16.png', 'product_id' => $arrId[17]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-6.png', 'product_id' => $arrId[17]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-12.png', 'product_id' => $arrId[17]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-18.png', 'product_id' => $arrId[22]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-19.png', 'product_id' => $arrId[22]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-24.png', 'product_id' => $arrId[24]];
        $arrImage[] = ['id' => (string)Str::orderedUuid(), 'image' => '/data/product/product-22.png', 'product_id' => $arrId[24]];

        $arrCategory[] = ['product_id' => $arrId[1], 'category_id' => $arrayIdCategory[13]];
        $arrCategory[] = ['product_id' => $arrId[2], 'category_id' => $arrayIdCategory[13]];
        $arrCategory[] = ['product_id' => $arrId[1], 'category_id' => $arrayIdCategory[10]];
        $arrCategory[] = ['product_id' => $arrId[1], 'category_id' => $arrayIdCategory[6]];
        $arrCategory[] = ['product_id' => $arrId[3], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[4], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[5], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[6], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[7], 'category_id' => $arrayIdCategory[12]];
        $arrCategory[] = ['product_id' => $arrId[8], 'category_id' => $arrayIdCategory[10]];
        $arrCategory[] = ['product_id' => $arrId[9], 'category_id' => $arrayIdCategory[6]];
        $arrCategory[] = ['product_id' => $arrId[10], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[11], 'category_id' => $arrayIdCategory[10]];
        $arrCategory[] = ['product_id' => $arrId[12], 'category_id' => $arrayIdCategory[9]];
        $arrCategory[] = ['product_id' => $arrId[13], 'category_id' => $arrayIdCategory[5]];
        $arrCategory[] = ['product_id' => $arrId[14], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[15], 'category_id' => $arrayIdCategory[6]];
        $arrCategory[] = ['product_id' => $arrId[16], 'category_id' => $arrayIdCategory[9]];
        $arrCategory[] = ['product_id' => $arrId[17], 'category_id' => $arrayIdCategory[9]];
        $arrCategory[] = ['product_id' => $arrId[18], 'category_id' => $arrayIdCategory[9]];
        $arrCategory[] = ['product_id' => $arrId[19], 'category_id' => $arrayIdCategory[6]];
        $arrCategory[] = ['product_id' => $arrId[20], 'category_id' => $arrayIdCategory[11]];
        $arrCategory[] = ['product_id' => $arrId[21], 'category_id' => $arrayIdCategory[10]];
        $arrCategory[] = ['product_id' => $arrId[22], 'category_id' => $arrayIdCategory[10]];
        $arrCategory[] = ['product_id' => $arrId[23], 'category_id' => $arrayIdCategory[12]];
        $arrCategory[] = ['product_id' => $arrId[24], 'category_id' => $arrayIdCategory[9]];


        $arrAtt[] = ['name' => 'Blue', 'attribute_group_id' => 1, 'product_id' => $arrId[24], 'add_price' => 5];
        $arrAtt[] = ['name' => 'White', 'attribute_group_id' => 1, 'product_id' => $arrId[24], 'add_price' => 0];
        $arrAtt[] = ['name' => 'S', 'attribute_group_id' => 2, 'product_id' => $arrId[24], 'add_price' => 2];
        $arrAtt[] = ['name' => 'XL', 'attribute_group_id' => 2, 'product_id' => $arrId[24], 'add_price' => 3];
        $arrAtt[] = ['name' => 'Blue', 'attribute_group_id' => 1, 'product_id' => $arrId[12], 'add_price' => 10];
        $arrAtt[] = ['name' => 'Red', 'attribute_group_id' => 1, 'product_id' => $arrId[12], 'add_price' => 0];
        $arrAtt[] = ['name' => 'S', 'attribute_group_id' => 2, 'product_id' => $arrId[12], 'add_price' => 0];
        $arrAtt[] = ['name' => 'M', 'attribute_group_id' => 2, 'product_id' => $arrId[12], 'add_price' => 0];

        $data['arrId'] = $arrId;
        $data['arrBuild'] = $arrBuild;
        $data['arrBuildId'] = $arrBuildId;
        $data['arrGroup'] = $arrGroup;
        $data['arrGroupId'] = $arrGroupId;
        $data['arrPromotion'] = $arrPromotion;
        $data['arrImage'] = $arrImage;
        $data['arrCategory'] = $arrCategory;
        $data['arrAtt'] = $arrAtt;
        return $data;
    }

    public function dataProduct($dataBrand, $dataSupplier, $mappingIdProduct) {
        $arrId = $mappingIdProduct['arrId'];
        $dataProduct = [];
        $arrPrice = [50,40,30];
        $arrSku = ['PHO-BO', 'NEM-NUONG', 'BANH-GAI','BUN-HUE','BANH-TRANG','MUOI-TAY-NINH','NHAN-LONG','SAU-RIENG','BIA-SAIGON','BIA-HANOI','NUOC-MAM','BANH-MYCAY','HU-TIEU',
        'CANH-CHUA','MANG-CUT','CAM-VINH','VAI-THIEU','NON-LA','AO-DAI','XOAI-CAT','COM-NIU','NHAN-LONG-HUNG-YEN','VAI-THIEU-LUC-NGAN','NEM-CHUA-THANH-HOA'];
        for ($i=1; $i <= 24; $i++) {
            $kind = SC_PRODUCT_SINGLE;
            if (in_array($arrId[$i], $mappingIdProduct['arrGroupId'])) {
                $kind = SC_PRODUCT_GROUP; 
            }
            if (in_array($arrId[$i], $mappingIdProduct['arrBuildId'])) {
                $kind = SC_PRODUCT_BUILD; 
            }
            $dataProduct[$arrId[$i]] = [
                'id' => $arrId[$i],'sku' => $arrSku[($i-1)],'alias' => strtolower($arrSku[($i-1)]),'image' => '/data/product/product-'.$i.'.png','price' => $arrPrice[array_rand($arrPrice)],'stock' => 100, 'status' => 1,'tax_id' => 'auto','kind' => $kind,
                'brand_id'=> array_rand($dataBrand), 'supplier_id' => array_rand($dataSupplier)
            ];
        }
        return $dataProduct;
    }

    public function dataProductStore($arrayIdProduct) {
        $dataProductStore = [];
        foreach ($arrayIdProduct as  $id) {
            $dataProductStore[] = [
                'product_id' => $id, 'store_id' => 1
            ];
        }
        return $dataProductStore;
    }

    public function dataProductDescription($dataProduct) {
        $dataProductDescription = [];
        foreach ($dataProduct as $product) {
            $dataProductDescription[] = [
                'product_id' => $product['id'], 'lang' => 'en', 'name' => Str::title(str_replace('-', ' ', $product['alias'])), 'content' =>  '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'
            ];
            $dataProductDescription[] = [
                'product_id' => $product['id'], 'lang' => 'vi', 'name' => Str::title(str_replace('-', ' ', $product['alias'])), 'content' =>  '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt="" src="/data/product/product-10.png" style="width: 150px; float: right; margin: 10px;" /></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'
            ];
        }
        return $dataProductDescription;
    }
}
