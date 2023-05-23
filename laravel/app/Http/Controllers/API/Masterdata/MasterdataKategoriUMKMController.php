<?php

namespace App\Http\Controllers\API\Masterdata;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\MasterdataKategoriUMKM;
use Illuminate\Http\Request;

class MasterdataKategoriUMKMController extends Controller
{
    public function getData()
    {
        $kategori = MasterdataKategoriUMKM::get();
        return ResponseFormatter::success(
            $kategori,
            'Data list kategori UMKM berhasil diambil'
        );
    }
}
