library(shiny)

file_things <- c("Tom", "Marvolo", "Riddle")
things <- c("I", "Am", "Lord", "Voldemort")
new_things <- c("Hello", "My", "Name", "Is", "Elder", "Price")

ui <- fluidPage(
  
  fileInput(inputId = "file", label = "Do Not Input Anything"),
  
  selectizeInput(inputId = "selectize", label = "options",
                 choices = things, multiple = T),
  actionButton(inputId = "button", label = "Button")
  
)

server <- function(input, output, session) {
  
  observeEvent(input$button, {
    
    updateSelectizeInput(session = session, inputId = "selectize", label = "options",
                         choices = new_things)
    
  })
  
  observeEvent(input$file, {
    
    updateSelectizeInput(session = session, inputId = "selectize", label = "options",
                         choices = file_things)
    
  })
  
}

shinyApp(ui = ui, server = server)