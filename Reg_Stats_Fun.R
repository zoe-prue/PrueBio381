# Regression Statistics Function
# ZMP
paste("#" ,format(Sys.Date(),format="%d %b %Y"))

##################################################
# FUNCTION: reg_stats
# packages: none
# purpose: fits linear model, extracts statistics
# input: 2 col data frame (x and y)
# output: slope, p-value, and r^2
# ------------------------------------------------
reg_stats <- function(d=NULL) {
  if (is.null(d)) {
    x_var<-runif(10)
    y_var<-runif(10)
    d<-data.frame(x_var, y_var)
    }
  .<-lm(data=d, d[,2]~d[,13]) # column number of interest
  .<-summary(.)
  # already know where in summary statistics list to find values of interest
  stats_list<-list(slope=.$coefficients[2,1],
                   p_val=.$coefficients[2,4],
                   r2<-.$r.squared)
  return(stats_list)
}
##################################################