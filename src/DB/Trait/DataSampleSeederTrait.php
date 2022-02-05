<?php

namespace SCart\Core\DB\Trait;

trait DataSampleSeederTrait
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function runProcess()
    {
        $pathSampleFull = base_path('vendor/s-cart/core/src/DB/sample.sql');
        $search = [
            '__SC_DB_PREFIX__',
        ];
        $replace = [
            SC_DB_PREFIX,
        ];
        $content = str_replace(
            $search,
            $replace,
            file_get_contents($pathSampleFull)
        );
        \Illuminate\Support\Facades\DB::connection(SC_CONNECTION)->unprepared($content);
    }
}
