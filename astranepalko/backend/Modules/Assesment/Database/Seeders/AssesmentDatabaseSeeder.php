<?php

namespace Modules\Assesment\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class AssesmentDatabaseSeeder extends Seeder
{
    public function run(): void
    {
        Model::unguard();
        $this->call(QuestionTableSeeder::class);
    }
}
