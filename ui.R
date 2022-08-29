library(shiny)
library(dplyr)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("GDP Grapher"),

    sidebarLayout(
      sidebarPanel(
            selectInput("countries",
                        "Countries:",
                        "Names", multiple = TRUE)
        ),

        # Show a plot of the GDP
        mainPanel(
          plotOutput("Plot"),h2("GDP_Comparisson"),
        )
    )
)
)