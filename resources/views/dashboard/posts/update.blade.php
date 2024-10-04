@extends('admin.master')

@section('title')
    <h1>Cập Nhật Bài Viết</h1>
@endsection

@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Cập Nhật Bài Viết</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Form</h6>
            </div>
            <div class="card-body">
                <form method="post" action="{{ route('dashboard.posts.update', $posts->id) }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="title" class="form-control" id="title" name="title"
                                    value="{{ $posts->title }}">
                            </div>
                            <div class="mb-3">
                                <label for="describe" class="form-label">Describe</label>
                                <input type="describe" class="form-control" id="describe" name="describe"
                                    value="{{ $posts->describe }}">
                            </div>
                            <div class="mb-3">
                                <label for="content" class="form-label">Content</label>
                                <textarea rows="7" id="content" class="form-control" name="content" required>{{ $posts->content }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="mb-3">
                                <label for="image" class="form-label">Image</label>
                                <input type="file" class="form-control" name="image" id="image">
                                @if ($posts->image)
                                    <img class="card-img-md mt-3" src="{{ \Storage::url($posts->image) }}" width="350px"
                                        height="200px" alt="">
                                @endif

                            </div>

                            <div class="mb-3">
                                <label for="type" class="form-label">Danh Mục</label>
                                <select class="form-control" id="category_id" name="category_id">
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}"
                                            {{ $posts->category_id == $category->id ? 'selected' : '' }}>
                                            {{ $category->name }}</option>
                                    @endforeach

                                </select>

                            </div>

                            <div class="mb-3">
                                <label for="tags">Tags (ngăn cách bởi dấu phẩy):</label>
                                <input type="text" class="form-control"
                                    value="{{ old('tags', $posts->tags->pluck('name')->implode(',')) }}" name="tags"
                                    id="tags" required>
                            </div>
                            <div class="mb-3">
                                <label for="galleries" class="form-label">Gallery Images (có thể chọn nhiều ảnh):</label>
                                <input type="file" class="form-control" name="galleries[]" id="galleries" multiple>
                                @if ($posts->galleries)
                                    <div class="mt-3">
                                        @foreach ($posts->galleries as $gallery)
                                            <img src="{{ \Storage::url($gallery->image_path) }}" width="150px"
                                                height="100px" class="mr-2 mb-2" alt="">
                                            <input type="checkbox" name="delete_gallery[]" value="{{ $gallery->id }}"> Xóa
                                            ảnh này
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Submit</button>
                    <a class="btn btn-primary ml-2" href="{{ route('dashboard.posts.index') }}">Danh Sách</a>

                </form>
            </div>
        </div>

    </div>
@endsection
