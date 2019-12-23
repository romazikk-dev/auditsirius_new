<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
// use App\Grids\MessagesGridInterface;
// use App\Grids\MessagesGrid;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
        $this->app->bind('App\Grids\MessagesGridInterface', 'App\Grids\MessagesGrid');    
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
