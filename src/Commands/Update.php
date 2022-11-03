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
        try {
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

            // Add table for S-Cart 7.2
            if (!\Illuminate\Support\Facades\Schema::hasTable(SC_DB_PREFIX.'admin_password_resets')) {
                \Illuminate\Support\Facades\Schema::create(
                    SC_DB_PREFIX.'admin_password_resets',
                    function (\Illuminate\Database\Schema\Blueprint $table) {
                        $table->string('email', 150);
                        $table->string('token', 255);
                        $table->timestamp('created_at', $precision = 0);
                        $table->index('email');
                    }
                );
            }

            $this->info('Update done');
        } catch (Throwable $e) {
            sc_report($e->getMessage());
            echo  json_encode(['error' => 1, 'msg' => $e->getMessage()]);
            exit();
        }
    }
}
