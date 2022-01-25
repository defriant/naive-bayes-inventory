<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['guest'])->group(function () {
    Route::get('/', function () {
        return view('login');
    })->name('index');
    Route::post('/login-attempt', [WebController::class, 'login_attempt']);
});

Route::middleware(['auth'])->group(function () {
    Route::get('/logout', [WebController::class, 'logout']);

    Route::get('/dashboard', function () {
        return view('dashboard');
    });
    Route::get('/dashboard/produk-terlaris', [WebController::class, 'produk_terlaris']);

    Route::get('/produk', function () {
        return view('produk');
    });
    Route::get('/produk/get', [WebController::class, 'get_produk']);
    Route::post('/produk/input', [WebController::class, 'input_produk']);
    Route::post('/produk/update', [WebController::class, 'update_produk']);
    Route::post('/produk/delete', [WebController::class, 'delete_produk']);

    Route::get('/stok-produk', function () {
        return view('stok-produk');
    });
    Route::post('/stok-produk/get', [WebController::class, 'get_stok_produk']);
    Route::post('/stok-produk/input', [WebController::class, 'input_stok_produk']);

    Route::get('/classifier', [WebController::class, 'classifier']);;
    Route::post('/classifier/start', [WebController::class, 'classifier_start']);;

    // Route::get('/generate', [WebController::class, 'generate']);
});
