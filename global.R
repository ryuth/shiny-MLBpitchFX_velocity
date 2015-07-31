pitch_data <- data.table::fread(input="final_master_table.csv",header = TRUE, data.table = TRUE,showProgress = TRUE)
pitch_data <- pitch_data[,V1:=NULL]

shinyapps::setAccountInfo(name="jamestaeheeryu",token="22E1B5360B0DDF1F53096209E9AF2C76", secret="eWCOS5RFPlQG5S92B6ezYSnsi/q3toHhLqyTdgvS")
