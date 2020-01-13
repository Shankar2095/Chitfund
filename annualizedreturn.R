#I have removed spaces in column name for accessability
install.packages("readxl")
install.packages("dplyr")

library("dplyr")
library("readxl")
library(dplyr)
install.packages("xlsx", dependencies = TRUE)
dt <- read_excel("ex.xlsx")
View(dt)
dt


#Function to find annualized return
annualreturn<- function(rate,months) 
{
  years = months / 12
  annualret = ((rate)*100*(1 / years))
}  


calculateddataframe <- dt %>%
  mutate(NetamountrecdbyBidwinner = (NetamountrecdbyBidwinner- lag(NetamountrecdbyBidwinner)) /
           lag(NetamountrecdbyBidwinner))

#varible contains all month column
durationmonths <- with(dt,(Month))

#varible contains all NetamountrecdbyBidwinner column

rateofreturn <- with(dt, (NetamountrecdbyBidwinner- lag(NetamountrecdbyBidwinner))
                     / lag(NetamountrecdbyBidwinner))


#printing results month and rate of return
durationmonths

rateofreturn


#First month data
ratefirstmonth = rateofreturn[1]
monfirstmonth = durationmonths[1]

#printing results month and rate of return of first month

ratefirstmonth

monfirstmonth

returnresultfirstmonth <- annualreturn(ratefirstmonth,monfirstmonth)

#annualized return for first month

returnresultfirstmonth


#Last month data

ratelastmonth = rateofreturn[25]
monlastmonth = durationmonths[25]

#printing results month and rate of return of last month

ratelastmonth

monlastmonth

returnresultlastmonth <- annualreturn(ratelastmonth,monlastmonth)

#annualized return for last month

returnresultlastmonth



#Return % for each month's bid winner

percentagereturn <- rateofreturn*100;

percentagereturn