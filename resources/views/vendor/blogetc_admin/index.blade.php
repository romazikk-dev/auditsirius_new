<!-- "blogetc_admin::layouts.admin_layout" -->
<!-- layouts.admin -->
@extends("layouts.admin")

@section("title")
    Посты
@endsection

@section("breadcrumb")
    <ol class="breadcrumb float-sm-right">
        @foreach(Breadcrumbs::generate('blog.index') as $breadcrumb)
            @if ($breadcrumb->url && !$loop->last)
                <li class="breadcrumb-item"><a href="{{ $breadcrumb->url }}">{{ $breadcrumb->title }}</a></li>
            @else
                <li class="breadcrumb-item active">{{ $breadcrumb->title }}</li>
            @endif
        @endforeach
    </ol>
@endsection

@section("content")

    @if(count($posts) > 0)
    <table class="blog-posts">
        <thead>
            <td>Изображение</td>
            <td>Название</td>
            <td>Дата<br>публикации</td>
            <td>Категория</td>
            <td>Опубликовано</td>
            <td>Действия</td>
        </thead>
        <tbody>
            @foreach($posts as $post)
                <tr class="itm">
                    <td>
                        @if ($post->has_image("thumbnail"))
                            <div class="imgg" style="background-image: url(<?=$post->image_url("thumbnail");?>);"></div>
                        @else
                            <div class="imgg">No image</div>    
                        @endif
                        
                        <!-- <?=$post->image_tag("thumbnail", false);?> -->
                    </td>
                    <td>
                        <!-- <a href='{{$post->url()}}'>{{$post->title}}</a> -->
                        {{$post->title}}
                    </td>
                    <td>
                        {{ explode(" ", $post->posted_at)[0] }}<br>
                        {{ explode(" ", $post->posted_at)[1] }}
                    </td>
                    <td>
                        @if(count($post->categories))
                            @foreach($post->categories as $category)
                                <a class='btn btn-outline-secondary btn-sm m-1' href='{{$category->edit_url()}}'>
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>

                                    {{$category->category_name}}
                                </a>
                            @endforeach
                        @else
                            Без<br>Категорий
                        @endif
                    </td>
                    <td>
                        {!!($post->is_published ? '<span class="badge badge-success">Опубликовано</span>' : '<span class="badge badge-warning">Не опубликовано</span>')!!}
                    </td>
                    <td>
                        <form onsubmit="return confirm('Вы действительно хотите удалить этот пост?');"
                            method='post' action='{{route("blogetc.admin.destroy_post", $post->id)}}' class='float-right'>
                            @csrf
                            <input name="_method" type="hidden" value="DELETE"/>
                            <button type='submit' class="text-danger">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>
                        <a href="{{$post->edit_url()}}" class="card-link float-right mr-2">
                            <i class="fas fa-edit"></i>
                        </a>
                    </td> 
                </tr>
                <tr class="spc">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td> 
                </tr>
            @endforeach
        </tbody>
    </table>
    @else
        <div class='alert alert-warning'>No posts to show you. Why don't you add one?</div>
    @endif



    <div class='text-center'>
        {{$posts->appends( [] )->links()}}
    </div>


    <style>
    
    table.blog-posts{
        width: 100%;
    }
    table.blog-posts td{
        padding: 10px;
        text-align: center;
        line-height: 1.2em;
    }
    table.blog-posts td:nth-child(1){
        width: 150px;
    }
    table.blog-posts td:nth-child(2){
        width: 200px;
    }
    table.blog-posts>thead{
        
    }
    table.blog-posts>thead td{
        background-color: white;
        position: relative;
        top: -10px;
    }
    table.blog-posts .spc td{
        height: 10px;
        padding: 0px;
    }
    table.blog-posts .itm{
        background-color: white;
    }
    table.blog-posts .itm .imgg{
        width: 100%;
        height: 100%;
        max-height: 80px;
        background-color: #ccc;
        background-position: center;
        background-size: contain;
        background-repeat: no-repeat;
        color: white;
        padding-top: 30px;
    }
    table.blog-posts>tbody td{
        height: 100px;
    }
    table.blog-posts>tbody td:last-child button{
        padding: 0px;
        margin: 0px;
        border: none;
        background: none;
        outline: none;
    }
    
    </style>


@endsection