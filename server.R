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
    
    output$prediction <- renderValueBox({
        
        Gender <- input$gender
        Age <- input$age
        Height <- input$height
        Weight <- input$weight
        family_history_with_overweight <- input$fam
        FAVC <- input$favc
        FCVC <- input$fcvc
        NCP <- input$ncp
        CAEC <- input$caec
        SMOKE <- input$smoke
        CH2O <- input$ch2o
        SCC <- input$scc
        FAF <- input$faf
        TUE <- input$tue
        CALC <- input$calc
        MTRANS <- input$mtrans
        
        obesity_test <- data.frame(Gender,Age,Height,Weight,family_history_with_overweight,FAVC,FCVC,NCP,CAEC,SMOKE,CH2O,SCC,FAF,TUE,CALC,MTRANS)
        
        model_forest <- readRDS("model_forest.RDS")
        
        forest_class <- predict(model_forest, obesity_test, type = "raw")
        
        valueBox(value = forest_class,
                 subtitle = "Prediction",
                 color = "purple",
                 icon = icon("money-bill-alt"))
        
    })
    
    output$plot_rate <- renderPlotly({
        
        death_rate <- death_rate %>% 
            select(-Code) %>% 
            mutate(Entity = as.factor(Entity))
        
        death_rate_plot <- ggplot(death_rate %>% filter(Entity == input$coun1 | Entity == input$coun2 | Entity == input$coun3 | Entity == input$coun4),aes(x = Year, y = Death_rate_from_obesity, group = Entity, color = Entity, text = glue("{Entity}
                         death per 100,000: {Death_rate_from_obesity}"))) +
            geom_line(show.legend = F) + geom_point(show.legend = F) +
            scale_y_continuous(breaks = seq(3,27,3))  +
            labs(title = "Deaths Attributed to Obesity per 100,000 Individuals",
                 subtitle = "1990 to 2017",
                 x = "Year",
                 y = "Death rate") + theme_algoritma
        
        ggplotly(death_rate_plot, tooltip = "text") %>% layout(showlegend = FALSE)
        
    })
    
    output$plot_share <- renderPlotly({
        
        share_death <- share_death %>%
            select(-Code) %>%
            mutate(Entity = as.factor(Entity)) %>%
            rename(death_caused_by_obesity = Obesity..IHME..2019.)
        
        share_plot <- ggplot(share_death %>% filter(Entity == input$neg1 | Entity == input$neg2 | Entity == input$neg3 | Entity == input$neg4),aes(x = Year, y = death_caused_by_obesity, group = Entity, color = Entity, text = glue("{Entity}
                         death % caused by obesity: {death_caused_by_obesity}"))) +
            geom_line(show.legend = F) + geom_point(show.legend = F) +
            scale_y_continuous(breaks = seq(3,27,3))  +
            labs(title = "Share of deaths attributed to obesity",
                 subtitle = "1990 to 2017",
                 x = "Year",
                 y = "Death rate") + theme_algoritma
        
        ggplotly(share_plot, tooltip = "text") %>% layout(showlegend = FALSE)
        
    })
    
})