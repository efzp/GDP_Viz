library(dplyr)
library(shiny)
library(ggplot2)
library(WDI)


shinyServer(function(input, output, session) {

    output$Plot <- renderPlot({
      gdp <- WDI(indicator="NY.GDP.PCAP.KD", country="all", start=2000, end=2020)
      
      data <- reactive({
        req(input$countries)
        df <- gdp %>% filter(country %in% input$countries)
      })
      
      ##Update Select Input
      
      observe({
        updateSelectInput(session, "countries", choices = gdp$country)
      })
      
      ##Plot
      output$Plot <- renderPlot({
        ggplot(data(), aes(year, NY.GDP.PCAP.KD),colour=factor(country)) + geom_line() + 
          xlab('Year') + ylab('GDP per capita')
      })
      
    })

})
