## Covid-19-forecasting-on-ASEAN-countries
<div align="center">
  <img src="Image/association-of-southeast-asian-nations-asean-vector-logo.png" width = "50%" height = "50%">
</div>


## Introduction
Since coronavirus (COVID-19) become such a global issue, the way how to forecast it can be essential. For answering this question, it requires us to make use of the ample historical data and processing tools. ASEAN(The Association of Southeast Asian Nations) boasts one of World's most vibrant economies, the fruit of decades of industrial growth and political stability. To counter the virus, ASEAN members already pledged to share information about its spread along with best practices to combat it. In this project, we are going to analyze from the public shared datasets for providing objective forecasts. At the same time, suggesting the planning and decision making for ASEAN. <br/>

## Contributors
Project administration: ZHANG, XIAO 17204147 <br/>
Conceptualization: CHEN JIAYUE 17217261  <br/>
Data cleansing: ROSHNI MAGAINRAN WIH190021/17206541/1  <br/>
Visualization: Nur Anis Nabila bt Mohd Salim WIE180031/17154983/1  <br/>
Modeling and Shiny apps: LI KONG 17216250 / ZHANG, XIAO 17204147 <br/>

# Data cleansing
```
library(dplyr)
setwd("C:/Users/Roshni/Downloads/")
confirmed_global <- read.csv("time_series_covid19_confirmed_global.csv", header=TRUE,stringsAsFactors = FALSE,check.names = F)
```
We get our two raw datasets from   : <a href="https://github.com/CSSEGISandData/COVID-19/tree/master/archived_data/archived_time_series"> CSSE at Johns Hopkins University</a> <br/>
They showed the total number of global confirmed cases and death cases, which records from 1/22/20 to 6/6/20.<br/>

<img src="Image/Original Data Preview.png" > <br/>

## Global confirmed cases

<a href="https://github.com/xiao11lam/Covid-19_forecasting_on_ASEAN_countries/blob/master/Dataset/time_series_covid19_confirmed_global.csv"> time_series_covid19_confirmed_global.csv</a> <br>
<img src="Image/time_series_covid19_confirmed_global.png" > <br/>

## Global death cases

<a href="https://github.com/xiao11lam/Covid-19_forecasting_on_ASEAN_countries/blob/master/Dataset/time_series_covid19_deaths_global.csv"> time_series_covid19_deaths_global.csv</a> <br>

<img src="Image/time_series_covid19_deaths_global.png" > <br/>

```
#removing unwanted columns
confirmed_global_chosen<- data.frame(confirmed_global[,2:141], check.names = FALSE)
confirmed_global_chosen<-confirmed_global_chosen[grep("Malaysia|Brunei|Cambodia|Laos|Philippines|Singapore|Thailand|Vietnam|Indonesia|Burma", confirmed_global_chosen$`Country/Region`),]
#renumbering the rows
row.names(confirmed_global_chosen) <- 1:nrow(confirmed_global)
#tabulation of data
View(confirmed_global_chosen)  
#write into a csv
write.csv(confirmed_global_chosen,file="confirmed_global_chosen.csv")
```

In this part, we did our data cleansing, we filter the data we have no interest in, only focused on ASEAN member countries.  <br/>

```
   
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
```
In this way, we can calculate the [Case Fatality Rate]("https://en.wikipedia.org/wiki/Case_fatality_rate") by confiremed cases dividing death cases. Here is our result. <br/>
```
#Case Fatality Rate Table
case_fatality_final <- deaths_global_chosen

case_fatality_rates <- (deaths_global_chosen[1:10,4:140]/confirmed_global_chosen[1:10,4:140] )

case_fatality <- dplyr::bind_cols(case_fatality_final[,1:3],case_fatality_rates,)
case_fatality[is.na(case_fatality)] <- 0
View(case_fatality)
write.csv(case_fatality,file="case_fatality.csv")
```
<a href="https://github.com/xiao11lam/Covid-19_forecasting_on_ASEAN_countries/blob/master/Dataset/case_fatality.csv"> case_fatality.csv</a> <br>

