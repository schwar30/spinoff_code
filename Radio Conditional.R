library(shiny)

ui <- fluidPage(
  
  radioButtons(inputId = "radio", label = "Radio Buttions", 
               choices = c("a", "b"), selected = "a"),
  actionButton(inputId = "button", label = "test")
  
)

server <- function(input, output, session) {
 observeEvent(input$button, {
  if(input$radio == "a"){
    
    print("This is A")
    
  }else{
  
  if(input$radio == "b") {
    
    print("This is b")
    
  }else{
    
    print("This shouldn't come up")
    
  }
  }
 })

} 

shinyApp(ui = ui, server = server)