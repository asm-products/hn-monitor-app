jQuery(document).ready(function(a) {
  a("#TokenKeywords").tokenfield({
        autocomplete: {
            source: ["facebook", "Ruby", "open source", "Javascript"],
            delay: 100
        },
        showAutocompleteOnFocus: !0,
        delimiter: [",", " ", "-", "_"]
    });

  a("#TokenURLs").tokenfield({
        autocomplete: {
            source: ["mywebsite.com", "Assembly.com", "coderwall.com"],
            delay: 100
        },
        showAutocompleteOnFocus: !0,
        delimiter: [",", " ", "-", "_"]
    });
     
});