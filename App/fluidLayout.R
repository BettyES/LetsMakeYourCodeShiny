library(shiny)
library(ggplot2)
ui <- fluidPage(
  h1("Some iris data visualised"),br(),

  fluidRow(

    column(4,
           wellPanel(
      sliderInput("bin", "Binwidth:",
                  min = 0.1, max = 1, value = 1)
    )),

    column(8,
      plotOutput("Iris")
    )
  )
)
server <- function(input, output) {
  output$Iris <- renderPlot({
    ggplot(iris)+geom_histogram(aes(Sepal.Length, fill=Species),binwidth=input$bin, colour="white")+facet_wrap(~Species)
  })
}
shinyApp(ui = ui, server = server)
