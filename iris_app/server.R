library(shiny)
library(readr)
library(ggplot2)
library(gridExtra)
library(e1071)

iris.true <- iris[,5]
iris.train <- iris[,-5] # no cheating

# Naive Bayes
nb.classifier <- naiveBayes(iris.train, iris.true)
nb.clusters <- factor(as.integer(predict(nb.classifier,iris.train)))

# SVM
svm.classifier <- svm(iris.train, iris.true)
svm.clusters <- factor(as.integer(predict(svm.classifier,iris.train)))

iris.result <- cbind(iris.train, nb.clusters, svm.clusters)

#Modules
cluster <- function(data1) {}


# Server
server <- function(input, output) {
  output$contents <- renderPrint({
    file <- input$file1
    ext <- tools::file_ext(file$datapath)
    req(file)
    validate(need(ext == "txt", "Please upload a csv file"))
    data <- read.csv(file$datapath, header = input$header)
    head(data)
    data$variety <- factor(data$variety)
    model <- svm (variety ~., data = data)
    summary (model)
    
  })
  output$plot1 <- renderPlot(
    ggplot(iris.result,aes_string(x=input$svm.x, y=input$svm.y,color='svm.clusters')) + geom_point()
  )
  
}



# Run app
shinyApp(ui = ui, server = server)