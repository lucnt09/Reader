<!DOCTYPE html>
<html lang="en-us">

<head>
    @include('layouts.partials.head')
</head>

<body>
    <!-- header -->
    @include('layouts.partials.header')
    <!-- /header -->

    <!-- start of banner -->
    @include('layouts.partials.banner')

    <!-- end of banner -->
    <!--list content -->

    <section class="section-sm">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8  mb-5 mb-lg-0 mt-0">
                    <article class="card mb-4 mt-0">
                        @yield('content')
                    </article>

                </div>

                <aside class="col-lg-4 sidebar-home">
                    <!-- Search -->
                    <div class="widget">
                        <h4 class="widget-title"><span>Search</span></h4>
                        <form action="{{ route('layouts.search') }}" class="widget-search" method="GET">
                            <input class="mb-3" id="search-query" name="s" type="search"
                                placeholder="Type &amp; Hit Enter...">
                            <i class="ti-search"></i>
                            <button type="submit" class="btn btn-primary btn-block">Search</button>
                        </form>
                    </div>

                    <!-- about me -->
                    <div class="widget widget-about">
                        <h4 class="widget-title">Hi, I am {{ Auth::user()->name}}</h4>
                        <img class="img-fluid" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-M68NqCFBNMIAmsRkA-cCpxd-O7JkXjZA0w&usqp=CAU" alt="Themefisher">
                        <p>It's so cute when someone knows you're asleep and they text you a long paragraph about their love for you. And that's the first
                            thing you read in the morning. That is a mercy, right ?
                        </p>
                        <ul class="list-inline social-icons mb-3">

                            <li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>

                            <li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>

                            <li class="list-inline-item"><a href="#"><i class="ti-linkedin"></i></a></li>

                            <li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>

                            <li class="list-inline-item"><a href="#"><i class="ti-youtube"></i></a></li>

                        </ul>
                        <a href="about-me.html" class="btn btn-primary mb-2">About me</a>
                    </div>

                    <!-- recent post -->
                    <div class="widget">

                        <!-- post-item -->
                        @yield('sidebar')
                    </div>

                    <!-- Social -->
                    <div class="widget">
                        <h4 class="widget-title"><span>Social Links</span></h4>
                        <ul class="list-inline widget-social">
                            <li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="ti-linkedin"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="ti-youtube"></i></a></li>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
    </section>
    <!--end list content -->

    @include('layouts.partials.footer')
</body>

</html>
