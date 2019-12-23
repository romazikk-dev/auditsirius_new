<input type="text" name="{{ $name }}" id="{{ $id }}"
       form="{{ $formId }}"
       autocomplete="off"
       class="{{ $class }}"
       value="{{ request($name) }}" title="{{ $title }}" placeholder="{{ $title }}"
       @foreach($dataAttributes as $k => $v)
       data-{{ $k }}={{ $v }}
        @endforeach
>