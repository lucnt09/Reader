@extends('admin.master')
<?php
use Illuminate\Support\Facades\Storage;
?>
@section('title')
    <h1>Danh Sách Bài Viết</h1>
@endsection

@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Danh Sách Bài Viết</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">List</h6>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Category</th>
                                <th>Tags</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($posts as $post)
                                <tr>
                                    <td>{{ $post->id }}</td>
                                    <td>{{ $post->title }}</td>
                                    <td>

                                        @if ($post->image)
                                            <img class="card-img-sm" src="{{ \Storage::url($post->image) }}" width="150px"
                                                alt="">
                                        @endif

                                    </td>
                                    <td>{{ $post->category->name }}</td>
                                    <td>
                                        @foreach ($post->tags as $tag)
                                            <span class="badge bg-success text-white">#{{ $tag->name }}</span>
                                        @endforeach
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-center">
                                            <a class="btn btn-warning"
                                                href="{{ route('dashboard.posts.edit', $post->id) }}">Update</a>
                                            <form action="{{ route('posts.delete', $post->id) }}" method="post">
                                                @method('DELETE')
                                                @csrf
                                                <button type="submit" onclick="return confirm('Are you want to delete ?')"
                                                    class="btn btn-danger ml-2">Delete</button>
                                            </form>

                                        </div>
                                    </td>
                                </tr>
                                {{-- {{ dd(Storage::url($post->image)) }}
                                {{ dd(Storage::exists($post->image)) }} --}}
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
@endsection
