@extends('layouts.master')

@section('content')
    <ul>
        @foreach ($posts as $post)
            <div class="post-slider">
                @if ($post->image)
                    <img class="card-img-lg" src="{{ \Storage::url($post->image) }}" alt="">
                @endif
            </div>
            <div class="card-body">
                <h3 class="mb-3"><a class="post-title"
                        href="{{ route('layouts.postShow', ['id' => $post->id]) }}">{{ $post->title }}</a></h3>

                <h5 class="mb-3">
                    <text style="color: gray; font-weight: normal;"
                        href="{{ route('layouts.postShow', ['id' => $post->id]) }}">{{ $post->describe }}</text>
                </h5>

                <ul class="card-meta list-inline">
                    <li class="list-inline-item">
                        <i class="ti-calendar"></i>{{ \Carbon\Carbon::parse($post->updated_at)->format('d/m/Y') }}
                    </li>
                    <li class="list-inline-item">
                        <ul class="card-meta-tag list-inline">
                            <li class="list-inline-item"><a
                                    href="{{ route('layouts.postcate', $post->category->id) }}">{{ $post->category->name }}</a>
                            </li>
                        </ul>
                    <li class="list-inline-item">
                        @foreach ($post->tags as $tag)
                            <span
                                class=" d-inline-block bg-success text-white px-2 py-1 rounded-pill">#{{ $tag->name }}</span>
                        @endforeach
                    </li>

                    </li>
                </ul>
                <p>{{ $post->description }}</p>
                <a href="{{ route('layouts.postShow', ['id' => $post->id]) }}" class="btn btn-outline-primary">Read
                    More</a>
            </div>
        @endforeach
    </ul>
@endsection

@section('sidebar')
    <h4 class="widget-title">Bài Viết Mới Nhất</h4>

    <article class="widget-card">
        @foreach ($postAll as $posts)
            <div class="d-flex mt-1">
                @if ($posts->image)
                    <img class="card-img-sm" src="{{ \Storage::url($posts->image) }}" alt="">
                @endif
                <div class="ml-3">
                    <h5><a class="post-title"
                            href="{{ route('layouts.postShow', ['id' => $posts->id]) }}">{{ $posts->title }}</a></h5>
                    <ul class="card-meta list-inline mb-0">
                        <li class="list-inline-item mb-0">
                            <i class="ti-calendar"></i>{{ \Carbon\Carbon::parse($posts->updated_at)->format('d/m/Y') }}
                        </li>
                    </ul>
                </div>
            </div>
        @endforeach
    </article>
@endsection
