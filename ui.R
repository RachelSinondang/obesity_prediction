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
        tabItem(tabName = "case",
                fluidRow(
                    mainPanel(width = 12,
                              tags$img(src = "10177.jpg", height = 200, width = 300, align = "center"),
                              br()
                    ),
                    tabBox(
                    height = "250px",
                    width = 12,
                    selected = "Plot",
                    tabPanel(title = "Death Rate",
                             background = "teal",
                             height = "250px",
                             solidHeader = TRUE,
                             fluidRow(column(3,
                                             selectInput(inputId = "coun1", 
                                                         label = "Country 1",
                                                         choices = unique(death_rate$Entity))),
                                      column(3,
                                             selectInput(inputId = "coun2", 
                                                         label = "Country 2",
                                                         choices = unique(death_rate$Entity))),
                                      column(3,
                                             selectInput(inputId = "coun3", 
                                                         label = "Country 3",
                                                         choices = unique(death_rate$Entity))),
                                      column(3,
                                             selectInput(inputId = "coun4", 
                                                         label = "Country4",
                                                         choices = unique(death_rate$Entity)))),
                             fluidRow(plotlyOutput(outputId = "plot_rate",width = 750,height = 400))
                    ),
                    tabPanel(title = "Shared Death",
                             background = "teal",
                             solidHeader = TRUE,
                             height = "250px",
                             fluidRow(column(3,
                                             selectInput(inputId = "neg1", 
                                                         label = "Country 1",
                                                         choices = unique(share_death$Entity))),
                                      column(3,
                                             selectInput(inputId = "neg2", 
                                                         label = "Country 2",
                                                         choices = unique(share_death$Entity))),
                                      column(3,
                                             selectInput(inputId = "neg3", 
                                                         label = "Country 2",
                                                         choices = unique(share_death$Entity))),
                                      column(3,
                                             selectInput(inputId = "neg4", 
                                                         label = "Country4",
                                                         choices = unique(share_death$Entity)))),
                             fluidRow(plotlyOutput(outputId = "plot_share",width = 750,height = 400))
                             
                    )
                ))),
        tabItem(tabName = "predict", 
                h1("Obesity Prediction", align = "center"),
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
