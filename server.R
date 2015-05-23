library(shiny)

bmi <- function(mass,hight) mass/((hight/100)^2)
# Define server logic required to generate a BMI index plot with quantiles 
shinyServer(function(input, output) {
    
    # Expression that generates a plot of the distribution. The expression
     
    output$Bmass <- renderPrint({bmi(input$mass,input$hight)})
    
    
    
    output$distPlot <- renderPlot({
        # generate a scatter plot and plot it
        bmiout <- reactive({bmi(input$mass,input$hight)})
        bmi_var <- bmiout()
        plot(bmi_var, 1, xlim = c(12,50),type= "p",
             xlab = "BMI", ylab = "")
        rect(4, 0, 18.5, 2, col = "blue") # underweight 
        rect(18.5, 0, 25, 2, col = "green") #normal weight
        rect(25, 0, 30, 2, col = "yellow") #overweight
        rect(30, 0, 110, 2, col = "red") #obese
        legend("topright", pch = 15, col=c("blue","green","yellow","red"),
        legend=c("Underweight","Normal Weight", "Overweight", "Obese")
        ) 
        points(bmi_var,1,col="black",pch=15)
    })
  
})