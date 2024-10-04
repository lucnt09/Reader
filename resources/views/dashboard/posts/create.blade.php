@extends('admin.master')

@section('title')
    <h1>Thêm Mới Bài Viết</h1>
@endsection

@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Thêm Mới Bài Viết</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Form</h6>
            </div>
            @if (session('error'))
                <div class="alert alert-danger">
                    {{ session('error') }}
                </div>
            @endif

            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            <div class="card-body">
                <form method="POST" action="{{ route('dashboard.posts.store') }}" enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="title" class="form-control" value="{{ old('title') }}" id="title"
                                    name="title" required>
                            </div>
                            <div class="mb-3">
                                <label for="describe" class="form-label">Describe</label>
                                <input type="describe" class="form-control" value="{{ old('describe') }}" id="describe"
                                    name="describe" required>
                            </div>
                            <div class="mb-3">
                                <label for="content" class="form-label">Content</label>
                                <textarea type="text" rows="7" class="form-control" value="{{ old('content') }}" id="content" name="content"
                                    required></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="image" class="form-label">Image</label>
                                <input type="file" class="form-control" name="image" id="image" required>
                            </div>

                            <div class="mb-3">
                                <label for="type" class="form-label">Danh Mục</label>
                                <select class="form-control" id="category_id" name="category_id">
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="tags">Tags (ngăn cách bởi dấu phẩy):</label>
                                <input type="text" class="form-control" value="{{ old('tags') }}" name="tags" id="tags" required>
                            </div>

                            <div class="mb-3">
                                <label for="galleries">Gallery Images:</label>
                                <input type="file" name="galleries[]" id="galleries" class="form-control" multiple> <!-- Hỗ trợ nhiều file -->
                            </div>

                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>

    </div>
@endsection
