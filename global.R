library(shiny)
library(shinyapps)
library(dplyr)
library(ggplot2)
library(RMySQL)

shinyapps::setAccountInfo(name='<accout name here>', token='<your token here>', secret='<Your Secret token here')

con <- dbConnect(RMySQL::MySQL(),
                 username = "<username>",
                 password = "<password>",
                 host = "<hostname>",
                 port = "<port number>",
                 dbname = "<dbname>")

#query <- dbSendQuery(conn = con, statement = paste('SELECT * FROM pitch_velo WHERE pitcher_name = ', "\"",pitchername,"\"",';',sep=''))
#pitch_data <- dbFetch(query,n=-1)

pitch_type <- read.csv("pitch_type.csv",header=TRUE)
pitch_type$x <- as.character(pitch_type$x)
pitcher_names <- read.csv("all_pitcher.csv", header = TRUE)
pitcher_names$pitcher_name <- as.character(pitcher_names$pitcher_name)
