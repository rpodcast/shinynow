## Obtaining Current Date in a Shiny App

This repo contains a solution to obtaining the current date of the application user's session and updating a `dateRangeInput` when the application first launches. This example was inspired by Eric Scott's [question on Mastodon](https://fosstodon.org/@LeafyEricScott/109960667363297079).

Here is the logic behind the solution seen in this application:

* Create custom JavaScript to obtain the current date-time and update a **hidden** Shiny text input with ID `clientDate` with the date portion of the value.

The JS code is quite simple, once you know about the `Date()` function!

```
$( document ).ready(function() {
  var d = new Date();
  var targetDate = $('#clientDate');
  // https://stackoverflow.com/a/35922073
  targetDate.val(d.toISOString().slice(0, 10));
});
```

The key to creating a hidden Shiny input is to give a little custom CSS to suppress display.

```r
HTML('<input type="text" id="clientDate" name="Client Date" style="display: none;"> '),
```

To update the `dateRangeInput` upon application startup, use a neat trick of creating an `observeEvent` that evaluates as TRUE right away!

```r
  observeEvent(TRUE, {
    updateDateRangeInput(
      session,
      "date_range",
      start = input$clientDate,
      end = input$clientDate
    )
  })
```

This application is deployed at <https://rpodcast.shinyapps.io/shinynow>.