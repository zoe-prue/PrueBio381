# Homework_9_Functions --------------------------------
paste("#" ,format(Sys.Date(),format="%d %b %Y"))
# ZMP

##################################################
# FUNCTION: get_data
# packages: none
# purpose:get data from csv
# input: read the csv
# output: data frame
# ------------------------------------------------
get_data <- function(file_name) {
  morph<-read.csv(file_name)
  return(morph)
}
##################################################

##################################################
# FUNCTION: clean_data
# packages: dplyr
# purpose: isolate body length, wing length
# input:
# output:
# ------------------------------------------------
clean_data <- function(x, pos1=2, pos2=3) {
  data_frame<-data.frame(Total_Body_Length=x[,pos1], Right_Wing_Length=x[,pos2])
  return(data_frame)
}
##################################################

##################################################
# FUNCTION: random_data
# packages: none
# purpose: create random data with normal dist using mean and sd from data set
# input: clean data set
# output: randomized data set
# ------------------------------------------------
random_data <- function(clean_data, n) {
  mean_1 <- mean(clean_data[,1], na.rm=TRUE)
  mean_2 <- mean(clean_data[,2], na.rm=TRUE)
  sd_1<-sd(clean_data[,1], na.rm=TRUE)
  sd_2<-sd(clean_data[,2], na.rm=TRUE)
  rand_1 <- abs(rnorm(n, mean=mean_1, sd=sd_1))
  rand_2 <- abs(rnorm(n, mean=mean_2, sd=sd_2))
  rand_data<-data.frame(rand_1, rand_2)
  return(rand_data)
}
##################################################

##################################################
# FUNCTION: summary_table
# packages: none
# purpose:
# input:
# output:
# ------------------------------------------------
summary_table <- function(random_data) {
  mean_1 <- mean(random_data[,1], na.rm=TRUE)
  mean_2 <- mean(random_data[,2], na.rm=TRUE)
  sd_1<-sd(random_data[,1], na.rm=TRUE)
  sd_2<-sd(random_data[,2], na.rm=TRUE)
  range_1<-range(random_data[,1], na.rm=TRUE)
  range_2<-range(random_data[,2], na.rm=TRUE)
  table<-data.frame(Mean = c(mean_1, mean_2), 
                    Standard_Dev=c(sd_1, sd_2), 
                    Range=c(range_1, range_2))
  return(table)
}
##################################################

##################################################
# FUNCTION: plot_data
# packages: none
# purpose: scatter plot of randomized data
# input: rand_data
# output:
# ------------------------------------------------
plot_data <- function(random_data, xlab, ylab) {
  plot<-plot(random_data$rand_1, random_data$rand_2, xlab=xlab, ylab=ylab)
  plot<-lm(random_data$rand_2 ~ random_data$rand_1, data=random_data)
  abline(plot)
  return(plot)
}
##################################################

# add function to get output of range, mean, sd in a nice table


