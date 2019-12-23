<!-- "blogetc_admin::layouts.admin_layout" -->
<!-- layouts.admin -->
@extends("layouts.admin")
@section("content")

    <div class="row blog-comments"> 
        @forelse ($comments as $comment)

            
                <div class="col-lg-12 coll">
                    <div class="card">
                        <div class="card-header">
                            <h3>
                                {{$comment->author()}}

                                @if(!$comment->approved)
                                    {{--APPROVE BUTTON--}}
                                    <span class="badge badge-warning">Не подтвержден</span>
                                @endif
                            </h3>
                            @if($comment->post)
                                Пост: <a target="_blank" href='{{$comment->post->vue_url()}}'>{{$comment->post->title}}</a><br>
                                Создан: {{$comment->created_at}}
                            @else
                                {{$comment->comment}}
                             @endif
                        </div>
                        <div class="card-body">
                            {{$comment->comment}}
                        </div>
                        <div class="card-footer">
                            <div class="float-left">
                                @if($comment->post)
                                    {{--EDIT POST BUTTON--}}
                                    <a href="{{$comment->post->edit_url()}}" class="card-link btn btn-primary btn-sm">
                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                        Редактировать пост</a>
                                @endif
                            </div>
                            <div class="float-right">
                                @if(!$comment->approved)
                                    {{--APPROVE BUTTON--}}
                                    <form method='post' action='{{route("blogetc.admin.comments.approve", $comment->id)}}' class='float-right'>
                                        @csrf
                                        @method("PATCH")
                                        <input type='submit' class='btn btn-success btn-sm' value='Подтвердить'/>
                                    </form>
                                @endif

                                {{--DELETE BUTTON--}}
                                <form
                                        onsubmit="return confirm('Вы действительно хотите удалить комментарий?');"
                                        method='post' action='{{route("blogetc.admin.comments.delete", $comment->id)}}' class='float-right'>
                                    @csrf
                                    @method("DELETE")
                                    <input type='submit' class='btn btn-danger btn-sm' value='Удалить'/>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            

        @empty
            <div class='col-lg-12 coll alert alert-danger'>None found</div>
        @endforelse
    </div>


    <div class='text-center'>
        {{$comments->appends( [] )->links()}}
    </div>

@endsection