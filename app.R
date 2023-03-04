library(shiny)

ui <- fluidPage(
  h2("Current Date Reprex"),
  fluidRow(
    column(
      width = 4,
      dateInput(
        "date",
        "Select Date"
      )
    ),
    column(
      width = 4,
      dateRangeInput(
        "date_range",
        "Select Date Range"
      )
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)