rm(list=ls())

## Load data
load(file = "localCopyOfAllData.RData")

# Data Aggregation
# install.packages("dplyr")
library(dplyr)

options("scipen"=100, "digits"=4)

usflu <- as.data.frame(usflu)
usflu$YEAR <- as.factor(usflu$YEAR)
YearWiseGrouping <- group_by(usflu, YEAR)
YearWiseGrouping2 <- summarize(YearWiseGrouping, count = n(), TotalPtsMean = mean(`TOTAL PATIENTS`, na.rm = T), 
                               TotalPtsSum = sum(`TOTAL PATIENTS`,na.rm = T))
YearWiseGrouping3 <- print(as.data.frame(YearWiseGrouping2))
plot(as.numeric(as.character(YearWiseGrouping3$YEAR)), as.numeric(YearWiseGrouping3$TotalPtsMean), 
     xlab="YEAR", ylab="Mean Weekly Total Patients", type='l')

YearWiseGrouping4 <- summarize(YearWiseGrouping, count = n(), PctWtILI_mean = mean(`% WEIGHTED ILI`, na.rm = T), 
                               PctWtILI_stdev = sd(`% WEIGHTED ILI`,na.rm = T))
YearWiseGrouping5 <- print(as.data.frame(YearWiseGrouping4))
plot(as.numeric(as.character(YearWiseGrouping5$YEAR)), as.numeric(YearWiseGrouping5$PctWtILI_mean), 
     xlab="YEAR", ylab="Mean % Weighted ILI", type='l')
