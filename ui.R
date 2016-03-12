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
    
    helpText("Year-by_year velocity of all pitches by all pitchers from 2008 season to 2015. Future goal is to do velocity projection of upcoming season using age curve")

    
  ),
  
  mainPanel(plotOutput("pitcher_bar"))
  
)))
