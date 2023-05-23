<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\MasterdataKategoriUMKM;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([UserSeeder::class, MasterdataBankSeeder::class, MasterdataKategoriUMKMSeeder::class, MasterdataSektorUMKMSeeder::class]);
    }
}
