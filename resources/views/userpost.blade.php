@extends('layouts.master')

@section('content')
    <div class="d-flex">
        <a href="{{ route('layouts.index') }}" class="h5 section-title">Tin Mới Nhất </a>
        <a href="{{ route('layouts.userpost') }}" class="ml-4 h5 section-title">Diễn Đàn </a>
    </div>
    <div class="container">
        @foreach ($userPosts as $post)
            <div class="post">
                @if ($post->image)
                    <img src="{{ \Storage::url($post->image) }}" alt="{{ $post->title }}" class="mb-3" height="400px">
                @endif
                <h3>
                    <a class="post-title" href="#">{{ $post->title }}</a>

                </h3>
                <p>{{ $post->content }}</p>
                <p>
                    <i class="fas fa-user-circle"></i> {{ $post->user->name }}
                </p>
                <p><small>Được duyệt vào: {{ \Carbon\Carbon::parse($post->updated_at)->format('d/m/Y') }}</small></p>

                <h5>Bình luận:</h5>
                @foreach ($post->comments as $comment)
                    <div class="comment d-flex align-items-center mb-2">
                        <i class="fas fa-user-circle"></i>
                        <strong class="ml-2">{{ $comment->user->name }}:</strong>
                        <p class="mb-0 ml-2">{{ $comment->comment }}</p>
                    </div>
                @endforeach

                <!-- Form để thêm bình luận -->
                <form action="{{ route('userpost.comment', ['id' => $post->id]) }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="comment">Thêm bình luận:</label>
                        <textarea class="form-control" id="comment" name="comment" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Gửi bình luận</button>
                </form>

                <hr class="my-4">
            </div>
        @endforeach
        <div class="d-flex justify-content-center">
            {{ $userPosts->links('pagination::bootstrap-4') }}

        </div>

    </div>
@endsection

@section('sidebar')
    <h4 class="widget-title">Đăng bài </h4>

    <article class="widget-card">
        <form action="{{ route('userpost.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label for="title" class="form-label">Tiêu Đề</label>
                <input type="text" name="title" class="form-control" id="title" required>
            </div>

            <div class="form-group">
                <label for="content" class="form-label">Nội Dung</label>
                <textarea name="content" class="form-control" id="content" rows="5" required></textarea>
            </div>

            <div class="form-group">
                <label for="image">Hình ảnh:</label>
                <input type="file" class="form-control" id="image" name="image">
            </div>
            <button type="submit" class="btn btn-primary">Đăng Bài</button>
        </form>
    </article>
@endsection
