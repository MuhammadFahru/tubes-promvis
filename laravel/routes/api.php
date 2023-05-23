<?php

use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\LogoutController;
use App\Http\Controllers\API\Masterdata\MasterdataBankController;
use App\Http\Controllers\API\Masterdata\MasterdataKategoriUMKMController;
use App\Http\Controllers\API\Masterdata\MasterdataSektorUMKMController;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\UserController;
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
    Route::get('user', [UserController::class, 'fetch']);
    Route::post('user', [UserController::class, 'updateProfile']);
    Route::post('logout', [LogoutController::class, 'logout']);
});

Route::post('login', [LoginController::class, 'login']);
Route::post('register-peminjam', [RegisterController::class, 'registerPeminjam']);
Route::post('register-investor', [RegisterController::class, 'registerInvestor']);

Route::get('get-masterdata-bank', [MasterdataBankController::class, 'getData']);
Route::get('get-masterdata-kategori-umkm', [MasterdataKategoriUMKMController::class, 'getData']);
Route::get('get-masterdata-sektor-umkm', [MasterdataSektorUMKMController::class, 'getData']);
