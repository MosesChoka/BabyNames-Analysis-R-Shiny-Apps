#install.packages("shiny")
library(shiny)

# Create the client and server side of the application
# i. Client/UI side
ui <- fluidPage(
  textInput("name", "Enter a name:"),
  textOutput("q")
)
# ii. Server
server <- function(input, output){
  output$q <- renderText({
    paste("Do you prefer dogs or cats,",
          input$name, "?")
  })
  
}

shinyApp(ui = ui , server = server)