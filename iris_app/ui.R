library(shiny)
library(readr)
library(ggplot2)
library(gridExtra)
library(e1071)


# Ui
ui <- fluidPage(
  sidebarPanel(
    fileInput("file1", "Choose CSV File", accept = ".csv"),
    checkboxInput("header", "Header", TRUE),
    radioButtons("radio", label = "Chose a method",
                 choices = c("SVM" = 1, "Regression" = 2),selected = 1),
    actionButton("action", label = "Calculate"),
    selectInput("svm.x", label = "X Variable", choices=colnames(iris.train)),
    selectInput("svm.y", label = "Y Variable", choices=colnames(iris.train))
  ),
  mainPanel(
    plotOutput("plot1"),
    textOutput("contents")
    
    
  )
)