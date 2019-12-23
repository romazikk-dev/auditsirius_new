<div class="form-group">
    <label for="blog_title">Заголовок:</label>
    <input type="text" class="form-control" required id="blog_title" aria-describedby="blog_title_help" name='title'
           value="{{old("title",$post->title)}}">
</div>

<div class="form-group">
    <label for="blog_subtitle">Подзаголовок:</label>
    <small class="text-muted">(опционально)</small>
    <input type="text" class="form-control" id="blog_subtitle" aria-describedby="blog_subtitle_help" name='subtitle'
           value='{{old("subtitle",$post->subtitle)}}'>
</div>


<div class='row'>


    <div class='col-sm-12 col-md-4'>


        <div class="form-group">
            <label for="blog_slug">Slug</label>
            <input type="text" class="form-control" id="blog_slug" aria-describedby="blog_slug_help" name='slug'
                   value="{{old("slug",$post->slug)}}">
            <small id="blog_slug_help" class="form-text text-muted">
                Slug (оставьте пустым для автозаполнения)<br>
                {{route("blogetc.single","")}}/<u><em>эта_часть</em></u>
            </small>
        </div>

    </div>
    <div class='col-sm-6 col-md-4'>


        <div class="form-group">
            <label for="blog_is_published">Опубликовано</label>

            <select name='is_published' class='form-control' id='blog_is_published'
                    aria-describedby='blog_is_published_help'>

                <option @if(old("is_published",$post->is_published) == '1') selected='selected' @endif value='1'>
                    Published
                </option>
                <option @if(old("is_published",$post->is_published) == '0') selected='selected' @endif value='0'>Not
                    Published
                </option>

            </select>
            <small id="blog_is_published_help" class="form-text text-muted">
                Должен ли пост быть опубликован?
            </small>
        </div>

    </div>
    <div class='col-sm-6 col-md-4'>

        <div class="form-group">
            <label for="blog_posted_at">Posted at</label>
            <input type="text" class="form-control" id="blog_posted_at" aria-describedby="blog_posted_at_help"
                   name='posted_at'
                   value="{{old("posted_at", $post->posted_at ?? \Carbon\Carbon::now())}}">
            <small id="blog_posted_at_help" class="form-text text-muted">
                Когда пост должен быть опубликован. Если дата больше чем
                сейчас ({{\Carbon\Carbon::now()}}) тогда пост будет опубликован в указанную дату.
                Правильный формат <code>YYYY-MM-DD HH:MM:SS</code>.
            </small>
        </div>


    </div>
</div>


<div class="form-group">
    <label for="blog_post_body">Текст
        @if(config("blogetc.echo_html"))
            <!-- (HTML) -->
        @else
         <!-- (Html will be escaped) -->
        @endif

    </label>
    <!-- <div class='alert alert-warning'>
        Please note that any HTML (including any JS code) that is entered here will be
        echoed (without escaping)
    </div> -->
    <textarea style='min-height:600px;' class="form-control editor-tiny-mce" id="blog_post_body" aria-describedby="blog_post_body_help"
              name='post_body'>{{old("post_body",$post->post_body)}}</textarea>


</div>




@if(config("blogetc.use_custom_view_files",true))
    <div class="form-group">
        <label for="blog_use_view_file">Custom View File</label>
        <input type="text" class="form-control" id="blog_use_view_file" aria-describedby="blog_use_view_file_help"
               name='use_view_file'
               value='{{old("use_view_file",$post->use_view_file)}}'>
        <small id="blog_use_view_file_help" class="form-text text-muted">Optional - if anything is entered here, then it
            will attempt to load <code>view("custom_blog_posts." . $use_view_file)</code>. You must create the file in
            /resources/views/custom_blog_posts/FILENAME.blade.php.
        </small>
    </div>
@endif



<div class="form-group">
    <label for="blog_seo_title">SEO: {{"<title>"}} тэг (опционально)</label>
    <input class="form-control" id="blog_seo_title" aria-describedby="blog_seo_title_help"
              name='seo_title' tyoe='text' value='{{old("seo_title",$post->seo_title)}}' >
    <small id="blog_seo_title_help" class="form-text text-muted">
        Введиде значение для {{"<title>"}} тэг.
        Если оставить пустым будет использоваться название поста.
    </small>
</div>

<div class="form-group">
    <label for="blog_meta_desc">Мэта описание (опционально)</label>
    <textarea class="form-control" id="blog_meta_desc" aria-describedby="blog_meta_desc_help"
              name='meta_desc'>{{old("meta_desc",$post->meta_desc)}}</textarea>
