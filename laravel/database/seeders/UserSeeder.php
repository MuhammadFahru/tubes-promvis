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
                'password' => Hash::make("admin12345"),
                'salt_pw' => 'admin12345',
                'roles' => 'Admin',
                'is_active' => true,
                'nama' => 'Admin',
            ],
            [
                'email' => 'verifikator@gmail.com',
                'password' => Hash::make("verifikator123"),
                'salt_pw' => 'verifikator123',
                'roles' => 'Verifikator',
                'is_active' => true,
                'nama' => 'Verifikator',
            ]
        ));
    }
}
