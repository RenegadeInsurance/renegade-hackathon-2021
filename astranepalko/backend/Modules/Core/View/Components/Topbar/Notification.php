<?php
namespace Modules\Core\View\Components\Topbar;

use Illuminate\View\Component;
use Illuminate\Contracts\Support\Renderable;

class Notification extends Component
{
    public function render(): Renderable
    {
        return view('core::components.topbar.notification');
    }
}
