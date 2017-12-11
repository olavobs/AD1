#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

dados <- read.csv("../../dados/series_from_imdb.csv",encoding="UTF-8")
series <- dados$series_name

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Compare suas séries preferidas"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      selectInput("Serie1",
                  "Selecione a primeira serie",
                  choices = sort(as.character(series)), 
                  selected = "Prison Break"),
    
    selectInput("Serie 2",
                "Selecione a segunda serie",
                choices = sort(as.character(series)), 
                selected = "The Walking Dead")
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
