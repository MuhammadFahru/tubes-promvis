<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Wallet;
use App\Models\WalletHistory;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WalletController extends Controller
{
    public function topUp(Request $request)
    {
        $userId = $request->input('users_id'); // Mendapatkan user_id dari inputan
        $amount = $request->input('amount'); // Mendapatkan jumlah top up dari inputan

        // Database Transaction
        DB::beginTransaction();

        try {
            // Mencari wallet user berdasarkan user_id
            $wallet = Wallet::where('users_id', $userId)->first();

            $user = User::find($userId);

            if ($wallet) {
                $previousBalance = $wallet->balance;
                $newBalance = $previousBalance + $amount;

                // Melakukan update saldo pada wallet
                $wallet->balance = $newBalance;
                $wallet->save();

                // Membuat entri dalam history
                $history = new WalletHistory();
                $history->wallet_id = $wallet->id;
                $history->transaction_type = 'TOP UP';
                $history->amount = $amount;
                $history->previous_balance = $previousBalance;
                $history->current_balance = $newBalance;
                $history->save();

                DB::commit();

                // Mengembalikan respon sukses
                return ResponseFormatter::success([
                    'user' => $user,
                    'wallet' => $wallet,
                    'history' => $history
                ],'Top up successful');
            } else {
                DB::rollback();
                // Mengembalikan respon error jika wallet tidak ditemukan
                return ResponseFormatter::error([],'Wallet not found', 404);
            }
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Top up Failed', 500);
        }
    }

    public function withdraw(Request $request)
    {
        $userId = $request->input('users_id'); // Mendapatkan user_id dari inputan
        $amount = $request->input('amount'); // Mendapatkan jumlah penarikan dari inputan

        // Database Transaction
        DB::beginTransaction();

        try {
            // Mencari wallet user berdasarkan user_id
            $wallet = Wallet::where('users_id', $userId)->first();

            $user = User::find($userId);

            if ($wallet) {
                $user = User::find($userId);

                // Pastikan saldo wallet mencukupi untuk penarikan
                if ($wallet->balance >= $amount) {
                    $previousBalance = $wallet->balance;

                    // Kurangi saldo wallet
                    $wallet->balance -= $amount;
                    $wallet->save();

                    // Update saldo bank di tabel users
                    // $user->bank_balance += $amount;
                    // $user->save();

                    // Membuat entri dalam history
                    $history = new WalletHistory;
                    $history->wallet_id = $wallet->id;
                    $history->transaction_type = 'WITHDRAW';
                    $history->amount = $amount;
                    $history->previous_balance = $previousBalance;
                    $history->current_balance = $wallet->balance;
                    $history->save();

                    DB::commit();

                    // Mengembalikan respon sukses
                    return ResponseFormatter::success([
                        'user' => $user,
                        'wallet' => $wallet,
                        'history' => $history
                    ],'Withdraw successful');
                } else {
                    DB::rollback();
                    // Mengembalikan respon error jika saldo wallet tidak mencukupi
                    return ResponseFormatter::error([], 'Insufficient wallet balance', 400);
                }
            } else {
                DB::rollback();
                // Mengembalikan respon error jika wallet tidak ditemukan
                return ResponseFormatter::error([], 'Wallet not found', 404);
            }
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Withdraw Failed', 500);
        }
    }
}
