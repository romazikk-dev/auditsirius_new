@foreach($columns as $row)
    @if(!$row->filter)
        <th></th>
    @elseif(!$row->filter->enabled)
        <th></th>
    @else
        <th>
            {!! $row->filter !!}
        </th>
    @endif
    @if($loop->last)
        <th class="{{ $grid->getGridFilterFieldColumnClass() }}">
            <div class="pull-right">
                <button type="submit"
                        class="btn btn-outline-primary grid-filter-button btn-sm"
                        title="filter data"
                        form="{{ $formId }}">Filter&nbsp;<i class="fa fa-filter"></i>
                </button>

                <a href="http://audit/dash/messages" title="refresh table for messages" class="btn btn-sm btn btn-outline-info">
                    Сбросить
                    <i class="fas fa-redo"></i>
                </a>
            </div>
        </th>
    @endif
@endforeach
