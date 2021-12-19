<li class="relative {{ $icon ? 'px-6 py-3' : 'px-2 py-1' }}">
    @if ($active == true)
    <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg" aria-hidden="true"></span>
    @endif
    <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 {{ $active ? "text-gray-800 dark:text-gray-100" : "" }} {{ $class }}" href="{{ route($route) }}" {{ $attributes }}>
        @if ($icon)
        <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
            @include("core::components.sidebar.icons.{$icon}")
        </svg>
        @endif
        <span class="{{ $icon ? 'ml-4' : '' }}">
            {{ !empty(trim($slot)) ? $slot : "Menu Item" }}
        </span>
    </a>
</li>
