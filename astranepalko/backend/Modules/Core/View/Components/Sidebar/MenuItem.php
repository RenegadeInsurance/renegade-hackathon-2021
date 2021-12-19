<?php
namespace Modules\Core\View\Components\Sidebar;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Support\Facades\Route;
use Illuminate\View\Component;

class MenuItem extends Component
{
    public string $route;
    public string $class;
    public ?string $icon;
    public bool $active;

    public function __construct(
        string $route = "home",
        string $class = "",
        ?string $icon = null
    ) {
        $this->route = $route;
        $this->class = $class;
        $this->icon = $icon;
        $this->active = Route::currentRouteName() == $route ? true : false;
    }

    public function render(): Renderable
    {
        return view('core::components.sidebar.menu-item');
    }
}