<img src="Image/case_fatality_1.png" aligh=left> 

<img src="Image/case_fatality_2.png" aligh=left> <br/>

# Data Visualization 
In here we do the periodical visualization.
```
library(ggplot2)
fatal<-read.csv("./case_fatality.csv")
summary(fatal)
str(fatal)
p1<-ggplot(data = fatal, mapping = aes(x = X1.22.20, y=X1.31.20,size=6))  +ggtitle("Fatal rate between early and end of January") +geom_point(aes(color = Country.Region))
p2<-ggplot(data = fatal, mapping = aes(x = X2.1.20, y=X2.29.20,size=6))  +ggtitle("Fatal rate between early and end of February") +geom_point(aes(color = Country.Region))
p3<-ggplot(data = fatal, mapping = aes(x = X3.1.20, y=X3.31.20,size=6)) +ggtitle("Fatal rate between early and end of March") +geom_point(aes(color = Country.Region))
p4<-ggplot(data = fatal, mapping = aes(x = X4.1.20, y=X4.30.20,size=6)) +ggtitle("Fatal rate between early and end of April") +geom_point(aes(color = Country.Region))
p5<-ggplot(data = fatal, mapping = aes(x = X5.1.20, y=X5.31.20,size=6)) +ggtitle("Fatal rate between early and end of May") +geom_point(aes(color = Country.Region))
p6<-ggplot(data = fatal, mapping = aes(x = X6.2.20, y=X6.6.20,size=6)) +ggtitle("Fatal rate between early and end of June") +geom_point(aes(color = Country.Region))
#title style
p1+ theme(plot.title = element_text(color="red", size=14, face="bold.italic",hjust = 0.5))
p2+ theme(plot.title = element_text(color="red", size=14, face="bold.italic",hjust = 0.5))
p3+ theme(plot.title = element_text(color="red", size=14, face="bold.italic",hjust = 0.5))
p4+ theme(plot.title = element_text(color="red", size=14, face="bold.italic",hjust = 0.5))
p5+ theme(plot.title = element_text(color="red", size=14, face="bold.italic",hjust = 0.5))
p6+ theme(plot.title = element_text(color="red", size=14, face="bold.italic",hjust = 0.5))
```
Here is the periodical outputs. <br/>
<img src="Image/January.PNG" > <br/>
<img src="Image/February.PNG" > <br/>
<img src="Image/March.PNG" > <br/>
<img src="Image/April.PNG" > <br/>
<img src="Image/May.PNG" > <br/>
<img src="Image/June.PNG" > <br/>
# Modeling
For our exploration, we use  <a href="https://en.wikipedia.org/wiki/Long_short-term_memory"> LSTM</a> model to do forecastings. The forecasting results is based on the previous ending date the one-day after. 

<img src="Image/Long_Short-Term_Memory.svg" > <br/>

And here are the results.<br/>
<a href="https://github.com/xiao11lam/Covid-19_forecasting_on_ASEAN_countries/blob/master/Dataset/pre.csv"> pre.csv
</a> <br>

<img src="Image/data forecasting.png" > <br/>

# Shiny Apps
Here is the Shiny Apps we lauch. 

<a href="https://likong.shinyapps.io/Covid-19/"> Covid-19 forecasting on ASEAN countries Shiny App</a> 
<img src="Image/shiny_app.png" > <br/>

# Conclusion
The countries like Indonesia and Philippines may have very high CFR values in the future, ASEAN should engage to better invest in the construction of related medical infrastructure to improve medical conditions. <br/>

# Reference
https://ornlcda.github.io/icons2018/presentations/comparison_reynolds.pdf <br/>
https://www.datanovia.com/en/blog/ggplot-title-subtitle-and-caption/#center-the-title-position <br/>
http://www.sthda.com/english/articles/32-r-graphics-essentials/128-plot-time-series-data-using-ggplot/ <br/>



