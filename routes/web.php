<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SiteController;

Route::get('/login', function () {
    if (Auth::check()) return redirect('/product');

    return view('login');
})->name('login');

Route::get('/logout', function () {
    Auth::logout();

    return redirect('/login');
});

Route::resource('product', ProductController::class)
    ->middleware('auth');

Route::post('/auth', [SiteController::class, 'auth']);