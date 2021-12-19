<aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
    <div class="py-4 text-gray-500 dark:text-gray-400">
        <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
            {{ config("app.name") }}
        </a>
        <ul class="mt-6">
            <x-sidebar.menu-item icon="home">
                Dashboard
            </x-sidebar.menu-item>
            <x-sidebar.menu-item icon="forms" route="login">
                Forms
            </x-sidebar.menu-item>
            <x-sidebar.menu-item icon="cards" route="login">
                Cards
            </x-sidebar.menu-item>
            <x-sidebar.menu-item icon="charts" route="login">
                Charts
            </x-sidebar.menu-item>
            <x-sidebar.menu-item icon="buttons" route="login">
                Buttons
            </x-sidebar.menu-item>
            <x-sidebar.menu-item icon="modals" route="login">
                Modals
            </x-sidebar.menu-item>
            <x-sidebar.menu-item icon="table" route="login">
                Tables
            </x-sidebar.menu-item>

            <x-sidebar.menu-dropdown title="Test">
                <x-sidebar.menu-item route="login">
                    Login
                </x-sidebar.menu-item>
                <x-sidebar.menu-item route="login">
                    Register
                </x-sidebar.menu-item>
                <x-sidebar.menu-item route="login">
                    Error Page
                </x-sidebar.menu-item>
                <x-sidebar.menu-item route="login">
                    Blank Page
                </x-sidebar.menu-item>
            </x-sidebar.menu-dropdown>
        </ul>
    </div>
</aside>
