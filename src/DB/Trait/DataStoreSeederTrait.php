<?php

namespace SCart\Core\DB\Trait;

trait DataStoreSeederTrait
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function runProcess()
    {
        $storeId = empty(session('lastStoreId')) ? 1 : session('lastStoreId');
        $pathStoreFull = base_path('vendor/s-cart/core/src/DB/store.sql');
        $search = [
            '__SC_DB_PREFIX__',
            '__storeId__',
        ];
        $replace = [
            SC_DB_PREFIX,
            $storeId,
        ];
        $content = str_replace(
            $search,
            $replace,
            file_get_contents($pathStoreFull)
        );
        \Illuminate\Support\Facades\DB::connection(SC_CONNECTION)->unprepared($content);
    }
}
