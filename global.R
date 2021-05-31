library(shiny)
library(shinydashboard)
library(plotly)
library(scales)
library(glue)
library(DT)
library(ggplot2)
library(tidyverse)
library(randomForest)
library(caret)

obesity <- read.csv("ObesityDataSet_raw_and_data_sinthetic.csv")
obesity <- obesity %>% 
  mutate(Gender = as.factor(Gender),
         family_history_with_overweight = as.factor(family_history_with_overweight),
         FAVC = as.factor(FAVC),
         CAEC = as.factor(CAEC),
         SMOKE = as.factor(SMOKE),
         SCC = as.factor(SCC),
         CALC = as.factor(CALC),
         MTRANS = as.factor(MTRANS),
         NObeyesdad = as.factor(NObeyesdad)) %>%
  drop_na()

death_rate <- read.csv("death-rate-from-obesity.csv")


theme_algoritma <- theme(legend.key = element_rect(fill="black"),
                         legend.background = element_rect(color="white", fill="#263238"),
                         plot.subtitle = element_text(size=6, color="white"),
                         panel.background = element_rect(fill="#dddddd"),
                         panel.border = element_rect(fill=NA),
                         panel.grid.minor.x = element_blank(),
                         panel.grid.major.x = element_blank(),
                         panel.grid.major.y = element_line(color="darkgrey", linetype=2),
                         panel.grid.minor.y = element_blank(),
                         plot.background = element_rect(fill="#263238"),
                         text = element_text(color="white"),
                         axis.text = element_text(color="white")
                         
)

share_death <- read.csv("share-of-deaths-obesity.csv")