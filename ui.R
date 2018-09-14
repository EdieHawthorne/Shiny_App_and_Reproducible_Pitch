library(shiny)


shinyUI(fluidPage(
  
  
  titlePanel("Predict Height from Girth"),
  
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("SliderGirth", "What's the Number of Girth?", 0, 21, 
                   value = 8.3),
       checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
       checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
       submitButton("submit")
    ),

    
    
    mainPanel(
        plotOutput("plot"),
        h3("Predict Height from Model 1:"),
        textOutput("pred1"),
        h3("Predicted Height from Model 2:"),
        textOutput("pred2")
    )
  )
))
