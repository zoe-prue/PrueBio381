# Homework_10
# ZMP
# 4/5/23

## Problem #1:
z<-c(0,1,6,0,3,8,0,3,6,4,3,6,9,4,0,7,0,0)
c<-0

for (i in 1:length(z)) {
  if(z[i]==0){
    c<-c+1
  }
}
print(c)

# Problem #2:
zeroes <- z[z==0] # contrast with logical expression in previous if statement!
length(zeroes)

## Problem #3:
##################################################
# FUNCTION: make_matrix
# packages: none
# purpose: make a matrix nrow=i, ncol=j where the values are i*j
# input: i, j
# output: m
# ------------------------------------------------
make_matrix <- function(i,j) {
  m <- matrix(data=runif(i*j), nrow=i, ncol=j)
  for (i in 1:nrow(m)) {
    for (j in 1:ncol(m)) {
      m[i,j] <- i*j
    } # end of column j loop
  } # end or row i loop
  return(m)
}
make_matrix(4,5)
##################################################

## Problem #4:
#Simulate a dataset with 3 groups of data, 
#each group drawn from a distribution with a different mean. 
#The final data frame should have 1 column for group 
#and 1 column for the response variable.

x<-runif(20)
y<-runif(20)
z<-runif(20)
mean(x)
mean(y)
mean(z)
d<-data.frame(x,y,z)

library(dplyr)
##################################################
# FUNCTION: shuffle_data
# packages: dplyr
# purpose: reshuffle data
# input: data frame
# output: data frame with means of reshuffled data frame
# ------------------------------------------------
shuffle_data <- function(d) {
  d<-pivot_longer(d, cols= c(x,y,z), names_to="Group", values_to="Response")
  d[,2]<-sample(d$Response) # reshuffle data
  # mean<-d%>%
  #   group_by(Group)%>%
  #   summarize(Mean=mean(Response))
  d<-group_by(d, Group)
  mean<-summarize(d,Mean=mean(Response))
  return(mean)
}
##################################################
shuffle_data(d)

# create empty data frame to put in replicate ID and each group's new means
d_new <- data.frame(ID=1:100,
                      x_mean=NA,
                      y_mean=NA,
                      z_mean=NA)

# for loop - repeat function 100x
# record means from each repetition
for (i in 1:100) {
  new_means <- shuffle_data(d)
  d_new[i,2] <- new_means[1,2]
  d_new[i,3] <- new_means[2,2]
  d_new[i,4] <- new_means[3,2]
}
print(d_new)

#Use qplot() to create a histogram of the means for each reshuffled group. 
#Or, if you want a challenge, use ggplot() to overlay all 3 histograms in the same figure. 
#How do the distributions of reshuffled means compare to the original means?

library(ggplot2)
# qplot(data=d_new, x=x_mean)
ggplot(d_new, aes(x=x_mean)) + geom_histogram()
# ?ggplot()
# ?qplot()
# ?geom_histogram()


