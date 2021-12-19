<?php

namespace Modules\Assesment\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Assesment\Entities\Question;

class QuestionTableSeeder extends Seeder
{
    public function run(): void
    {
        Model::unguard();
        Question::factory(10)->create();
    }
}
