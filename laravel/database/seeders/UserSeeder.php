<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::insert(array(
            [
                'email' => 'admin@gmail.com',
                'password' => Hash::make("@dm1N#123"),
                'salt_pw' => '@dm1N#123',
                'roles' => 'Admin',
                'is_active' => true,
                'nama' => 'Admin',
            ],
            [
                'email' => 'verifikator@gmail.com',
                'password' => Hash::make("v3r1Fikat0r#123"),
                'salt_pw' => 'v3r1Fikat0r#123',
                'roles' => 'Verifikator',
                'is_active' => true,
                'nama' => 'Verifikator',
            ]
        ));
    }
}
