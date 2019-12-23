<!-- "blogetc_admin::layouts.admin_layout" -->
<!-- layouts.admin -->
@extends("layouts.admin")

@section("title")
    Редактирование
@endsection

@section("breadcrumb")
    <ol class="breadcrumb float-sm-right">
        @foreach(Breadcrumbs::generate('blog.category.edit') as $breadcrumb)
            @if ($breadcrumb->url && !$loop->last)
                <li class="breadcrumb-item"><a href="{{ $breadcrumb->url }}">{{ $breadcrumb->title }}</a></li>
            @else
                <li class="breadcrumb-item active">{{ $breadcrumb->title }}</li>
            @endif
        @endforeach
        <li class="breadcrumb-item active">{{ $category->category_name }}</li>
    </ol>
@endsection

@section("content")

    <form method='post' action='{{route("blogetc.admin.categories.edit_category",$category->id)}}'  enctype="multipart/form-data" >

        @csrf
        @method("patch")
        @include("blogetc_admin::categories.form", ['category' => $category])

        <input type='submit' class='btn btn-primary' value='Сохрарнить' >

    </form>

@endsection