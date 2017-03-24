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
  titlePanel("Individual Stock & Benchmark - Historical Return Analysis"),
  sidebarLayout(
    sidebarPanel(
        textInput('ticker', "What is the ticker of the stock to analyze? (Black Time Series)",
                  value = "AAPL"),
        textInput('bench', "What is the benchmark to use in comparision? (Red Time Series)",
                  value = "SPY"),
        dateInput('start', 'When is the begining of the financial time series?',
                  value = '2008-01-01', format = "yyyy-mm-dd"),
        dateInput('end', 'When is the ending of the financial time series?',
                  value = '2016-11-30', format = "yyyy-mm-dd"),
        h5("Author: Anthony Lei"),
        h5("https://www.linkedin.com/in/anthonylei/"),
        h5("Acknowledgement: This application built with packages quantmod and PerformanceAnalytics in R, credit goes to the authors: Ryan etal. and Peterson etal.")
    ),
    mainPanel(
        plotOutput("plotReturn"),
        h5("This software merely provides a summary of historical return information and DOES NOT OFFER ANY INVESTMENT ADVICE. There is absolutely NO ANY GUARANTEE for utilizing this software in making any investment decisions. For reference, please visit: https://anthonylei.github.io/DevelopDataProduct")
    )  
  )
))
