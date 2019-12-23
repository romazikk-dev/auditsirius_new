@if($grid->wantsPagination() && !$grid->gridNeedsSimplePagination())
    <div class="pull-{{ $direction }}">
        <b>
            @if($grid->getData()->total() <= $grid->getData()->perpage())
                @if(!isset($atFooter))
                    Показано с {{ ($grid->getData()->currentpage() - 1 ) * $grid->getData()->perpage() + 1 }}
                    по {{ $grid->getData()->total() }}
                    из {{ $grid->getData()->total() }}.
                @endif
            @else
                Показано с {{ ($grid->getData()->currentpage() - 1 ) * $grid->getData()->perpage() + 1 }}
                по {{ $grid->getData()->currentpage() * $grid->getData()->perpage() }}
                из {{ $grid->getData()->total() }}.
            @endif
        </b>
    </div>
@else
    @if(isset($atFooter))
        @if($grid->getData()->count() >= $grid->getData()->perpage())
            <div class="pull-{{ $direction }}">
                <b>
                    Showing {{ $grid->getData()->count() }} records for this page.
                </b>
            </div>
        @endif
    @else
        <div class="pull-{{ $direction }}">
            <b>
                Showing {{ $grid->getData()->count() }} records for this page.
            </b>
        </div>
    @endif
@endif