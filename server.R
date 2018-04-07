#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
data("galton")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$Plot <- renderPlot({
    gg <- ggplot(galton, aes(x = parent, y = child)) + geom_point(alpha = 0.2, col = "blue")
    gg + geom_smooth(method = "lm")
  })
  
  output$pred <- renderText({
    k <- as.numeric(input$slider)
    fit <- lm(child ~ parent, data = galton)
    newparent <- data.frame(parent = c(k))
    prediction <- predict(fit, newdata = newparent)
  })
  
})
