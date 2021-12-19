<?php
namespace Modules\Assesment\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class AnswerFactory extends Factory
{
    protected $model = \Modules\Assesment\Entities\Answer::class;

    public function definition(): array
    {
        return [
            "answer" => $this->faker->paragraph() . "?",
            "weight" => $this->faker->randomFloat(2, 0, 1),
        ];
    }
}

