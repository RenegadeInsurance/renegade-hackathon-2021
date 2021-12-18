<?php

namespace Modules\Response\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Response\Entities\Response;

class ResponseTableSeeder extends Seeder
{
    public function run(): void
    {
        Model::unguard();
        Response::factory(1000)->create();
    }
}
