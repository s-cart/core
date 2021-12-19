<?php

namespace SCart\Core\Commands;

use Illuminate\Console\Command;
use Throwable;
use DB;
use Illuminate\Support\Facades\Artisan;

class Update extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sc:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update S-Cart core"';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        Artisan::call('db:seed', 
        [
            '--class' => 'DataDefaultSeeder',
            '--force' => true
        ]
        );
        Artisan::call('db:seed', 
        [
            '--class' => 'DataLocaleSeeder',
            '--force' => true
        ]
        );
    }
}
