library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(plotly)
library(babynames)
ui <- fluidPage(
  titlePanel('Insights about Baby Names in the US - with Interactive Graphs'),
  sidebarLayout(
    sidebarPanel(
      
      selectInput('sex','Enter Sex',selected = 'M', choices = c('M','F')),
      sliderInput('year','Pick a range', value = 2010, min = 2010, max = 2017)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Table',
          DT::DTOutput("trend1")
        ),
        tabPanel('Plot',
          plotly::plotlyOutput("trendy_names_plot")
        )
      )
    )
  )
)

server <- function(input, output, session){
  data_name <- function(){
    babynames %>%
    filter(sex == input$sex) %>%
    filter(year == input$year) %>%
    ggplot(aes(x = year, y = p, color = "sex" )) +
    geom_line()}
  
  table_data <- function()
    {babynames %>%
      filter(year == input$year) %>%
      dplyr::slice_sample(prop = .1) %>%
      DT::datatable()
  }
  
  output$trendy_names_plot <- renderPlotly({
    data_name()
  })
  
  output$trend1 <- DT::renderDT({
    table_data()
  })
  
}

shinyApp(ui = ui, server = server)