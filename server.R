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

data <- data.table::fread(input="final_master_table.csv",header = TRUE, data.table = TRUE)
data <- data[,V1:=NULL]

shinyServer(function(input, output){

  selected_data <- reactive({
    
    minyear <- input$year[1]
    maxyear <- input$year[2]
    
    velo <- data %>% group_by(pitcher_name, pitch_type, Year) %>% summarise(velocity = mean(start_speed)) %>%
      arrange(velocity) %>% filter(pitcher_name %in% input$pitcher_name) %>% arrange(pitcher_name) %>% filter(Year >= minyear) %>% filter(Year <= maxyear) %>% filter(pitch_type %in% input$pitch_type)
    print(velo)
  })
  
  output$pitcher_bar <- renderPlot({
    
    p <- ggplot(data=selected_data(), aes(x = Year, y = velocity, group = pitch_type, color = pitch_type)) + geom_line() + geom_point(size=3, fill="white") + xlab("Year") + ylab("Velocity") + ggtitle("Velocity") + theme_bw()
    print(p)
  })
  
   showLogs(appPath = getwd(), appName = "MLB_pitcher_velocity_analysis")

})
