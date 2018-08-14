data <- read.csv("/Volumes/Front/Adam/MasterData/other_files/client_website_ga_id.csv")
# data <- as.data.frame(data)
test <- data$id



library(shiny)

ui <- fluidPage(
  
  selectizeInput(inputId = "test", label = "This is a test", choices = test,
                 multiple = T),
  textOutput("mormon")
  
)

server <- function(input, output, session) {
  
  output$mormon <- renderText({
    
    input$test
    
  })
  
}

shinyApp(ui = ui, server = server)