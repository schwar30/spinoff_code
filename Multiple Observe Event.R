library(shiny)
library(shinyWidgets)
library(dplyr)
library(stringr)

ui <- fluidPage(
  
  textInput(inputId = "text", label = "Input some text"),
  actionBttn(inputId = "button", label = "test"),
  textOutput("text_output")
  
)

server <- function(input, output, session) {
  
  observeEvent(input$button, {
    
    output$text_output <- renderText({
      
      input$text
      
    })
    
  })
  
  observeEvent(input$button, {
    
    if(input$text == "") {
      
      confirmSweetAlert(session = session, 
                        inputId = "blank",
                        title = "There is no input text!",
                        type = "error",
                        btn_labels = "OK!",
                        danger_mode = T)
      
    }else{
      
      if(!str_detect(input$text, "a|e|i|o|u|y|A|E|I|O|U|Y")) {
        
        confirmSweetAlert(session = session, 
                          inputId = "no_vowels",
                          title = "There are no vowels in this text!",
                          type = "warning",
                          btn_labels = "OK!",
                          danger_mode = T)
        
      }else{
        
        confirmSweetAlert(session = session,
                          inputId = "vowels",
                          title = "There are vowels in this text!",
                          type = "success",
                          btn_labels = "OK!",
                          danger_mode = T)
        
      }
      
    }
    
  })
  
}

shinyApp(ui = ui, server = server)