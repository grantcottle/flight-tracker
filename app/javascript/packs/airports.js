document.addEventListener("turbolinks:load", function () {
    $origin_input = $('*[data-behavior="origin-autocomplete"]');
    $destination_input = $('*[data-behavior="destination-autocomplete"]');

    var origin_options = {
        url: function (phrase) {
            console.log(phrase);
            return "/airports/search.json?q=" + phrase;
        },
        getValue: "name",
        list: {
            onSelectItemEvent: () => {
                var value = $('#origin').getSelectedItemData().id;
                $("#hidden-origin").val(value).trigger("change");
            },
            match: {
                enabled: true
            }
        }
    };
    var destination_options = {
        url: function (phrase) {
            console.log(phrase);
            return "/airports/search.json?q=" + phrase;
        },
        getValue: "name",
        list: {
            onSelectItemEvent: () => {
                var value = $('#destination').getSelectedItemData().id;
                $("#hidden-destination").val(value).trigger("change");
            },
            match: {
                enabled: true
            }
        }
    };
    $origin_input.easyAutocomplete(origin_options);
    $destination_input.easyAutocomplete(destination_options);
});
