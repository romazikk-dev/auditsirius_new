<!-- "blogetc_admin::layouts.admin_layout" -->
<!-- layouts.admin -->
@extends("layouts.admin")

@section("title")
    Редактирование
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
        <li class="breadcrumb-item active">{{ $post->title }}</li>
    </ol>
@endsection

@section("content")


    <!-- <h5>Admin - Editing post
    <a target='_blank' href='{{$post->url()}}' class='float-right btn btn-primary'>View post</a>
    </h5> -->

    <form method='post' action='{{route("blogetc.admin.update_post",$post->id)}}'  enctype="multipart/form-data" >

        @csrf
        @method("patch")
        @include("blogetc_admin::posts.form", ['post' => $post])

        <input type='submit' class='btn btn-primary' value='Сохранить' >

    </form>

@endsection