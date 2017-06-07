
library(shiny)

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
    
    output$data <- renderTable({
      iris[colm()]
    })
   
   output$mpgPlot <- renderPlot({
     boxplot(as.formula(formulaText()), data = mpgData, outline = input$outliers)
   })
   
  }
)
