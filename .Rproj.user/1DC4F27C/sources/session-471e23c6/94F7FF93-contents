library(shiny)
library(babynames)
library(ggplot2)

library(plotly)

# ui
ui <- fluidPage(
  titlePanel("Plot showing trendy names"),
  sidebarLayout(
    sidebarLayout(
      selectInput('name','Select Name',top_trendy_names$name),
      sliderInput('year','Enter year range', value = 2000, min = 2000, max = 2010 )),
    mainPanel(
      plotly::plotlyOutput('plot_trendy_names')
    )
  )
)

server <- function(input, output, session)
{
  plot_trends <- function(){
    babynames %>% 
      filter(name == input$name ) %>%
      filter (year == input$year ) %>%
      ggplot(aes(x = year, y = n)) +
      geom_col()
  }
}

shinyApp(ui = ui, server = server )
