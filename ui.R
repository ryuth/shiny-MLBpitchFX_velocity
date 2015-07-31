library(shiny)
library(shinyapps)
library(data.table)
library(dplyr)
library(ggplot2)
library(httr)
library(RJSONIO)
library(knitr)
library(rmarkdown)
library(htmltools)
library(jsonlite)
library(BatchJobs)
library(BBmisc)

shinyUI(fluidPage(

titlePanel("MLB Individual Pitcher Data Analysis"),
  
sidebarLayout(
  
  sidebarPanel(
    
    # Slider for setting year parameter
    
    sliderInput("year",
                "year:",
                min=2008,max=2015,value=c(2008,2015)
                ),
    
    selectInput("pitcher_name","Pitcher Name:", choices = unique(pitch_data$pitcher_name)),
    
    selectInput("pitch_type","Pitch Type:", choices = unique(pitch_data$pitch_type)),
    
    helpText("Please wait 20 seconds for 2008 to 2015 pitchFx data to load at the launch of this program.
             You can also type in the pitcher name in the drop box menu to look for pitcher of your interest")
    
  ),
  
  mainPanel(plotOutput("pitcher_bar"))
  
)))
