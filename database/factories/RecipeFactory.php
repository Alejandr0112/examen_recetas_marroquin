<?php

namespace Database\Factories;

use App\Models\Chef;
use Illuminate\Database\Eloquent\Factories\Factory;

class RecipeFactory extends Factory
{
    public function definition(): array
    {
        return [
            'title' => $this->faker->words($this->faker->numberBetween(3, 5), true),
            'category' => $this->faker->randomElement([
                'Entrada',
                'Plato fuerte',
                'Postre',
                'Bebida',
                'Sopa',
            ]),
            'preparation_time' => $this->faker->numberBetween(10, 120),
            'chef_id' => Chef::factory(),
        ];
    }
}
