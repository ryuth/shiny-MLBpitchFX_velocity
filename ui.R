library(shiny)
library(shinyapps)
library(dplyr)
library(ggplot2)
library(RMySQL)

shinyUI(fluidPage(

titlePanel("MLB Individual Pitcher Data Analysis"),

sidebarLayout(
  
  sidebarPanel(
    
    # Slider for setting year parameter
    
    sliderInput("year",
                "year:",
                min=2008,max=2015,value=c(2008,2015)
                ),
    
    selectInput("pitchername","Pitcher Name:", choices = unique(pitcher_names$pitcher_name), selected = 'Roy Halladay'),
    
    selectInput("pitch_type","Pitch Type:", choices = unique(pitch_type$x), selected = "SI"),
    
    helpText("Please wait 20 seconds for 2008 to 2015 pitchFx data to load at the launch of this program.
             You can also type in the pitcher name in the drop box menu to look for pitcher of your interest")
    
  ),
  
  mainPanel(plotOutput("pitcher_bar"))
  
)))
