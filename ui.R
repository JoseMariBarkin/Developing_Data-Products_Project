
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Title Panel
  titlePanel(title = h4("Developing Data Products: Fuel Efficiency Cars", align="center")),
  
    sidebarPanel(
      selectInput("variable", "Variable:", choices = c("Cylinders" = "cyl", "Transmission" = "am", "Gears" = "gear", "Carburetors" = "carb")),
      checkboxInput("outliers", "Show outliers", FALSE)
      
    ),
    
    # main panel
    mainPanel(
      tabsetPanel(type="tab",
            tabPanel("Readme", 
                h4("Introduction"),
                p(" This is a Basic R Markdown Web Aplication for the asignment week 4 of Developing Data Products. It shows the efficiency of cars in fuel consumption depending on: Number cylinders, gears, Carburetors and if they are automatics or manuals."),
                p("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).  phone keyboard."),
                h4("Application Environment"),
                p("1. R Studio version: 1.0.136"),
                p("2. R version: 3.3.3"),
                p("3. Libraries: Shiny, ggplot2"),
                h4("Application Instruction"),
                p("1. Tab Readme - Display instructions"),
                p("2. Tab Summary - Display a summary of mtcars object"),
                p("3. Tab Structure - Compactly display the internal structure of the mtcars object"),
                p("4. Tab Box Plot - Display a Box Plot of fuel comsuption in mpg (miles per gallon) by:Number of cylinders, Transmission (0 = automatic, 1 = manual), Number of forward gears, Number of carburetors."),
                p("5. Combo box Contains the variables used to measure the fuel comsuption of car acording to the mtcars data.")),       
                  
            tabPanel("Summary", verbatimTextOutput("sum")),
            tabPanel("Structure", verbatimTextOutput("str")),
            tabPanel("Plot", plotOutput("mpgPlot"))
                  
            )
    )
  )
)
