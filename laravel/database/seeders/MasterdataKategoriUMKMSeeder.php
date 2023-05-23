<?php

namespace Database\Seeders;

use App\Models\MasterdataKategoriUMKM;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MasterdataKategoriUMKMSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        MasterdataKategoriUMKM::insert(array(
            [
                'nama' => 'Usaha Mikro',
                'deskripsi' => 'Usaha mikro adalah usaha yang dimiliki oleh perorangan atau badan usaha milik perorangan. Kriteria usaha mikro adalah memiliki kekayaan bersih maksimal Rp50.000.000 selain tanah dan bangunan. Kriteria lain adalah hasil penjualan tahunan tak melebihi Rp300.000.000.',
                'is_active' => true,
            ],
            [
                'nama' => 'Usaha Kecil',
                'deskripsi' => 'Usaha kecil adalah usaha yang berdiri sendiri dan dimiliki oleh perorangan atau badan usaha. Usaha ini bukan anak perusahaan atau cabang perusahaan dari usaha menengah atau usaha besar. Kekayaan bersih pelaku usaha kecil adalah antara Rp50.000.000 hingga Rp500.000.000, selain tanah dan bangunan tempat usaha. Hasil penjualan adalah antara Rp300.000.000 hingga Rp2.500.000.000 per tahun.',
                'is_active' => true,
            ],
            [
                'nama' => 'Usaha Menengah',
                'deskripsi' => 'Usaha menengah merupakan usaha ekonomi produktif yang berdiri sendiri. Usaha ini dimiliki orang perorangan atau badan usaha, tetapi bukan anak perusahaan besar atau cabang perusahaan besar. Jumlah kekayaan bersih pelaku usaha menengah adalah antara Rp500.000.000 hingga Rp10.000.000.000. Angka ini tidak termasuk tanah dan bangunan usaha. Selain itu, jumlah penjualan adalah Rp50.000.000.000 per tahun.',
                'is_active' => true,
            ],
        ));
    }
}
