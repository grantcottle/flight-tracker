document.addEventListener("turbolinks:load", function () {
    $input = $('*[data-behavior="autocomplete"]');

    var options = {
        url: function (phrase) {
            console.log(phrase);
            return "/airports/search.json?q=" + phrase;
        },
        getValue: "name"
    };
    $input.easyAutocomplete(options);
});
