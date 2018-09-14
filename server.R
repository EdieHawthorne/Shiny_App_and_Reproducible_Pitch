
library(shiny)


shinyServer(function(input, output) {
    set.seed (2018-9-12)
    
    trees$Girthsp <- ifelse(trees$Girth - 10 > 0, trees$Girth - 10, 0)
    model1 <- lm(Height~Girth, data=trees)
    model2 <- lm(Height~Girthsp + Girth, data=trees)
    model1pred <- reactive({
        GirthInput <- input$SliderGirth
        predict(model1, newdata = data.frame(Girth=GirthInput))
    })
    model2pred <- reactive({
        GirthInput <- input$SliderGirth
        predict(model2, newdata=data.frame(Girth=GirthInput, Girthsp 
                                           =ifelse(GirthInput- 10 > 0, GirthInput
                                          -10,0)))
      
    })
        output$plot <- renderPlot({
        GirthInput <- input$SliderGirth
    
    
    plot(trees$Girth, trees$Height, xlab = "Girth", ylab = "Height", bty="n", pch=16)
    if (input$showModel1){
        abline(model1, col="red", lwd=2)
    }
    if (input$showModel2){
        model2lines <- predict(model2, newdata=data.frame(Girth=1:21, Girthsp=
                                                              ifelse(1:21-10>0, 
                                                                     1:21-10,0)))
        lines(1:21, model2lines, col="blue", lwd=2)
    }
    legend(25, 150, c("Model 1 Prediction", "Model 2 Prediction"), pch=16,
           col=c("red", "blue"), bty="n", cex=1.2)
    points(GirthInput, model1pred(), col="red", pch=16, cex=2)
    points(GirthInput, model2pred(), col="blue", pch=16, cex=2)
    })
    output$pred1 <- renderText({
        model1pred()
    })
    output$pred2 <- renderText({
        model2pred()
    })
  })

