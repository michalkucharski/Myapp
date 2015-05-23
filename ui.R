library(shiny)

# Define UI for application that calculate BMI index 
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("BMI calculator"),
    
    # Sidebar with a slider input for number of observations
    sidebarPanel(
        tags$head(
            tags$style("body {background-color: LightSteelBlue; }")
        ),
        sliderInput("mass", 
                    "Your weight (in kg):", 
                    min = 40,
                    max = 150, 
                    value = 50),
        sliderInput("hight", 
                    "Your height (in cm):", 
                    min = 145,
                    max = 190, 
                    value = 160,
                    step = 5)
    
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        h4('Your body mass index (BMI) is: '),
        verbatimTextOutput("Bmass"),
        
        plotOutput("distPlot")
    )
))