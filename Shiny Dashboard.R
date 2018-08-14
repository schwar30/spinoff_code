library(shiny)
library(shinyWidgets)

ui <- fluidPage(
  
  actionBttn(inputId = "test_bttn", label = "this is a test", style = "gradient", color = "primary"), 
  awesomeCheckbox(inputId = "test_checkbox", label = "this is a test"), 
  awesomeCheckboxGroup(inputId = "checkbox_group", label = "LOZ", choices = c("BOTW", "OOT", "MM", "ALIT"), status = "danger"),
  awesomeRadio(inputId = "radio", label = "metroid", choices = c("metroid", "super metroid", "prime", "other M", "prime 4"), status = "success"),
  radioButtons(inputId = "base_radio", label = "potter", choices = c("dumbledore", "voldemort", "snape")),
  circleButton(inputId = "star_wars", icon = icon("empire")),
  downloadBttn(outputId = "download", label = "Download")
  # closeSweetAlert(session)
)

server <- function(input, output, session) {

  observeEvent(input$star_wars, {
    
    confirmSweetAlert(
      session = session,
      inputId = "confirmation",
      type = "warning",
      title = "Want to Confirm?",
      danger_mode = T,
      btn_labels = "Why Yes, of couRse!", 
      closeOnClickOutside = T
    )
    
  })
  
  observeEvent(input$confirmation, {
    
    # stopApp()
    
  })
  
}

shinyApp(ui = ui, server = server)