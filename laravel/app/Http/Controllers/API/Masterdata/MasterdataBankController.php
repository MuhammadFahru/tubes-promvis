<?php

namespace App\Http\Controllers\API\Masterdata;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\MasterdataBank;
use Illuminate\Http\Request;

class MasterdataBankController extends Controller
{
    public function getData()
    {
        $bank = MasterdataBank::get();
        return ResponseFormatter::success(
            $bank,
            'Data list masterdata bank berhasil diambil'
        );
    }
}
