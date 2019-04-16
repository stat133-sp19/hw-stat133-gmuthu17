library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Modeling Savings"),
   
   # Input Widgets
   fluidRow(
     column(3,
       sliderInput("initial",
                 "Initial Amount",
                 min = 0,
                 max = 100000,
                 value = 1000,
                 step = 500)),
     column(3,
            sliderInput("rate",
                        "Return Rate (in %)",
                        min = 0,
                        max = 20,
                        value = 5,
                        step = .1)),
     column(3,
            sliderInput("ye",
                        "Years",
                        min = 0,
                        max = 50,
                        value = 20,
                        step = 1))
   ),
   
   fluidRow(
     column(3,
            sliderInput("annual",
                        "Annual Contribution",
                        min = 0,
                        max = 50000,
                        value = 2000,
                        step = 500)),
     column(3,
       sliderInput("growth",
                   "Growth Rate (in %)",
                   min = 0,
                   max = 20,
                   value = 2,
                   step = .1)),
     column(3, 
        selectInput("facet",
                    "Facet?",
                    choices = c("Yes", "No"),
                    selected = "No"))
   ),
      
      # Show a plot of the generated distribution
      mainPanel(
        h4("Timelines"),
        plotOutput("p2"),
        h4("Balances"),
        tableOutput('balances')
      )
)

#' @title Future Value
#' @description computes future value of an investment
#' @param amount initial amount invested
#' @param rate annual rate of return
#' @param years number of years
#' @return future value of an investment
future_value = function(amount, rate, years) {
  return (amount * ((1 + rate)^years))
}

#' @title Future Value of Annuity
#' @description computes future value of an annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param years number of years
#' @return future value of an annuity
annuity = function(contrib, rate, years) {
  return (contrib * ( ( ( (1 + rate) ^ years) - 1) / rate) )
}

#' @title Future Value of a Growing Annuity
#' @description computes future value of a growing annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param growth annual growth rate
#' @param years number of years
#' @return future value of a growing annuity
growing_annuity = function(contrib, rate, growth, years) {
  return (contrib * ( ( ( (1 + rate) ^ years) - ( (1 + growth) ^ years)) / (rate - growth)) )
}

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$p2 <- renderPlot({
    
    no_contrib <- c()
    fixed_contrib <- c()
    growing_contrib <- c()
    
    for (k in 1:(input$ye + 1)) {
      no_contrib[k] = future_value(amount = input$initial, rate = input$rate*.01, years = k - 1)
      fixed_contrib[k] = future_value(amount = input$initial, rate = input$rate*.01, years = k - 1) + annuity(contrib = input$annual, rate = input$rate*.01, years = k - 1)
      growing_contrib[k] = future_value(amount = input$initial, rate = input$rate*.01, years = k - 1) + growing_annuity(contrib = input$annual, rate = input$rate*.01, growth = input$growth*.01, years = k - 1)
    }
    
    simulation <- data.frame(year = 0:input$ye, variable = rep(c('no_contrib', 'fixed_contrib', 'growing_contrib'), each = input$ye + 1), balance = c(no_contrib, fixed_contrib, growing_contrib))
    simulation$variable <- factor(simulation$variable, levels = c('no_contrib', 'fixed_contrib', 'growing_contrib'))

    sPlot = ggplot(data = simulation, aes(x = year, y = balance, col = variable)) + geom_line() + theme_bw() + geom_point() + 
      ggtitle('Three modes of investing') + xlab('year') + ylab('value') + scale_color_discrete('variable')
    
    if (input$facet == "Yes") {
      sPlot = sPlot + geom_area(aes(fill = variable), alpha = .5) + facet_wrap(~variable)
    }
    sPlot
  })

  output$balances <- renderTable({
    year = c()
    no_contrib = c()
    fixed_contrib = c()
    growing_contrib = c()
    
    for (k in 1:(input$ye + 1)) {
      year[k] = k - 1
      no_contrib[k] = future_value(amount = input$initial, rate = input$rate*.01, years = k - 1)
      fixed_contrib[k] = future_value(amount = input$initial, rate = input$rate*.01, years = k - 1) + annuity(contrib = input$annual, rate = input$rate*.01, years = k - 1)
      growing_contrib[k] = future_value(amount = input$initial, rate = input$rate*.01, years = k - 1) + growing_annuity(contrib = input$annual, rate = input$rate*.01, growth = input$growth*.01, years = k - 1)
    }
    
    data.frame(cbind(year, no_contrib, fixed_contrib, growing_contrib))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

