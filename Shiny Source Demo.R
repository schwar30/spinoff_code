library(shiny)

ui <- fluidPage(
  
  actionButton(inputId = "click", label = "Click Me!"),
  textOutput("text")
  
)

server <- function(input, output, session) {
  
  observeEvent(input$click, {
    
    output$text <- renderText({
      
      source("~/Desktop/Rob Scripts/Reference Files/source.R")
      
      my_neat_string
      
    })
    
  })
  
}

shinyApp(ui = ui, server = server)
