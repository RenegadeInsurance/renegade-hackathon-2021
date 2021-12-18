<?php

namespace Modules\Assesment\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Assesment\Entities\Flow;

class FlowTableSeeder extends Seeder
{
    public function run(): void
    {
        Model::unguard();
        Flow::factory(10)->create();
    }
}
