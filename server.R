#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    #stock: Stock has to a valid stock symbol with char format.
    #benchmark: benchmark has to a valid stock symbol with char format.
    #from: the starting date of the time series, note that if data is not avaliable, it will simply take the oldest date. 
    #to: the ending date of the time series, note that it is default as the last day avaliable, it has to be older the start date. 
    library(quantmod)
    library(PerformanceAnalytics)
    output$plotReturn <- renderPlot({
        stockVar <- getSymbols(input$ticker, from= input$start, to = input$end)
        benchmark <- getSymbols(input$bench, from= input$start, to = input$end)
        returns <- merge(Return.calculate(Ad(get(stockVar))),
             Return.calculate(Ad(get(benchmark))),
             join='inner')
        charts.PerformanceSummary(returns)
    })
})
