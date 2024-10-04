<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $posts = Post::with('tags',)->orderByDesc('updated_at')->paginate(5);
        $categories = Category::all();
        foreach ($posts as $post) {
            $post->created_at_formatted = Carbon::parse($post->created_at)->format('d/m/Y'); // Chỉ định dạng ngày
            $post->updated_at_formatted = Carbon::parse($post->updated_at)->format('d/m/Y'); // Chỉ định dạng ngày
        }
        return view('index', compact('posts', 'categories'));
    }

    public function postShow($id)
    {
        $posts = Post::with('galleries')->findOrFail($id);
        $categories = Category::all();

        return view('postShow', compact('posts', 'categories'));
    }

    public function postcate(Category $category)
    {
        $categories = Category::all();
        $posts = Post::where('category_id',  $category->id)->get();
        $postAll = Post::orderByDesc('updated_at')->paginate(5);

        return view('postcate', compact('categories', 'posts', 'postAll'));
    }

    public function search(Request $request)
    {
        $query = $request->input('s'); // Lấy giá trị của query string 's'

        // Tìm kiếm trong bảng posts, bạn có thể thay đổi thành bảng và cột bạn cần
        $posts = Post::where('title', 'LIKE', "%{$query}%")->get();
        $categories = Category::all();
        $postAll = Post::orderByDesc('updated_at')->paginate(5);

        return view('search', compact('posts', 'categories', 'postAll'));
    }
    public function show($id)
    {
        // Tìm bài viết dựa trên id
        $posts = Post::findOrFail($id);
        $categories = Category::all();

        $relatedPosts = Post::where('category_id', $posts->category_id)
        ->where('id', '!=', $posts->id)
        ->orderBy('updated_at', 'desc')
        ->take(5)
        ->get();

        // Tạo một key duy nhất dựa trên user và bài viết
        $viewed = 'viewed_post_' . $posts->id;

        // Kiểm tra xem cookie đã tồn tại hay chưa
        if (!request()->cookie($viewed)) {
            // Tăng số lượt xem nếu cookie chưa tồn tại
            $posts->increment('views'); // Tăng số lượt xem
            Log::info('Views incremented for post ID: ' . $posts->id); // Ghi log khi tăng lượt xem

            // Thiết lập cookie với thời gian sống 60 phút
            $cookieDuration = 60;
            $response = response()->view('postShow', compact('posts', 'relatedPosts', 'categories'));
            $response->cookie($viewed, true, $cookieDuration); // Thêm cookie vào response

            // Trả về response với cookie
            return $response;
        }

        // Trả về view chi tiết bài viết (cookie đã tồn tại)
        return view('postShow', compact('posts', 'relatedPosts', 'categories'));
    }}
