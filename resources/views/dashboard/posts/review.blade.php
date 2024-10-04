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
                    <form action="{{ route('dashboard.posts.review') }}" method="GET">
                        <div class="form-group">
                            <label for="statusSelect">Chọn Trạng Thái:</label>
                            <select class="form-control" id="statusSelect" name="status" onchange="this.form.submit()">
                                <option value="">-- Chọn Trạng Thái --</option>
                                <option value="Chờ duyệt" {{ request('status') == 'Chờ duyệt' ? 'selected' : '' }}>Bài Chờ Duyệt</option>
                                <option value="Đã duyệt" {{ request('status') == 'Đã duyệt' ? 'selected' : '' }}>Bài Đã Duyệt</option>
                            </select>
                        </div>
                    </form>
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tiêu Đề</th>
                                <th>Nội Dung</th>
                                <th>Người Đăng</th>
                                <th>Image</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($pendingPosts as $userpost)
                                <tr>
                                    <td>{{ $userpost->id }}</td>
                                    <td>{{ $userpost->title }}</td>
                                    <td>{{ Str::limit($userpost->content, 100) }}</td>
                                    <td class="d-flex justify-content-center">
                                        @if ($userpost->image)
                                            <img class="card-img-sm " width="150px"
                                                src="{{ \Storage::url($userpost->image) }}" alt="{{ $userpost->title }}">
                                        @endif
                                    </td>
                                    <td>{{ $userpost->user->name }}</td> <!-- Hiển thị tên người đăng -->
                                    <td>{{ $userpost->status }}</td>
                                    <td>
                                        <form action="{{ route('dashboard.posts.approve', $userpost->id) }}" method="POST"
                                            style="display:inline;">
                                            @csrf
                                            <button type="submit" class="btn btn-success">Duyệt</button>
                                        </form>
                                        <form action="{{ route('dashboard.posts.reject', $userpost->id) }}" method="POST"
                                            style="display:inline;">
                                            @csrf
                                            <button type="submit" class="btn btn-danger">Từ Chối</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
@endsection
