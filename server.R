library(shiny);  library(ggplot2);library(caret)

shinyServer(function(input, output) {
  mtcarsFac<-mtcars[,colnames(mtcars) %in% c("mpg","wt","qsec","am")]
  mtcarsFac$am<- as.factor(mtcarsFac$am)
  modLM<-lm(mpg~wt+qsec+am, data=mtcarsFac)
  modGLM<-train(mpg~wt+qsec+am, data=mtcarsFac, method="glm")

  model1pred <- reactive({
    weight<- input$wt; quarterTime<- input$qsec;   automatic_manual<- as.factor(input$am)
    predict(modLM, newdata= data.frame(wt=weight,qsec=quarterTime,am=automatic_manual))
  })
  model2pred <- reactive({
    weight<- input$wt; quarterTime<- input$qsec;   automatic_manual<- as.factor(input$am)
    predict(modGLM, newdata= data.frame(wt=weight,qsec=quarterTime,am=automatic_manual))
  })
  output$plot1 <- renderPlot({
    ggplot( aes( x=wt,y=mpg, colour=am) ,data=mtcarsFac )+geom_point(aes(size=mtcars$qsec))
  })
  output$mpglm <- renderText({model1pred()  })
  output$mpgcaret <- renderText({ model2pred()})
})
