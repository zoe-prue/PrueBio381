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
get_data <- function(file_name=NULL) {
  if(is.null(fileName)) {
    d_frame <- data.frame(ID=101:110,
                          var_a=runif(10),
                          var_b=runif(10))
  }  else {
    d_frame <- read.table(file=fileName,
                          header=TRUE,
                          sep=",") 
  }
  return(d_frame)
}

##################################################

##################################################
# FUNCTION: random_data
# packages: none
# purpose: create random data with normal dist using mean and sd from data set
# input: data frame
# output:
# ------------------------------------------------
random_data <- function() {
  
  message("testing...random_data")
}
##################################################