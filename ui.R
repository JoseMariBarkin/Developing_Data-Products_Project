
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Header or Title Panel
  titlePanel(title = h4("Demostration of renderplot() - a histogram", align="center")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      selectInput("variable", "Variable:", choices = c("Cylinders" = "cyl", "Transmission" = "am", "Gears" = "gear")),
      checkboxInput("outliers", "Show outliers", FALSE),
      
            br(),
            sliderInput("bins", "Select the Number of bins for histogram", min = 5, max = 25, value = 15),
            br(),
            radioButtons("color", "3. Select the color of histohram", choices = c("Green", "Red", "Yellow"), selected = "Green")
    ),
    
    # main panel
    mainPanel(
      tabsetPanel(type="tab",
                  tabPanel("Summary", verbatimTextOutput("sum")),
                  tabPanel("Structure", verbatimTextOutput("str")),
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Plot", plotOutput("mpgPlot")),
                  tabPanel("About", helpText("4. You must also include enough documentation so that a novice user could use your application. 
                                             5. The documentation should be at the Shiny website itself. Do not post to an external link."))
                  )
    )
  )
))
