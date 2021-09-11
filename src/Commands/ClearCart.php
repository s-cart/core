<?php

namespace SCart\Core\Commands;

use Illuminate\Console\Command;
use SCart\Core\Library\ShoppingCart\CartModel;
use Carbon\Carbon;

class ClearCart extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sc:clear-cart';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clear cart expire';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        CartModel::where('instance', 'default')->where('updated_at', '<', Carbon::now()->subDays(config('cart.exprire.cart')))->delete();
        CartModel::where('instance', 'wishlist')->where('updated_at', '<', Carbon::now()->subDays(config('cart.exprire.wishlist')))->delete();
        CartModel::where('instance', 'compare')->where('updated_at', '<', Carbon::now()->subDays(config('cart.exprire.compare')))->delete();
    }
}
