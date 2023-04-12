# Homework_9_Program --------------------------------
paste("#", format(Sys.Date(),format="%d %b %Y"))
# ZMP

# Library Calls ------------------------------

library(tidyverse)
library(dplyr)

# Load Functions -----------------------------

source("Homework_9_Functions.R")

# Global Variables ---------------------------

morph_file<-"Morphometric_Analysis.csv"
#morph<-data.frame(morph$Total_Body_Length, morph$Right_Wing_Length)

# Program Body -------------------------------
# chunk separately in R markdown
morph<-get_data(file_name=morph_file)
clean_morph<-clean_data(morph)
random_morph<-random_data(clean_morph, n=34)
summary_table<-summary_table(random_morph)
summary_table
morph_plot<-plot_data(random_data=random_morph, xlab="Total Body Length", ylab="Right Wing Length")
