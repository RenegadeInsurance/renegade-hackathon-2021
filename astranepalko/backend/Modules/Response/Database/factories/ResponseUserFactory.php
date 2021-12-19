<?php
namespace Modules\Response\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ResponseUserFactory extends Factory
{
    protected $model = \Modules\Response\Entities\ResponseUser::class;

    public function definition()
    {
        return [
            "name" => $this->faker->name(),
            "email" => $this->faker->safeEmail(),
            "age" => $this->faker->numberBetween(18, 100),
            "gender" => ["male", "female"][rand(0, 1)],
            "location" => "Nepal",
            "state" => [1, 2, 3, 4, 5, 6, 7][rand(0,6)],
            "city" => $this->faker->name(),
        ];
    }
}

