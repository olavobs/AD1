#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(highcharter)

lerDados <- function(arquivo = "../../dados/series_from_imdb.csv"){
  dados = read.csv(arquivo, encoding="UTF-8")
  return(dados)
} 

dados = lerDados()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    dados <- dados %>% filter(series_name == input$Serie1)
    
    dados <- dados %>% mutate(season_name = paste("Temporada", season))
    hchart(dados, "line", hcaes(x = season_ep, y = UserRating, group = season_name))
  })
})
