<?php
namespace Modules\Core\View\Components\Sidebar;

use Illuminate\Support\Str;
use Illuminate\View\Component;
use Illuminate\Contracts\Support\Renderable;

class MenuDropdown extends Component
{
    public string $title;
    public string $key;

    public function __construct(
        string $title = "Dropdown"
    ) {
        $this->title = $title;
        $this->key = (string) Str::of($title)->camel();
    }

    public function render(): Renderable
    {
        return view('core::components.sidebar.menu-dropdown');
    }
}
