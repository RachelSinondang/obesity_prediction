header <- dashboardHeader(title = "Obesity Prediction")

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(text = "Bussiness Case", 
                 tabName = "case", 
                 icon = icon("dollar-sign")),
        menuItem(text = "About", 
                 tabName = "about", 
                 icon = icon("info-circle")),
        menuItem(text = "Prediction", 
                 tabName = "predict", 
                 icon = icon("balance-scale"))
        
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "predict", 
                h1("Price Prediction", align = "center"),
                fluidRow(
                    box(title = "Factorial Input",
                        background = "black",
                        width = 6,
                        selectInput(inputId = "gender", 
                                    label = "Gender",
                                    choices = unique(obesity$Gender)),
                        selectInput(inputId = "fam", 
                                    label = "Family History with Overweight",
                                    choices = unique(obesity$family_history_with_overweight)),
                        selectInput(inputId = "favc", 
                                    label = "Frequent Consumption of High Caloric Food",
                                    choices = unique(obesity$FAVC)),
                        selectInput(inputId = "caec", 
                                    label = "Consumption of Food between Meals",
                                    choices = unique(obesity$CAEC)),
                        selectInput(inputId = "smoke", 
                                    label = "Smoking",
                                    choices = unique(obesity$SMOKE)),
                        selectInput(inputId = "scc", 
                                    label = "Calories Consumption Monitoring",
                                    choices = unique(obesity$SCC)),
                        selectInput(inputId = "calc", 
                                    label = "Consumption of Alcohol",
                                    choices = unique(obesity$CALC)),
                        selectInput(inputId = "mtrans", 
                                    label = "Transportation Used",
                                    choices = unique(obesity$MTRANS))
                        
                        
                    ),
                    box(title = "Numeric Input",
                        background = "black",
                        width = 6,
                        solidHeader = TRUE,
                        numericInput(inputId = "age", 
                                     label = "Age", 
                                     value = 25,
                                     min = 10, 
                                     max = 80, 
                                     step = 1),
                        numericInput(inputId = "height", 
                                     label = "Height (m)", 
                                     value = 1,
                                     min = 1.2, 
                                     max = 2, 
                                     step = 0.1),
                        numericInput(inputId = "weight", 
                                     label = "Weight (kg)", 
                                     value = 45,
                                     min = 30, 
                                     max = 200, 
                                     step = 0.1),
                        numericInput(inputId = "fcvc", 
                                     label = "Frequency of consumption of vegetables", 
                                     value = 1,
                                     min = 1, 
                                     max = 3, 
                                     step = 0.1),
                        numericInput(inputId = "ncp", 
                                     label = "Number of main meals", 
                                     value = 1,
                                     min = 1, 
                                     max = 4, 
                                     step = 0.1),
                        numericInput(inputId = "ch2o", 
                                     label = "Consumption of water daily (L)", 
                                     value = 1,
                                     min = 1, 
                                     max = 3, 
                                     step = 0.1),
                        numericInput(inputId = "faf", 
                                     label = "Physical activity frequency", 
                                     value = 1,
                                     min = 0, 
                                     max = 3, 
                                     step = 0.1),
                        numericInput(inputId = "tue", 
                                     label = "Time using technology devices", 
                                     value = 1,
                                     min = 0, 
                                     max = 2, 
                                     step = 0.1)),
                    valueBoxOutput("prediction")
                )
        )
        
        
    ))





dashboardPage(
    header = header,
    body = body,
    sidebar = sidebar, 
    skin = "red"
)
