<?php

namespace Modules\Assesment\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Assesment\Entities\Answer;

class AnswerTableSeeder extends Seeder
{
    public function run(): void
    {
        Model::unguard();
        Answer::factory(10)->create();
    }
}