</div>

<div class="form-group">
    <label for="blog_short_description">Короткое описание (опционально)</label>
    <textarea class="form-control" id="blog_short_description" aria-describedby="blog_short_description_help"
              name='short_description'>{{old("short_description",$post->short_description)}}</textarea>
</div>

@if(config("blogetc.image_upload_enabled",true))

    <div class='bg-white pt-4 px-4 pb-0 my-2 mb-4 rounded border'>
        <style>
            .image_upload_other_sizes {
                display: none;
            }
        </style>
        <h4>Изображение <small class="text-muted">(опционально)</small></h4>
        


        @foreach(config("blogetc.image_sizes") as $size_key =>$size_info)
            <div class="form-group mb-4 p-2
        @if($loop->iteration>1)
                    image_upload_other_sizes
            @endif
                    ">
                @if($post->has_image($size_info['basic_key']))
                    <div style='max-width:55px;  ' class='float-right m-2'>
                        <a style='cursor: zoom-in;' target='_blank' href='{{$post->image_url($size_info['basic_key'])}}'>
                            <?=$post->image_tag($size_info['basic_key'], false, 'd-block mx-auto img-fluid '); ?>
                        </a>
                    </div>
                @endif

                <small id="blog_{{$size_key}}_help" class="form-text text-muted">Загрузите изображение размером -
                    <code>{{$size_info['w']}}&times;{{$size_info['h']}}px</code> - если будет больше, будет автоматически уменьшено 
                </small>
                <input class="form-control" type="file" name="{{$size_key}}" id="blog_{{$size_key}}"
                       aria-describedby="blog_{{$size_key}}_help">


            </div>
        @endforeach

        <!-- <p>
            By default it will resize for all images based on the first image. If you want to select specific images for
            each size, please click: <span onclick='$(this).parent().hide(); $(".image_upload_other_sizes").slideDown()'
                                           class='btn btn-light btn-sm'>Show other sizes</span>
        </p> -->

    </div>
@else
    <div class='alert alert-warning'>Image uploads were disabled in blogetc.php config</div>
@endif


<div class='bg-white pt-4 px-4 pb-0 my-2 mb-4 rounded border'>
    <h4>Категории:</h4>
    <div class='row'>

        @forelse(\WebDevEtc\BlogEtc\Models\BlogEtcCategory::orderBy("category_name","asc")->limit(1000)->get() as $category)
            <div class="form-check col-sm-6">
                <input class="" type="checkbox" value="1"
                       @if(old("category.".$category->id, $post->categories->contains($category->id))) checked='checked'
                       @endif name='category[{{$category->id}}]' id="category_check{{$category->id}}">
                <label class="form-check-label" for="category_check{{$category->id}}">
                    {{$category->category_name}}
                </label>
            </div>
        @empty
            <div class='col-md-12'>
                Нету категорий
            </div>
        @endforelse

        <div class='col-md-12 my-3 text-center'>

            <em><a target='_blank' href='{{route("blogetc.admin.categories.create_category")}}'><i class="fa fa-external-link" aria-hidden="true"></i>
                Добавить новую категорию
            </a></em>
        </div>
    </div>
</div>

<script src="//cdn.tinymce.com/4/tinymce.min.js" referrerpolicy="origin"></script>
<script>
  var editor_config = {
    path_absolute : "/",
    selector: "textarea.editor-tiny-mce",
    plugins: [
      "advlist autolink lists link image charmap print preview hr anchor pagebreak",
      "searchreplace wordcount visualblocks visualchars code fullscreen",
      "insertdatetime media nonbreaking save table directionality",
      "emoticons template paste textpattern"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
    relative_urls: false,
    // file_browser_callback: true,
    file_browser_callback: function(field_name, url, type, win) {
      var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
      var y = window.innerHeight|| document.documentElement.clientHeight|| document.getElementsByTagName('body')[0].clientHeight;
        
        // console.log(editor_config.path_absolute);
        // return false;

      var cmsURL = editor_config.path_absolute + 'laravel-filemanager?field_name=' + field_name;
      if (type == 'image') {
        cmsURL = cmsURL + "&type=Images";
      } else {
        cmsURL = cmsURL + "&type=Files";
      }

      tinyMCE.activeEditor.windowManager.open({
        file : cmsURL,
        title : 'Filemanager',
        width : x * 0.8,
        height : y * 0.8,
        resizable : "yes",
        close_previous : "no"
      });
        // console.log(77);
    }
  };

  tinymce.init(editor_config);
</script>
