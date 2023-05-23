<?php

namespace App\Http\Controllers\API\Masterdata;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\MasterdataSektorUMKM;
use Illuminate\Http\Request;

class MasterdataSektorUMKMController extends Controller
{
    public function getData()
    {
        $sektor = MasterdataSektorUMKM::get();
        return ResponseFormatter::success(
            $sektor,
            'Data list sektor UMKM berhasil diambil'
        );
    }
}
