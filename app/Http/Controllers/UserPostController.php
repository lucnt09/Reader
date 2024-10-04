<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Comment;
use App\Models\Post;
use App\Models\UserPost;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserPostController extends Controller
{
    public function index()
    {
        // Lấy các bài viết đã được duyệt để hiển thị trên diễn đàn
        $userPosts = UserPost::with('user')->where('status', 'Đã duyệt')->paginate(5);
        $categories = Category::all();

        return view('userpost', compact('userPosts', 'categories'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'content' => 'required',
            'image' => 'image|nullable'
        ]);
        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('userpost', 'public'); // Lưu hình ảnh vào thư mục public/storage/posts
        }

        UserPost::create([
            'user_id' => Auth::id(),
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'status' => 'Chờ duyệt', // Bài viết ở trạng thái chờ duyệt
            'image' => $imagePath,
        ]);

        return redirect()->back()->with('message', 'Bài viết của bạn đã được gửi và đang chờ duyệt.');
    }

    public function show($id)
    {
        //
    }

    public function comment(Request $request, $id)
    {
        $request->validate([
            'comment' => 'required',
        ]);

        Comment::create([
            'user_post_id' => $id,
            'user_id' => Auth::id(),
            'comment' => $request->input('comment'),
        ]);

        return redirect()->back()->with('message', 'Bình luận của bạn đã được thêm.');
    }

    public function adminPosts(Request $request)
    {
        $status = $request->input('status');
        $pendingPosts = UserPost::with('user');

        if ($status) {
            $pendingPosts = UserPost::with('user')->where('status', $status);
        }
        $pendingPosts = $pendingPosts->paginate(5);
        return view('dashboard.posts.review', compact('pendingPosts', 'status'));
    }

    // Duyệt bài viết
    public function approve(UserPost $post)
    {
        $post->update(['status' => 'Đã duyệt']);
        return redirect()->route('dashboard.posts.review')->with('success', 'Bài viết đã được duyệt!');
    }

    // Từ chối và xóa bài viết
    public function reject(UserPost $post)
    {
        $post->delete();
        return redirect()->back()->with('success', 'Bài viết đã bị từ chối');
    }
}
