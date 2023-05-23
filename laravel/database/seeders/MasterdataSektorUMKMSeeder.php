<?php

namespace Database\Seeders;

use App\Models\MasterdataSektorUMKM;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MasterdataSektorUMKMSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        MasterdataSektorUMKM::insert(array(
            [
                'nama' => 'Kuliner',
                'deskripsi' => 'Usaha kuliner mencakup restoran, warung makan, kafe, warung kopi, katering, dan sejenisnya. UMKM kuliner menawarkan makanan dan minuman dengan berbagai pilihan menu dan variasi kuliner lokal maupun internasional.',
                'is_active' => true,
            ],
            [
                'nama' => 'Fashion dan Aksesoris',
                'deskripsi' => 'Kategori ini meliputi usaha pembuatan dan penjualan pakaian, sepatu, tas, perhiasan, aksesoris fashion, dan produk tekstil. UMKM dalam bidang fashion dan aksesoris sering kali mengedepankan desain unik, kreatif, dan gaya lokal yang memikat konsumen.',
                'is_active' => true,
            ],
            [
                'nama' => 'Kerajinan Tangan',
                'deskripsi' => 'Usaha kerajinan tangan melibatkan pembuatan produk-produk unik yang terbuat dari bahan seperti kayu, kain, logam, keramik, bambu, atau anyaman. UMKM dalam bidang ini menciptakan produk dengan sentuhan kreatif dan seni, seperti patung, ukiran, tenun, batik, dan lainnya.',
                'is_active' => true,
            ],
            [
                'nama' => 'Perdagangan Elektronik',
                'deskripsi' => ' UMKM yang berfokus pada perdagangan elektronik (e-commerce) menjual berbagai produk secara online melalui platform seperti marketplace atau toko online mereka sendiri. Kategori ini mencakup penjualan elektronik, perangkat gadget, pakaian, perlengkapan rumah tangga, dan produk lainnya.',
                'is_active' => true,
            ],
            [
                'nama' => 'Jasa Konsultasi',
                'deskripsi' => 'Kategori ini melibatkan penyediaan jasa konsultasi dalam berbagai bidang, seperti konsultasi manajemen, pemasaran, teknologi informasi, keuangan, hukum, sumber daya manusia, dan lainnya. UMKM yang bergerak di sektor jasa konsultasi membantu pelanggan mereka dalam mengatasi berbagai tantangan dan meningkatkan kinerja bisnis.',
                'is_active' => true,
            ],
            [
                'nama' => 'Pariwisata dan Wisata Kuliner',
                'deskripsi' => 'UMKM yang berfokus pada sektor pariwisata menawarkan berbagai layanan dan produk yang mendukung industri pariwisata, seperti penginapan, tur dan perjalanan, penyewaan kendaraan, dan penyediaan makanan dan minuman khas daerah wisata.',
                'is_active' => true,
            ],
            [
                'nama' => 'Kreatif dan Digital',
                'deskripsi' => 'Kategori ini mencakup UMKM yang bergerak di sektor kreatif dan digital, seperti agensi periklanan, desain grafis, fotografi, produksi video, pengembangan perangkat lunak, pengembangan aplikasi, dan sejenisnya. UMKM dalam bidang ini menghasilkan produk dan layanan berbasis kreativitas dan teknologi.',
                'is_active' => true,
            ],
            [
                'nama' => 'Kesehatan dan Kecantikan',
                'deskripsi' => 'UMKM yang bergerak di sektor kesehatan dan kecantikan menyediakan produk-produk dan layanan yang berkaitan dengan kesehatan, kebugaran, perawatan tubuh, kosmetik, dan perawatan kulit. Ini mencakup toko obat tradisional, klinik kecantikan, apotek, dan lainnya.',
                'is_active' => true,
            ],
            [
                'nama' => 'Pertanian dan Perkebunan',
                'deskripsi' => 'UMKM di sektor pertanian dan perkebunan terlibat dalam produksi dan perdagangan hasil pertanian seperti tanaman pangan, sayuran, buah-buahan, rempah-rempah, dan produk perkebunan lainnya. Kategori ini juga mencakup UMKM yang menghasilkan produk olahan dari bahan-bahan pertanian.',
                'is_active' => true,
            ],
            [
                'nama' => 'Pendidikan dan Pelatihan',
                'deskripsi' => 'UMKM yang berfokus pada sektor pendidikan dan pelatihan menyediakan layanan dalam bentuk kursus, pelatihan, bimbingan, atau les privat. Ini mencakup bidang pendidikan formal dan non-formal, seperti kursus bahasa, pelatihan komputer, les musik, bimbingan belajar, dan sejenisnya.',
                'is_active' => true,
            ],
        ));
    }
}
