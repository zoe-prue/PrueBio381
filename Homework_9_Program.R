# Homework_9_Program --------------------------------
paste("#", format(Sys.Date(),format="%d %b %Y"))
# ZMP

# Library Calls ------------------------------

library(tidyverse)
library(dplyr)
library(ggplot2)

# Load Functions -----------------------------

source("Homework_9_Functions.R")

# Global Variables ---------------------------

morph_file<-"Morphometric_Analysis.csv"
#morph<-data.frame(morph$Total_Body_Length, morph$Right_Wing_Length)


# Program Body -------------------------------

get_data(fileName=morph_file)




