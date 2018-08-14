library(shiny)

# I wanted to see if ui outputs had to be unique. The answer is no, which is 
# fantastic. Now all I need to do is make sure I can figure out how to toggle between
# with impunity. Honestly, I wish I would have discovered this sooner because it would 
# make some of my other mini apps run cleaner, but I could go back and update (it's really
# just switching some tags, but it may not be worth it either). Worth thinking about for other
# future projects which is the real intent.

ui <- fluidPage(
  
  textInput(inputId = "text1", label = "Test1"), 
  actionButton(inputId = "update1", label = "Update1"),
  textInput(inputId = "text2", label = "Test2"),
  actionButton(inputId = "update2", label = "Update2"),
  textOutput("trial")
)

server <- function(input, output, session){
  
  observeEvent(input$update1, {
    
    output$trial <- renderText({
      isolate(input$text1)
      
      input$text1
    })
    
    observeEvent(input$update2, {
      
      output$trial <- renderText({
        
        isolate(input$text2)
        
        input$text2
        
      })
      
    })
    
  })
  
}

shinyApp(ui = ui, server = server)