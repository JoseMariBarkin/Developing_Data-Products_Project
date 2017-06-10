
library(shiny)
library(ggplot2)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(
  function(input, output){
    
    colm <- reactive({
      as.numeric(input$var)
    })
    
    formulaText <- reactive({
      paste("mpg ~", input$variable)
    })
    
    # Return the formula text for printing as a caption
    output$caption <- renderText({
      formulaText()
    })
    
    output$sum <- renderPrint({
      summary(mpgData)
    })
    
    output$str <- renderPrint({
      str(mpgData)
    })
    
    output$mpgPlot <- renderPlot({
      boxplot(as.formula(formulaText()), data = mpgData, outline = input$outliers)
    })
    
  }
)

#ggplot(mtcars, aes(wt, mpg)) + geom_point() + geom_smooth(method="lm")
#ggplot(mtcars, aes(x=wt, y=mpg, col=cyl, size=disp)) + geom_point()

#output$data <- renderPlot({
#  ggplot(as.formula(formulaText()), mpgData, aes(data, mpg)) + geom_point() + geom_smooth(method="lm")
#})

