<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Investasi;
use App\Models\Pinjaman;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FundingController extends Controller
{
    public function storePinjaman(Request $request)
    {
        $userId = $request->input('users_id');
        $nama = $request->input('nama');
        $deskripsi = $request->input('deskripsi');
        $plafond = $request->input('plafond');
        $tenor = $request->input('tenor');
        $bagi_hasil = $request->input('bagi_hasil');

        // Database Transaction
        DB::beginTransaction();

        try {
            $user = User::find($userId);

            $pinjaman = new Pinjaman();
            $pinjaman->users_id = $userId;
            $pinjaman->nama = $nama;
            $pinjaman->deskripsi = $deskripsi;
            $pinjaman->alamat = $user->company_address;
            $pinjaman->plafond = $plafond;
            $pinjaman->bagi_hasil = $bagi_hasil;
            $pinjaman->tenor = $tenor;
            $pinjaman->deadline = date('Y-m-d', strtotime('+2 week'));
            $pinjaman->status = 'PENGAJUAN';
            $pinjaman->save();

            DB::commit();

            // Mengembalikan respon sukses
            return ResponseFormatter::success([
                'user' => $user,
                'pinjaman' => $pinjaman,
            ],'Funding Pinjaman successful');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Top up Failed', 500);
        }
    }

    public function getData()
    {
        $pinjaman = Pinjaman::get();
        return ResponseFormatter::success(
            $pinjaman,
            'Data list pinjaman berhasil diambil'
        );
    }

    public function storeInvestasi(Request $request)
    {
        $userId = $request->input('users_id');
        $pinjamanId = $request->input('pinjaman_id');
        $jumlah = $request->input('jumlah');

        // Database Transaction
        DB::beginTransaction();

        try {
            $invetasi = new Investasi();
            $invetasi->users_id = $userId;
            $invetasi->pinjaman_id = $pinjamanId;
            $invetasi->jumlah = $jumlah;
            $invetasi->save();

            DB::commit();

            // Mengembalikan respon sukses
            return ResponseFormatter::success([
                'invetasi' => $invetasi,
            ],'Funding Investasi successful');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Funding Investasi Failed', 500);
        }
    }
}
