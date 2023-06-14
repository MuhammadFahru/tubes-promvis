<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\WalletInvestor;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Laravel\Fortify\Rules\Password;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function registerPeminjam(Request $request)
    {
        try {
//            $validator = Validator::make($request->all(), [
//                'name' => ['required', 'string', 'max:255'],
//                'username' => ['required', 'string', 'max:255', 'unique:users'],
//                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
//                'password' => ['required', 'string', new Password]
//            ]);
//
//            if ($validator->fails()) {
//                return ResponseFormatter::error([
//                    'message' => 'Validation Failed',
//                    'error' => $validator->errors(),
//                ],'Validation', 422);
//            }

            $user = new User();
            $user->nik = $request->nik;
            $user->nama = $request->nama;
            $user->email = $request->email;
            $user->no_handphone = $request->no_handphone;
            $user->salt_pw = $request->password;
            $user->password = Hash::make($request->password);
            $user->salt_pin = $request->pin;
            $user->pin = Hash::make($request->pin);
            $user->roles = 'Peminjam';
            $user->is_active = 1;
            $user->foto = $request->foto;
            $user->bank_id = $request->bank_id;
            $user->no_rekening = $request->no_rekening;
            $user->kategori_umkm_id = $request->kategori_umkm_id;
            $user->sektor_umkm_id = $request->sektor_umkm_id;
            $user->company_name = $request->company_name;
            $user->company_email = $request->company_email;
            $user->company_address = $request->company_address;
            $user->save();

            $tokenResult = $user->createToken('authToken')->plainTextToken;

            $user = User::select(
                'email',
                'roles',
                'nik',
                'nama',
                'no_handphone',
                'foto',
                'bank_id',
                'no_rekening',
                'kategori_umkm_id',
                'sektor_umkm_id',
                'company_name',
                'company_email',
                'company_address'
            )->where('email', $request->email)->first();

            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ],'User Peminjam Registered');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function registerInvestor(Request $request)
    {
        try {
            $user = new User();
            $user->email = $request->email;
            $user->salt_pw = $request->password;
            $user->password = Hash::make($request->password);
            $user->salt_pin = $request->pin;
            $user->pin = Hash::make($request->pin);
            $user->roles = 'Investor';
            $user->is_active = 1;
            $user->nik = $request->nik;
            $user->nama = $request->nama;
            $user->no_handphone = $request->no_handphone;
            $user->foto = $request->foto;
            $user->bank_id = $request->bank_id;
            $user->no_rekening = $request->no_rekening;
            $user->save();

            $tokenResult = $user->createToken('authToken')->plainTextToken;

            $wallet_investor = new WalletInvestor();
            $wallet_investor->users_id = $user->id;
            $wallet_investor->balance = 0;
            $wallet_investor->save();

            $user = User::select(
                'email',
                'roles',
                'nik',
                'nama',
                'no_handphone',
                'foto',
                'bank_id',
                'no_rekening'
            )->where('email', $request->email)->first();

            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user,
                'wallet_investor' => $wallet_investor,
            ],'User Investor Registered');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }
}
