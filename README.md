## Covid-19-forecasting-on-ASEAN-countries
<div align="center">
  <img src="Image/association-of-southeast-asian-nations-asean-vector-logo.png">
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
We get our two raw datasets from   : <a href="https://github.com/CSSEGISandData/COVID-19/tree/master/archived_data/archived_time_series"> CSSE at Johns Hopkins University</a> <br/>
One shows the total number of global confirmed cases and another death cases. <br/>

<img src="Image/Original Data Preview.png" > <br/>

## global confirmed cases
<img src="Image/time_series_covid19_confirmed_global.png" > <br/>

## global death cases
<img src="Image/time_series_covid19_deaths_global.png" > <br/>

In this part, we did our data cleansing, we filter the data we have no interest in, only focused on ASEAN member countries, then we calculate the [Case Fatality Rate]("https://en.wikipedia.org/wiki/Case_fatality_rate") by confiremed cases dividing death cases. Here is our result: <br/>

<img src="Image/case_fatality_1.png" aligh=left> 

<img src="Image/case_fatality_2.png" aligh=left> <br/>

# Data Visualization 
<img src="Image/January.png" > <br/>
<img src="Image/February.PNG" > <br/>
<img src="Image/March.PNG" > <br/>
<img src="Image/April.PNG" > <br/>
<img src="Image/May.PNG" > <br/>
<img src="Image/June.PNG" > <br/>

# Modeling
For our exploration, we use [LSTM]("https://en.wikipedia.org/wiki/Long_short-term_memory") model to do forecastings. And we here are the result.<br/>
<img src="Image/data_forecasting.png" > <br/>



