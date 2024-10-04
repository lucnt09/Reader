<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Gallery;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    const PATH_FOLDER = 'dashboard.posts.';

    public function index()
    {
        $posts = Post::query()->orderByDesc('id')->get();
        return view(self::PATH_FOLDER . __FUNCTION__, compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        return view(self::PATH_FOLDER . __FUNCTION__, compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required',
            'describe' => 'nullable|string',
            'category_id' => 'required',
            'tags' => 'required|string', // Đảm bảo 'tags' là chuỗi
            'image' => 'nullable|image',
            'gallery.*' => 'nullable|image'
        ]);
        try {
            DB::transaction(function () use ($request) {
                $posts = [
                    "title" => $request->title,
                    "content" => $request->content,
                    "describe" => $request->describe,
                    "category_id" => $request->category_id,
                ];

                if ($request->hasFile('image')) {
                    $posts['image'] = $request->file('image')->store('posts', 'public');
                }

                $post = Post::query()->create($posts);

                $tagsArray = explode(',', $request->tags);
                $tagsArray = array_map('trim', $tagsArray);
                $tagIds = [];
                foreach ($tagsArray as $tagName) {
                    // Tìm hoặc tạo mới tag nếu chưa tồn tại
                    $tag = Tag::firstOrCreate(['name' => $tagName]);
                    $tagIds[] = $tag->id;
                }

                // Gán tag vào bài viết bằng phương thức sync
                $post->tags()->sync($tagIds);

                if ($request->hasFile('galleries')) {
                    foreach ($request->file('galleries') as $galleryImage) {
                        $galleryPath = $galleryImage->store('galleries', 'public');
                        Gallery::create([
                            'post_id' => $post->id,
                            'image_path' => $galleryPath,
                        ]);
                    }
                }
            });

            return redirect()->route('dashboard.posts.index');
        } catch (\Throwable $th) {
            return back()->with('error', $th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $posts = Post::findOrFail($id);
        $categories = Category::all();
        return view(self::PATH_FOLDER . __FUNCTION__, compact('posts', 'categories'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $posts = Post::with('tags')->findOrFail($id);
        $categories = Category::all();

        return view('dashboard.posts.update', compact('posts', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'describe' => 'required|string',
            'image' => 'nullable|image',
            'category_id' => 'required|exists:categories,id',
            'tags' => 'required|string',
            'galleries.*' => 'nullable|image',
        ]);

        $post = Post::findOrFail($id);

        $post->title = $request->input('title');
        $post->content = $request->input('content');
        $post->describe = $request->input('describe');
        $post->category_id = $request->input('category_id');

        if ($request->hasFile('image')) {
            $post['image'] = $request->file('image')->store('posts', 'public');
        }

        $tagsArray = explode(',', $request->tags); // Tách tags thành mảng
        $tagsArray = array_map('trim', $tagsArray); // Loại bỏ khoảng trắng

        $tagIds = [];
        foreach ($tagsArray as $tagName) {
            $tag = Tag::firstOrCreate(['name' => $tagName]); // Tìm hoặc tạo tag mới
            $tagIds[] = $tag->id; // Lưu ID của tag
        }

        // Đồng bộ tags với bài viết
        $post->tags()->sync($tagIds);

        $this->deleteUnusedTags($post->tags->pluck('id')->toArray());

        if ($request->hasFile('galleries')) {
            foreach ($request->file('galleries') as $galleryImage) {
                $galleryPath = $galleryImage->store('galleries', 'public');
                Gallery::create([
                    'post_id' => $post->id,
                    'image_path' => $galleryPath,
                ]);
            }
        }

        // Xóa ảnh gallery nếu người dùng chọn
        if ($request->has('delete_gallery')) {
            Gallery::whereIn('id', $request->delete_gallery)->delete();
        }

        $post->save();

        return redirect()->route('dashboard.posts.index')->with('success', 'Post updated successfully');
    }

    private function deleteUnusedTags(array $existingTagIds)
    {
        // Lấy tất cả các tag hiện tại
        $allTags = Tag::all();

        foreach ($allTags as $tag) {
            // Kiểm tra xem tag này có còn được sử dụng không
            if (!in_array($tag->id, $existingTagIds) && !Post::whereHas('tags', function($query) use ($tag) {
                $query->where('tags.id', $tag->id);
            })->exists()) {
                // Nếu không còn bài viết nào sử dụng tag này, xóa tag
                Tag::destroy($tag->id);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $post = Post::with('tags')->findOrFail($id);

            // Lưu lại các tag ID trước khi xóa
            $tagIds = $post->tags->pluck('id')->toArray();

            // Xóa các mối quan hệ tags với bài viết
            $post->tags()->detach();

            // Sau đó xóa bài viết
            $post->delete();

            // Kiểm tra xem có còn bài viết nào khác sử dụng các tag này không
            foreach ($tagIds as $tagId) {
                if (!Post::whereHas('tags', function($query) use ($tagId) {
                    $query->where('tags.id', $tagId);
                })->exists()) {
                    // Nếu không còn bài viết nào sử dụng tag này, xóa tag
                    Tag::destroy($tagId);
                }
            }

            return redirect()->route('dashboard.posts.index')->with('success', 'Post deleted successfully');
        } catch (\Throwable $th) {
            return back()->with('error', $th->getMessage());
        }
    }
}
