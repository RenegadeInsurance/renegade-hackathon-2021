<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@yield("title", config("app.name") . " Dashboard")</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" />
    <link rel="stylesheet" href="{{ Storage::url("assets/css/tailwind.output.css") }}" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="{{ Storage::url("assets/js/init-alpine.js") }}"></script>

    @stack("head-links")
    @stack("styles")
</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        @include("core::partials.sidebar")
        @include("core::partials.sidebar-mobile")

        <div class="flex flex-col flex-1 w-full">
            @include('core::partials.topbar')

            <main class="h-full overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    @if (isset($slot) && !empty($slot))
                        {{ $slot }}
                    @else
                        @yield("content")
                    @endif
                </div>
            </main>
        </div>
    </div>

    @stack("scripts")
</body>

</html>
