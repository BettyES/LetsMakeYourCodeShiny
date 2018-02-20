library(shiny)
library(ggplot2)
ui <-
  navbarPage("Iris data: ",
    tabPanel("Plot",
    sidebarLayout(position="left",
          sidebarPanel(
                    sliderInput("bin", "Binwidth:",min = 0.1, max = 1, value = 1)
                  ),
                  mainPanel(
                    plotOutput("IrisPlot")
                  ))
  ),
  tabPanel("Summary",
           verbatimTextOutput("IrisSummary")),
  tabPanel("Table",
           tableOutput("IrisTable"))
  )

server <- function(input, output) {
  output$IrisPlot <- renderPlot({
    ggplot(iris)+geom_histogram(aes(Sepal.Length, fill=Species),binwidth=input$bin, colour="white")+facet_wrap(~Species)
  })
  output$IrisSummary <- renderPrint({summary(iris)})
  output$IrisTable <-renderTable(iris)
}
shinyApp(ui = ui, server = server)
