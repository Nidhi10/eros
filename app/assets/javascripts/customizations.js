$(document).on('page:change', function () {
    $("#price_rng").slider({
        ticks: [10, 20, 30, 40, 50, 60],
        ticks_labels: ['10', '20', '30', '40', '50', '50+'],
        ticks_snap_bounds: 10
    });
    $("#ratings").slider({
        ticks: [1, 2, 3, 4, 5],
        ticks_labels: ['1', '2', '3', '4', '5'],
        ticks_snap_bounds: 1
    });
    $("#session_rng").slider({
        ticks: [10, 20, 30, 40, 50, 60],
        ticks_labels: ['10', '20', '30', '40', '50', '50+'],
        ticks_snap_bounds: 10
    });

    $('.typeahead').typeahead({
        minLength: 2,
        highlight: true
    },
    [{
        source: function(query, syncResults, asyncResults) {
            $.get('/search/suggest?q=' + query, function(data) {asyncResults(data.suggestions[0].options)})
        },
        async: true,
        display: function(data) {
            return data.payload.name;
        },
        templates: {
            suggestion: function(data) {
                return '<div>' + data.payload.name + " - " + data.payload.about + "</div>";
            }
        }
    }]).on('typeahead:select', function() {
        submitForm.call($('.twitter-typeahead').parent('form').get(0));
    });

    $(document).on('change', '.filter input', function(){
        submitForm.call($('.filter').get(0));
    });

    $(document).on("submit", "form[method=get]", function(e) {
        submitForm.call(this);
        return false;
    });
});

function submitForm() {
    console.log(this);
    Turbolinks.visit(this.action+(this.action.indexOf('?') == -1 ? '?' : '&')+$(this).serialize());
}