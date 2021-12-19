<?php
namespace Modules\Assesment\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class QuestionFactory extends Factory
{
    protected $model = \Modules\Assesment\Entities\Question::class;

    public function definition(): array
    {
        return [
            "question" => $this->faker->paragraph() . "?",
            "weight" => $this->faker->randomFloat(2, 0, 1),
        ];
    }
}

