<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Faq;
use Illuminate\Http\Request;

class FaqController extends Controller
{
    public function getDataPeminjam()
    {
        $faq = Faq::where('kategori', 'Peminjam')->get();
        return ResponseFormatter::success(
            $faq,
            'Data list FAQs Peminjam berhasil diambil'
        );
    }

    public function getDataInvestor()
    {
        $faq = Faq::where('kategori', 'Investor')->get();
        return ResponseFormatter::success(
            $faq,
            'Data list FAQs Investor berhasil diambil'
        );
    }
}
