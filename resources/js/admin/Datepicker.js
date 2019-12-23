module.exports = {
    init: function() {
        $('input[name="created_at"]').daterangepicker({
            opens: 'left',
            autoUpdateInput: false,
            locale: {
                format: 'Y-MM-DD',
                separator: "|",
                applyLabel: "Применить",
                cancelLabel: "Отмена",
                fromLabel: "От",
                toLabel: "До",
                customRangeLabel: "Свой",
                daysOfWeek: [
                    "Вс",
                    "Пн",
                    "Вт",
                    "Ср",
                    "Чт",
                    "Пт",
                    "Сб"
                ],
                monthNames: [
                    "Январь",
                    "Февраль",
                    "Март",
                    "Апрель",
                    "Май",
                    "Июнь",
                    "Июль",
                    "Август",
                    "Сентябрь",
                    "Октябрь",
                    "Ноябрь",
                    "Декабрь"
                ],
                // firstDay: 1
            },
        }, function(start, end, label) {
            // console.log(start.format('YYYY-MM-DD') + '|' + end.format('YYYY-MM-DD'));
            // console.log(this);
            $('input[name="created_at"]').val(start.format('YYYY-MM-DD') + '|' + end.format('YYYY-MM-DD'))
        });
    }
 }