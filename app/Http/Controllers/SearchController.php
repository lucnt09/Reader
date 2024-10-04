<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $query = $request->input('s'); // Lấy giá trị của query string 's'

        // Tìm kiếm trong bảng posts, bạn có thể thay đổi thành bảng và cột bạn cần
        $articles = Post::where('title', 'LIKE', "%{$query}%")->get();
        $categories = Category::all();
        return view('search_results', compact('articles','categories'));
    }
}
