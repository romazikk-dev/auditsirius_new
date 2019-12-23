<!-- "blogetc_admin::layouts.admin_layout" -->
<!-- layouts.admin -->
@extends("layouts.admin")

@section("title")
    Добавить категорию
@endsection

@section("breadcrumb")
    <ol class="breadcrumb float-sm-right">
        @foreach(Breadcrumbs::generate('blog.post.edit') as $breadcrumb)
            @if ($breadcrumb->url && !$loop->last)
                <li class="breadcrumb-item"><a href="{{ $breadcrumb->url }}">{{ $breadcrumb->title }}</a></li>
            @else
                <li class="breadcrumb-item active">{{ $breadcrumb->title }}</li>
            @endif
        @endforeach
    </ol>
@endsection

@section("content")

    <form method='post' action='{{route("blogetc.admin.categories.create_category")}}'  enctype="multipart/form-data" >

        @csrf
        @include("blogetc_admin::categories.form", ['category' => new \WebDevEtc\BlogEtc\Models\BlogEtcCategory()])

        <input type='submit' class='btn btn-primary' value='Добавить' >

    </form>

@endsection