<!-- "blogetc_admin::layouts.admin_layout" -->
<!-- layouts.admin -->
@extends("layouts.admin")

@section("title")
    Категории
@endsection

@section("breadcrumb")
    <ol class="breadcrumb float-sm-right">
        @foreach(Breadcrumbs::generate('blog.categories') as $breadcrumb)
            @if ($breadcrumb->url && !$loop->last)
                <li class="breadcrumb-item"><a href="{{ $breadcrumb->url }}">{{ $breadcrumb->title }}</a></li>
            @else
                <li class="breadcrumb-item active">{{ $breadcrumb->title }}</li>
            @endif
        @endforeach
    </ol>
@endsection

@section("content")

    <div class="row">
    @forelse ($categories as $category)

        <div class="col-md-3 col-sm-4">
            <div class="card">
                <div class="card-body">
                    <!-- <h5><a href='{{$category->url()}}'>{{$category->category_name}}</a></h5> -->
                    <h5>{{$category->category_name}}</h5>


                    <!-- <a href="{{$category->url()}}" class="card-link btn btn-outline-secondary">View Posts in this category</a> -->
                    <div class="actions">
                        <form

                                onsubmit="return confirm('Are you sure you want to delete this blog post category?\n You cannot undo this action!');"

                                method='post' action='{{route("blogetc.admin.categories.destroy_category", $category->id)}}'>
                            @csrf
                            @method("DELETE")
                            <button type='submit' class="float-right mr-2 text-danger">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>
                        <a href="{{$category->edit_url()}}" class="float-right mr-2">
                            <i class="fas fa-edit"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    @empty
    <div class='alert alert-danger'>None found, why don't you add one?</div>
    @endforelse
    </div>


    <div class='text-center'>
        {{$categories->appends( [] )->links()}}
    </div>

    <style>
        .card-body{
            height: 100px;
            position: relative;
            padding: 0px!important;
            overflow: hidden;
            padding: 10px 5px 30px 5px!important;
        }
        .card-body h5{
            text-align: center;
        }
        .card-body .actions{
            height: 30px;
            position: absolute;
            bottom: 0px;
            width: 100%;
            background-color: #ccc;
            left: 0px;
            z-index: 0;
            border-radius: 0px 0px 3px 3px;
            padding-top: 2px;
        }
        .card-body button{
            padding: 0px;
            margin: 0px;
            border: none;
            background: none;
            outline: none;
        }
    </style>

@endsection