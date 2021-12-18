<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Modules\Assesment\Database\Seeders\AssesmentDatabaseSeeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call(AssesmentDatabaseSeeder::class);
    }
}
