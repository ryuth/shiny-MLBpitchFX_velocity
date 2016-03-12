library(shiny)
library(shinyapps)
library(dplyr)
library(ggplot2)
library(RMySQL)


shinyServer(function(input, output){

  
  selected_data <- reactive({
    
    query <- dbSendQuery(conn = con, statement = paste('SELECT * FROM pitch_velo WHERE pitcher_name = ', "\"",input$pitchername,"\"",';',sep=''))
    pitch_data <- dbFetch(query,n=-1)
    
    minyear <- input$year[1]
    maxyear <- input$year[2]
    
    velo <- pitch_data %>% group_by(pitcher_name, pitch_type, Year) %>% summarise(velocity = mean(start_speed)) %>% arrange(velocity) %>% dplyr::filter(pitcher_name %in% input$pitchername) %>% dplyr::arrange(pitcher_name) %>% dplyr::filter(Year >= minyear) %>% dplyr::filter(Year <= maxyear) %>% dplyr::filter(pitch_type %in% input$pitch_type)
    print(velo)
  })
  
  output$pitcher_bar <- renderPlot({
    
    p <- ggplot(data=selected_data(), aes(x = Year, y = velocity, group = pitch_type, color = pitch_type)) + geom_line() + geom_point(size=3, fill="white") + xlab("Year") + ylab("Velocity") + ggtitle("Velocity") + theme_bw()
    print(p)
  })
  
  showLogs(appPath = getwd(), appName = "<MLBpitchdataV1_1")
})
