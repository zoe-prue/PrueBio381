# Homework 6
# ZMP
# 3/2/23

library(tidyverse)
library(dplyr)
data("iris")
class(iris)

## Problem #1:
# The data set iris has 150 observations of 5 variables.

## Problem #2:
# Create a new data frame iris1 that contains only the species virginica and versicolor 
# with sepal lengths longer than 6 cm and sepal widths longer than 2.5 cm. 
# How many observations and variables are in the data set?
# using filter() to create data frame with specified conditions
iris1<-filter(iris, Species == c("virginica","versicolor") & Sepal.Length>6 & Sepal.Width>2.5)
print(iris1)
# There are 28 observations of 5 variables in iris1.

## Problem #3:
# Now, create a iris2 data frame from iris1 that contains only the columns for 
# Species, Sepal.Length, and Sepal.Width. 
# How many observations and variables are in the data set?
# using select() to create data frame with 3 chosen columns
iris2<-select(iris1, Species, Sepal.Length, Sepal.Width) 
head(iris2)
# There are 28 observations of 3 variables in iris2.

## Problem #4:
# Create an iris3 data frame from iris2 that orders the observations 
#from largest to smallest sepal length. 
#Show the first 6 rows of this data set.
iris3<-arrange(iris2, by=desc(Sepal.Length))
head(iris3)

## Problem #5:
#Create an iris4 data frame from iris3 that creates a column 
#with a sepal area (length * width) value for each observation. 
#How many observations and variables are in the data set?
iris4<-mutate(iris3, Sepal.Area=Sepal.Length/Sepal.Width)
print(iris4)
# There are 28 observations of 4 variables in iris4.

## Problem #6:
#Create iris5 that calculates the average sepal length, 
#the average sepal width, and the sample size of the entire 
#iris4 data frame and print iris5.
iris5<-summarize(iris4, 
                 Mean.Sepal.Length=mean(Sepal.Length), 
                 Mean.Sepal.Width=mean(Sepal.Width),
                 number=n())
print(iris5)

## Problem #7: 
# Finally, create iris6 that calculates the average sepal length, 
# the average sepal width, and the sample size for each species of 
# in the iris4 data frame and print iris6.
# pivot wider

iris6<-
  summarize(iris4, 
            Mean.Sepal.Length=mean(Sepal.Length), 
            Mean.Sepal.Width=mean(Sepal.Width), 
            .by=Species, 
            number=n())
print(iris6)

## Problem #8:
irisFinal<-iris%>%
  filter(Species == c("virginica","versicolor") & Sepal.Length>6 & Sepal.Width>2.5)%>%
  select(Species, Sepal.Length, Sepal.Width)%>%
  arrange(by=desc(Sepal.Length))%>%
  mutate(Sepal.Area=Sepal.Length/Sepal.Width)%>%
  summarize(Mean.Sepal.Length=mean(Sepal.Length), 
            Mean.Sepal.Width=mean(Sepal.Width), 
            .by=Species, 
            number=n())
print(irisFinal)
  
## Problem #9:
# Create a ‘longer’ data frame using the original iris data set 
# with three columns named “Species”, “Measure”, “Value”. 
# The column “Species” will retain the species names of the data set. 
# The column “Measure” will include whether the value corresponds to 
# Sepal.Length, Sepal.Width, Petal.Length, or Petal.Width and the column 
# “Value” will include the numerical values of those measurements.

iris_longer<-iris%>%
  pivot_longer(cols=Sepal.Length:Petal.Width, names_to="Measure", values_to="Value", values_drop_na=T)
print(iris_longer)

#misc

#library(fortunes)
library(cowsay)
library(praise)
library(multicolor)

someone_praise_me <- function(x) {
  animal <- animal <- sample(names(animals), 1)
  say(paste(praise(template = "You are ${adjective}!"), collapse = "\n"), by = animal, by_color="magenta")
}

## Cute Function
someone_praise_me()
praise(template = "You are ${adjective}!")


endless_horse(
  what = "Hello world!",
  endless = TRUE,
  wait = 0.5,
  what_color = NULL,
  horse_color = NULL
)
