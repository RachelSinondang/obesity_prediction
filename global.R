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