pitch_data <- data.table::fread(input="final_master_table.csv",header = TRUE, data.table = TRUE,showProgress = TRUE)
pitch_data <- pitch_data[,V1:=NULL]

shinyapps::setAccountInfo(name="",token="", secret="")
