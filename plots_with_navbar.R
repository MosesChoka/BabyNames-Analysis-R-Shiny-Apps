library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(plotly)
library(babynames)

ui <- fluidPage(
  titlePanel('Insights about Baby Names in the US - with Interactive Graph and Table'),
  sidebarLayout(
    sidebarPanel(
      textInput('name','Enter Name:','Dave'),
      selectInput('sex', 'Enter Person Sex', selected = 'M', choices = c('M','F')),
      sliderInput('year','Pick a range', value = 2010, min = 2010, max = 2017)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Table',
          DT::DTOutput("trend1")
        ),
        tabPanel('Plot',
          plotOutput("trendy_names_plot")
        )
      )
    )
  )
)


server <- function(input, output, session){
  output$trendy_names_plot <- renderPlot({
    data_name <- subset(babynames, name == input$name)
    
    
    ggplot(data_name) + geom_line(aes(x = year, y = prop, color = sex ))
    
  })
    
  table_data <- function()
    {babynames %>%
      filter(sex == input$sex) %>%
      filter(year == input$year) %>%
      slice_max(prop, n = 10) %>%
      DT::datatable()}
  
  #output$trendy_names_plot <- renderPlot({
    #data_name()
  #})
  
  output$trend1 <- DT::renderDT({
    table_data()
  })
}
  

shinyApp(ui = ui, server = server)
