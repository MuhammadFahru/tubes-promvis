<?php

use App\Http\Controllers\API\FaqController;
use App\Http\Controllers\API\FundingController;
use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\LogoutController;
use App\Http\Controllers\API\Masterdata\MasterdataBankController;
use App\Http\Controllers\API\Masterdata\MasterdataKategoriUMKMController;
use App\Http\Controllers\API\Masterdata\MasterdataSektorUMKMController;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\WalletController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:sanctum'])->group(function () {

    // User
    Route::get('user', [UserController::class, 'fetch']);
    Route::post('user', [UserController::class, 'updateProfile']);

    // Logout
    Route::post('logout', [LogoutController::class, 'logout']);


});

// Wallet
Route::post('wallet/top-up', [WalletController::class, 'topUp']);
Route::post('wallet/withdraw', [WalletController::class, 'withdraw']);

// Pinjaman
Route::post('pinjaman/store', [FundingController::class, 'storePinjaman']);
Route::get('pinjaman/getData', [FundingController::class, 'getData']);

// Investasi
Route::post('investasi/store', [FundingController::class, 'storeInvestasi']);

Route::post('login', [LoginController::class, 'login']);
Route::post('register-peminjam', [RegisterController::class, 'registerPeminjam']);
Route::post('register-investor', [RegisterController::class, 'registerInvestor']);

Route::get('get-masterdata-bank', [MasterdataBankController::class, 'getData']);
Route::get('get-masterdata-kategori-umkm', [MasterdataKategoriUMKMController::class, 'getData']);
Route::get('get-masterdata-sektor-umkm', [MasterdataSektorUMKMController::class, 'getData']);

Route::get('get-faq-peminjam', [FaqController::class, 'getDataPeminjam']);
Route::get('get-faq-investor', [FaqController::class, 'getDataInvestor']);
