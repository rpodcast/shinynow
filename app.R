library(shiny)

ui <- fluidPage(
  tags$script(src = "current_date.js"),
  h2("Current Date Reprex"),
  # create hidden input for client-side date
  fluidRow(
    HTML('<input type="text" id="clientDate" name="Client Date" style="display: none;"> '),
    column(
      width = 4,
      dateRangeInput(
        "date_range",
        "Select Date Range"
      )
    ),
    column(
      width = 4,
      p("Current date"),
      verbatimTextOutput("client_date_print")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(TRUE, {
    message(input$clientDate)
    updateDateRangeInput(
      session,
      "date_range",
      start = input$clientDate,
      end = input$clientDate
    )
  })
  
  output$client_date_print <- renderPrint({
    req(input$clientDate)
    input$clientDate
  })
}

shinyApp(ui = ui, server = server)