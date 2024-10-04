@extends('layouts.master')


@section('content')
    <section class="section">
        <div class="container">
            <div class="row justify-content-center">
                <div class=" col-lg-9 mb-lg-0">
                    <article>
                        <h1 class="h2">{{ $posts->title }}</h1>
                        <ul class="card-meta my-3 list-inline">
                            <li class="list-inline-item">
                                <i class="ti-calendar"></i>{{ \Carbon\Carbon::parse($posts->updated_at)->format('d/m/Y') }}
                            </li>
                            <li class="list-inline-item">
                                <ul class="card-meta-tag list-inline">
                                    <li class="list-inline-item"><a href="{{ route('layouts.postcate', $posts->category->id) }}">{{ $posts->category->name }}</a></li>
                                </ul>
                            </li>
                            <li class="list-inline-item">
                                @foreach ($posts->tags as $tag)
                                    <span class=" d-inline-block bg-success text-white px-2 py-1 rounded-pill">#{{ $tag->name }}</span>
                                @endforeach
                            </li>
                            <li class="list-inline-item">
                                {{ $posts->views }} Lượt xem
                            </li>

                        </ul>

                        <div class="post-slider mb-4 mt-3">
                            @if ($posts->image)
                                <img class="card-img-xl" src="{{ \Storage::url($posts->image) }}" width="90px"
                                    height="70px" alt="">
                            @endif
                        </div>

                        <div class="content">
                            <p>{{ $posts->description }}</p>
                            <p>{{ $posts->content }}</p>
                            <div class="gallery">
                                @foreach($posts->galleries as $gallery)
                                    <img class="card-img mt-3" src="{{ Storage::url($gallery->image_path) }}" alt="Gallery Image" >
                                @endforeach
                            </div>
                            <p class="mt-3">It’s no secret that the digital industry is booming. From exciting startups to global
                                brands,
                                companies
                                are reaching out to digital agencies, responding to the new possibilities available.
                                However, the industryis fast becoming overcrowded, heaving with agencies offering
                                similar
                                services — on the surface, at least.
                                Producing creative, fresh projects is the key to standing out. Unique side projects are
                                the
                                best place toinnovate, but balancing commercially and creatively lucrative work is
                                tricky.
                                So, this article looks at</p>
                            <p>It’s no secret that the digital industry is booming. From exciting startups to global
                                brands,
                                companies
                                are reaching out to digital agencies, responding to the new possibilities available.
                                However, the industryis fast becoming overcrowded, heaving with agencies offering
                                similar
                                services — on the surface, at least.
                                Producing creative, fresh projects is the key to standing out. Unique side projects are
                                the
                                best place toinnovate, but balancing commercially and creatively lucrative work is
                                tricky.
                                So, this article looks at</p>
                        </div>
                    </article>

                </div>

            </div>
        </div>
    </section>
@endsection
@section('sidebar')
    <h4 class="widget-title">Bài Viết Liên Quan</h4>

    <article class="widget-card">
        <div class="d-flex">
            @forelse ($relatedPosts as $relatedPost)
                <div class="d-flex mt-1">
                    @if ($relatedPost->image)
                        <img class="card-img-sm" src="{{ \Storage::url($relatedPost->image) }}" width="90px"
                            height="70px" alt="">
                    @endif

                    <div class="ml-3">
                        <h5><a class="post-title"
                                href="{{ route('layouts.postShow', ['id' => $relatedPost->id]) }}">{{ $relatedPost->title }}</a>
                        </h5>
                        <ul class="card-meta list-inline mb-0">
                            <li class="list-inline-item mb-0">
                                <i
                                    class="ti-calendar"></i>{{ \Carbon\Carbon::parse($relatedPost->updated_at)->format('d/m/Y') }}
                            </li>
                        </ul>
                    </div>
                </div>
            @empty
            @endforelse
        </div>
    </article>
@endsection
