<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Socialite\Facades\Socialite;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function login()
    {
        if (\request()->method() == 'GET') {
            // Xử lý hiển thị form
            return view('auth.login');
        } else {
            // Xử lý đăng nhập
            $credentials = [
                'email' => \request('email'),
                'password' => \request('password')
            ];

            if (Auth::attempt($credentials)) {
                \request()->session()->regenerate();

                if (\request()->user()->type == 'admin') {
                    return redirect()->route('dashboard.dashboard');
                }

                return redirect()->intended('/');
            }
        }
    }

    public function redirectToFacebook()
    {
        return Socialite::driver('facebook')->redirect();
    }

    public function handleFacebookCallback()
    {
        $facebookUser = Socialite::driver('facebook')->user();
        $this->loginOrCreateUser($facebookUser, 'facebook');
    }

    // Google login
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        $googleUser = Socialite::driver('google')->user();
        $this->loginOrCreateUser($googleUser, 'google');
    }

    // Xử lý đăng nhập hoặc tạo mới người dùng từ dữ liệu mạng xã hội
    private function loginOrCreateUser($socialUser, $provider)
    {
        $user = User::where('email', $socialUser->getEmail())->first();

        if (!$user) {
            // Nếu người dùng chưa tồn tại, tạo mới
            $user = User::create([
                'name' => $socialUser->getName(),
                'email' => $socialUser->getEmail(),
                'provider' => $provider,
                'provider_id' => $socialUser->getId(),
                'password' => Hash::make(uniqid()), // Tạo mật khẩu ngẫu nhiên
            ]);
        }

        Auth::login($user);

        return redirect()->intended('/');
    }

    public function logout()
    {
        Auth::logout();

        \request()->session()->invalidate();
        \request()->session()->regenerateToken();

        return redirect('/');
    }


    public function __construct()
    {
        $this->middleware('guest')->except('logout');
        $this->middleware('auth')->only('logout');
    }
}
