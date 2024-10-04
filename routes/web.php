<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\PostController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\UserPostController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::prefix('dashboard')
    ->as('dashboard.')
    ->group(function () {
        Route::get('/', function () {
            return view('dashboard.dashboard');
        })->name('dashboard');

        Route::resource('users', UserController::class);
        Route::resource('categories', CategoryController::class);
        Route::resource('posts', PostController::class);

        // Route cho trang quản lý bài viết với khả năng chọn hiển thị theo trạng thái
        Route::get('/userpost/posts/review', [UserPostController::class, 'adminPosts'])->name('posts.review');

        // Route để duyệt bài viết
        Route::post('userpost/{post}/approve', [UserPostController::class, 'approve'])->name('posts.approve');

        // Route để từ chối bài viết
        Route::post('userpost/{post}/reject', [UserPostController::class, 'reject'])->name('posts.reject');
    });

Route::match(['get', 'post'], '/login', [LoginController::class, 'login'])->name('auth.login');

Route::delete('/users/{id}', [UserController::class, 'destroy'])->name('users.delete');
Route::delete('/categories/{id}', [CategoryController::class, 'destroy'])->name('categories.delete');
Route::delete('/posts/{id}', [PostController::class, 'destroy'])->name('posts.delete');

Route::get('/', [HomeController::class, 'index'])->name('layouts.index');
Route::get('/postShow/{id}', [HomeController::class, 'postShow'])->name('layouts.postShow');
Route::get('/post/{id}', [HomeController::class, 'show'])->name('layouts.postShow');
Route::get('/postcate/{category}', [HomeController::class, 'postcate'])->name('layouts.postcate');
Route::get('/search', [HomeController::class, 'search'])->name('layouts.search');

//diễn đàn
Route::get('/userpost', [UserPostController::class, 'index'])->name('layouts.userpost');
Route::post('/userpost', [UserPostController::class, 'store'])->name('userpost.store');
Route::post('/userpost/{id}/comment', [UserPostController::class, 'comment'])->name('userpost.comment');


Route::get('lang/{locale}', function ($locale) {
    if (!in_array($locale, ['en', 'vi'])) {
        abort(400);
    }
    session(['locale' => $locale]);
    return redirect()->back();
})->name('switchLang');


// Facebook routes
Route::get('auth/facebook', [LoginController::class, 'redirectToFacebook']);
Route::get('auth/facebook/callback', [LoginController::class, 'handleFacebookCallback']);

// Google routes
Route::get('auth/google', [LoginController::class, 'redirectToGoogle']);
Route::get('auth/google/callback', [LoginController::class, 'handleGoogleCallback']);


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
