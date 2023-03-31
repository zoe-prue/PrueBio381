# Homework_8
# ZMP
# 3/29/23

# Sample data and summary

morph<-read.csv("Morphometric_Analysis.csv")
filt<-filter(morph, )
summary(morph)
mean_body <- mean(morph$Total_Body_Length, na.rm=TRUE)
mean_wing <- mean(morph$Right_Wing_Length, na.rm=TRUE)
sd_body<-sd(morph$Total_Body_Length, na.rm=TRUE)
sd_wing<-sd(morph$Right_Wing_Length, na.rm=TRUE)
n=34
body_length <- rnorm(n, mean=mean_body, sd=sd_body)
wing_length <- rnorm(n, mean=mean_wing, sd=sd_wing)

df<-data.frame(body_length, wing_length)

# Plot data set

plot(df)
linear_reg<-lm(wing_length ~ body_length, data=df) 
linear_reg
abline(linear_reg)


