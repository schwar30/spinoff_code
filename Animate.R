ui <- fluidPage(
  verbatimTextOutput("index"),
  sortableTableOutput("tbl"),
  actionBttn(inputId = "update", label = "Row Index"),
  actionBttn(inputId = "sort", label = "Sort Table"),
  verbatimTextOutput("real_index"),
  tableOutput("sorted_table")
)

server <- function(input, output) {
  output$index <- renderPrint({
    cat("Row index:\n")
    input$tbl_row_index
  })
  output$tbl <- renderTable(head(mtcars), rownames = TRUE)
  
  observeEvent(input$update, {
    
    output$real_index <- renderText({
      
      input$tbl_row_index
      
      # browser()
      
    })
    
  })
  
  observeEvent(input$sort, {
    
    output$sorted_table <- renderTable({
      # browser()
      
      data <- head(mtcars[order(input$tbl_row_index),])
      data
      
    })
    
  })
}

shinyApp(ui, server)