library(shiny)
library(babynames)
library(dplyr)

# ui
ui <- fluidPage(
  titlePanel("Top 10 Baby Names"),
  sidebarLayout(
    sidebarPanel(
      selectInput('sex', 'Enter the sex:', selected ='F' , choices = c('M','F')),
      sliderInput('year', 'Pick a range for birth year', value = 2000, min = 2000, max = 2015)
    ),
    mainPanel(
      tableOutput('top_10_baby_names_table')
    )
  )
  
)

server <- function(input, output, session){
  top_10_names <- function(){
    babynames %>% 
      filter(year == input$year) %>%
      filter(sex == input$sex)
  }
  output$top_10_baby_names_table <- renderTable({
    top_10_names()
  })
}

shinyApp(ui = ui, server = server)