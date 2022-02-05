<?php

namespace SCart\Core\DB\Trait;

trait DataLocaleSeederTrait
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function runProcess()
    {
        $pathLocaleFull = base_path('vendor/s-cart/core/src/DB/locale.sql');
        $search = [
            '__SC_DB_PREFIX__',
        ];
        $replace = [
            SC_DB_PREFIX,
        ];
        $content = str_replace(
            $search,
            $replace,
            file_get_contents($pathLocaleFull)
        );
        \Illuminate\Support\Facades\DB::connection(SC_CONNECTION)->unprepared($content);
    }
}
