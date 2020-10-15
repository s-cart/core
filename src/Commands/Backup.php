<?php

namespace SCart\Core\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Process\Process;
use Throwable;

class Backup extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sc:backup {--path=}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Backup database "sc:backup --path=abc.sql"';
    const LIMIT = 10;

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $path = $this->option('path');
        if (count(glob(storage_path() . "/backups/*.sql")) >= self::LIMIT) {
            echo json_encode(['error' => 1, 'msg' => trans('backup.limit_backup')]);
            exit;
        }
        if($path) {
            $fileBackup = storage_path('backups/' . $path);
        } else {
            $fileBackup = storage_path('backups/backup-' . date('Y-m-d-H-i-s') . '.sql');
        }
        try {
            $string = sprintf(
                'mysqldump --user="%s" --password="%s" %s > %s',
                config('database.connections.'.SC_CONNECTION.'.username'),
                config('database.connections.'.SC_CONNECTION.'.password'),
                config('database.connections.'.SC_CONNECTION.'.database'),
                $fileBackup
            );
            Process::fromShellCommandline($string)->mustRun();
            echo json_encode(['error' => 0, 'msg' => 'Backup success path '.$fileBackup]);
            exit;
        } catch (Throwable $exception) {
            if (file_exists($fileBackup)) {
                @unlink($fileBackup);
            }
            sc_report($exception->getMessage());
            echo json_encode(['error' => 1, 'msg' => $exception->getMessage()]);
            exit;
        }
    }
}
