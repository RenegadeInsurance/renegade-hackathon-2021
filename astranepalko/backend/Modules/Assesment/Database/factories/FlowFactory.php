<?php
namespace Modules\Assesment\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class FlowFactory extends Factory
{
    protected $model = \Modules\Assesment\Entities\Flow::class;

    public function definition(): array
    {
        return [
            "name" => $this->faker->name(),
        ];
    }
}

