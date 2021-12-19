<?php

namespace Modules\Core\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\ServiceProvider;
use Modules\Core\View\Components\Sidebar\MenuDropdown;
use Modules\Core\View\Components\Sidebar\MenuItem;
use Modules\Core\View\Components\Topbar\Notification;
use Modules\Core\View\Components\Topbar\Profile;

class CoreServiceProvider extends ServiceProvider
{
    protected $moduleName = 'Core';
    protected $moduleNameLower = 'core';

    public function boot(): void
    {
        $this->registerTranslations();
        $this->registerConfig();
        $this->registerViews();
        $this->loadMigrationsFrom(module_path($this->moduleName, 'Database/Migrations'));
        $this->registerComponents();
    }

    public function register(): void
    {
        $this->app->register(RouteServiceProvider::class);
    }

    protected function registerConfig(): void
    {
        $this->publishes(
            [
                module_path($this->moduleName, 'Config/config.php') => config_path($this->moduleNameLower . '.php'),
            ],
            'config'
        );
        $this->mergeConfigFrom(
            module_path($this->moduleName, 'Config/config.php'),
            $this->moduleNameLower
        );
        $this->mergeConfigFrom(
            module_path($this->moduleName, 'Config/permissions.php'),
            "permissions"
        );
    }

    public function registerViews(): void
    {
        $viewPath = resource_path('views/modules/' . $this->moduleNameLower);

        $sourcePath = module_path($this->moduleName, 'Resources/views');

        $this->publishes([
            $sourcePath => $viewPath
        ], ['views', $this->moduleNameLower . '-module-views']);

        $this->loadViewsFrom(array_merge($this->getPublishableViewPaths(), [$sourcePath]), $this->moduleNameLower);
    }

    public function registerTranslations(): void
    {
        $langPath = resource_path('lang/modules/' . $this->moduleNameLower);

        if (is_dir($langPath)) {
            $this->loadTranslationsFrom($langPath, $this->moduleNameLower);
        } else {
            $this->loadTranslationsFrom(module_path($this->moduleName, 'Resources/lang'), $this->moduleNameLower);
        }
    }

    public function provides(): array
    {
        return [];
    }

    private function getPublishableViewPaths(): array
    {
        $paths = [];
        foreach (Config::get('view.paths') as $path) {
            if (is_dir($path . '/modules/' . $this->moduleNameLower)) {
                $paths[] = $path . '/modules/' . $this->moduleNameLower;
            }
        }
        return $paths;
    }

    public function registerComponents(): void
    {
        Blade::component('sidebar.menu-item', MenuItem::class);
        Blade::component('sidebar.menu-dropdown', MenuDropdown::class);
        Blade::component('topbar.notification', Notification::class);
        Blade::component('topbar.profile', Profile::class);
    }
}
