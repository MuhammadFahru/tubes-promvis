<?php

namespace Database\Seeders;

use App\Models\MasterdataBank;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MasterdataBankSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        MasterdataBank::insert(array(
            [
                'nama' => 'PT BANK RAKYAT INDONESIA (PERSERO) Tbk',
                'alias' => 'BRI',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK MANDIRI (PERSERO) Tbk',
                'alias' => 'Mandiri',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK NEGARA INDONESIA (PERSERO) Tbk',
                'alias' => 'BNI',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK TABUNGAN NEGARA (PERSERO) Tbk',
                'alias' => 'BTN',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK CENTRAL ASIA Tbk',
                'alias' => 'BCA',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK DANAMON INDONESIA Tbk',
                'alias' => 'Danamon',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK PERMATA Tbk	',
                'alias' => 'Permata',
                'is_active' => true,
            ],
            [
                'nama' => 'PT BANK SYARIAH INDONESIA Tbk',
                'alias' => 'BSI',
                'is_active' => true,
            ],
        ));
    }
}
