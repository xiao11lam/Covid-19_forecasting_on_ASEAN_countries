#Data Cleaning 

#confirmed global
library(dplyr)
setwd("C:/Users/Roshni/Downloads/")
confirmed_global <- read.csv("time_series_covid19_confirmed_global.csv", header=TRUE,stringsAsFactors = FALSE,check.names = F)

#removing unwanted columns
confirmed_global_chosen<- data.frame(confirmed_global[,2:141], check.names = FALSE)
confirmed_global_chosen<-confirmed_global_chosen[grep("Malaysia|Brunei|Cambodia|Laos|Philippines|Singapore|Thailand|Vietnam|Indonesia|Burma", confirmed_global_chosen$`Country/Region`),]
#renumbering the rows
row.names(confirmed_global_chosen) <- 1:nrow(confirmed_global)
#tabulation of data
View(confirmed_global_chosen)  
#write into a csv
write.csv(confirmed_global_chosen,file="confirmed_global_chosen.csv")
   
#deaths global
deaths_global <- read.csv("time_series_covid19_deaths_global.csv",header=TRUE,stringsAsFactors = FALSE,check.names=F)

#removing unwanted columns
deaths_global_chosen<- data.frame(deaths_global[,2:141], check.names = FALSE)
deaths_global_chosen<-deaths_global_chosen[grep("Malaysia|Brunei|Cambodia|Laos|Philippines|Singapore|Thailand|Vietnam|Indonesia|Burma", deaths_global_chosen$`Country/Region`),]
#renumbering rows
row.names(deaths_global_chosen) <- 1:nrow(deaths_global_chosen)
#tabulation of data
View(deaths_global_chosen)
#write into a csv
write.csv(deaths_global_chosen,file="deaths_global_chosen.csv")

#Case Fatality Rate Table
case_fatality_final <- deaths_global_chosen

case_fatality_rates <- (deaths_global_chosen[1:10,4:140]/confirmed_global_chosen[1:10,4:140] )

case_fatality <- dplyr::bind_cols(case_fatality_final[,1:3],case_fatality_rates,)
case_fatality[is.na(case_fatality)] <- 0
View(case_fatality)
write.csv(case_fatality,file="case_fatality.csv")