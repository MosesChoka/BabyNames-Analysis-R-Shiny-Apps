library(shiny)
library(babynames)
library(dplyr)
library(DT)

# ui
ui <- fluidPage(
  titlePanel("An interactive Table for Baby names Statistics"),
  sidebarLayout(
    sidebarPanel(
      selectInput('sex', 'Select the Sex', selected = 'M', choices = c('M', 'F')),
      sliderInput('year', 'Choose a range of years', value = 2000, min = 2000, max = 2017)
    ),
    mainPanel(
      DT::DTOutput('tabulate')
    )
    
  )
)


server <- function(input,output,session){
  top_10_names <- function()
  {
    babynames %>%
      filter(sex == input$sex) %>%
      filter(year == input$year) %>%
      dplyr::slice_sample(prop = .1) %>%
      DT::datatable()
  }
  
  output$tabulate <- DT::renderDT({
    top_10_names()
  })
}

shinyApp(ui = ui , server = server)
