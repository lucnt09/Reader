<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class postsSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {


        for ($i = 0; $i < 10; $i++) {

            DB::table('posts')->insert( [
                'title' => fake()->title,
                'content' => fake()->text(),
                'image' => fake()->imageUrl,
                'category_id' => rand(1, 10)
            ]);
        }

    }
}
