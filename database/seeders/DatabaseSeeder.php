<?php

namespace Database\Seeders;

use App\Models\Chef;
use App\Models\Recipe;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        Chef::factory()
            ->count(10)
            ->create()
            ->each(function (Chef $chef): void {
                Recipe::factory()
                    ->count(3)
                    ->create([
                        'chef_id' => $chef->id,
                    ]);
            });
    }
}
