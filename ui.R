#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Child's Height Using Galton Dataset"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("slider",
                   "Parent's Height (Predictor):",
                   min = 64.00,
                   max = 73.00,
                   value = 68.00)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("Plot"),
       h4("Predicted Height of Child:"),
       textOutput("pred")
    )
  )
))
