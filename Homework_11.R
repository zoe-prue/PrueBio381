# Homework_11
# ZMP
paste("#" ,format(Sys.Date(),format="%d %b %Y"))

# Pseudocode

library(dplyr)
library(sqldf)
library(tidyverse)
source("Reg_Stats_Fun.R")

# data set from panel study of income dynamics
x<-read.csv("batch_data_example.csv")
x<-arrange(x, year, by=year)

# separating csv with data into 7 files, by year
for (i in 1976:1982) {
  y<-x%>%
    filter(year==i)
output<-paste0(i)
# setwd() if i didn't manually setwd
write.csv(y, 
          file=output, 
          sep=",", 
          col.names=TRUE, 
          row.names=FALSE)
}

# Create data frame to hold file summary statistics
ID <- 1:7 # consecutive unique integer for every file
year <- c("1976", "1977", "1978", "1979", "1980", "1981", "1982")
slope <- rep(NA,length(year)) # put in NAs for slope,
p_val <- rep(NA,length(year)) # p-value,
r2 <- rep(NA,length(year)) # and r^2
# data frame with stats for each file (all NAs rn)
stats_out <- data.frame(ID,year,slope,p_val,r2)
view(stats_out)
  
# Batch process by looping through individual files
# linear regression of year experience vs. wages earned
for (i in seq_along(year)) {
  data<-read.table(file=paste(year[i],sep=""),
                     sep=",",
                     header=TRUE) # read in next data file
  d_clean <- data[complete.cases(data),] # get clean cases
  . <- reg_stats(d_clean) # pull regression stats from clean file
  stats_out[i,3:5] <- unlist(.) # unlist, copy into last 3 columns
  # everything unlists, okay bc they're the same data type (numeric)
}
view(stats_out)







