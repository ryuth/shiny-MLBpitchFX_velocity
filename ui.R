library(shiny)
library(data.table)
library(dplyr)
library(ggplot2)
library(httr)
library(RJSONIO)
library(knitr)
library(rmarkdown)
library(htmltools)
library(jsonlite)

shinyUI(fluidPage(

titlePanel("Velocity Attribute"),
  
sidebarLayout(
  
  sidebarPanel(
    
    # Slider for setting year parameter
    
    sliderInput("year",
                "year:",
                min=2008,max=2015,value=c(2008,2015)
                ),
    
    selectInput("pitcher_name","Pitcher Name:", choices = unique(data$pitcher_name)),
    
    selectInput("pitch_type","Pitch Type:", choices = unique(data$pitch_type)),
    
    helpText("Please wait 30 seconds for 2008 to 2015 pitchFx data to load")
    
  ),
  
  mainPanel(plotOutput("pitcher_bar"))
  
)))
