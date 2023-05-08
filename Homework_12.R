# Homework 12 --------------------------------
# 19 Apr 2023
# ZMP

# Library Calls ------------------------------

library(ggplot2)
library(ggthemes)
library(patchwork)
library(hrbrthemes)

# Load Functions -----------------------------

# Global Variables ---------------------------

# cleaned data with \d*\-\d\(3\)\w#\d*
m_treat <- read.csv("Morphometric_Covered_Uncovered.csv")
# cleaned data with \d*\-\d\(\d\)I#\d* or \d*\-\d\(\d\)O#\d*
m_found <- read.csv("Morphometric_Inside_Out.csv")

# Program Body -------------------------------

# histograms (overlap covered and uncovered)
h1 <- ggplot(data=m_treat) +
  aes(x = Right_Wing_Length, fill = X) +
  geom_histogram(position = "identity", 
                 alpha = 0.5, 
                 bins = 50, 
                 color="grey20") +
  xlab("Right Wing Length (mm)")+
  ylab("Count") +
  ggtitle("Right Wing Length Frequency")
print(h1)

h2 <- ggplot(data=m_treat) +
  aes(x = Total_Body_Length, fill = X) +
  geom_histogram(position = "identity", 
                 alpha = 0.5, 
                 bins = 50,
                 color="grey20") +
  xlab("Total Body Length (mm)")+
  ylab("Count") +
  ggtitle("Total Body Length Frequency")
print(h2)

h3 <- ggplot(data=m_treat) +
  aes(x = Notum_Length, fill = X) +
  geom_histogram(position = "identity", 
                 alpha = 0.5, 
                 bins = 50,
                 color="grey20") +
  xlab("Notum Length (mm)")+
  ylab("Count") +
  ggtitle("Notum Length Frequency")
print(h3)

h4 <- ggplot(data=m_treat) +
  aes(x = Right_Hind_Tibia_Length, fill = X) +
  geom_histogram(position = "identity", 
                 alpha = 0.5, 
                 bins = 50,
                 color="grey20") +
  xlab("Right Hind Tibia Length (mm)")+
  ylab("Count") +
  ggtitle("Right Hind Tibia Length Frequency")
print(h4)

(h1|h2)/(h3|h4)

# boxplots and ANOVA (covered vs uncovered)
g1 <- ggplot(data=m_treat) +
  aes(x=X,
      y=Right_Wing_Length,) +
  xlab("Treatment Group") +
  ylab("Right Wing Length (mm)")+
  geom_boxplot(fill= c("#00BFC4", "#F8766D"), color="grey20") + 
  theme(legend.position="none")
print(g1)

g2<-ggplot(data=m_treat) +
  aes(x=X,
      y=Total_Body_Length,) +
  xlab("Treatment Group") +
  ylab("Body Length (mm)")+
  geom_boxplot(fill= c("#00BFC4", "#F8766D"), color="grey20") + 
  theme(legend.position="none")
print(g2)

g3<-ggplot(data=m_treat) +
  aes(x=X,
      y=Notum_Length,) +
  xlab("Treatment Group") +
  ylab("Notum Length (mm)")+
  geom_boxplot(fill= c("#00BFC4", "#F8766D"), color="grey20") + 
  theme(legend.position="none")
print(g3)

g4<-ggplot(data=m_treat) +
  aes(x=X,
      y=Right_Hind_Tibia_Length,) +
  xlab("Treatment Group") +
  ylab("Right Hind Tibia Length (mm)")+
  geom_boxplot(fill= c("#00BFC4", "#F8766D"), color="grey20") + 
  theme(legend.position="none")
print(g4)

(g1|g2)/(g3|g4)

# OVERLAY
# UNCOVERED = CONTROL bc no impact
# COVERED = DOES EXPOSURE TO ENVR AFFECT MORPHOMETRICS

aov_rwing_treat <- aov(Right_Wing_Length ~ X, m_treat)
summary(aov_rwing_treat) # not significant 0.0625
aov_body_treat <- aov(Total_Body_Length ~ X, m_treat)
summary(aov_body_treat) # significant 0.003
aov_notum_treat <- aov(Notum_Length ~ X, m_treat)
summary(aov_notum_treat) # significant 0.00216
aov_tibia_treat <- aov(Right_Hind_Tibia_Length ~ X, m_treat)
summary(aov_tibia_treat) # not significant 0.0818

# boxplots and ANOVA (inside vs outside)

b1 <- ggplot(data=m_found) +
  aes(x=ID,
      y=Right_Wing_Length,) +
  xlab("Treatment Group") +
  ylab("Right Wing Length (mm)")+
  geom_boxplot(fill= c("#C77CFF", "#7CAE00"), color="grey20") + 
  theme(legend.position="none")
print(b1)

b2<-ggplot(data=m_found) +
  aes(x=ID,
      y=Total_Body_Length,) +
  xlab("Treatment Group") +
  ylab("Body Length (mm)")+
  geom_boxplot(fill= c("#C77CFF", "#7CAE00"), color="grey20") + 
  theme(legend.position="none")
print(b2)

b3<-ggplot(data=m_found) +
  aes(x=ID,
      y=Notum_Length,) +
  xlab("Treatment Group") +
  ylab("Notum Length (mm)")+
  geom_boxplot(fill= c("#C77CFF", "#7CAE00"), color="grey20") + 
  theme(legend.position="none")
print(b3)

b4<-ggplot(data=m_found) +
  aes(x=ID,
      y=Right_Hind_Tibia_Length,) +
  xlab("Treatment Group") +
  ylab("Right Hind Tibia Length (mm)")+
  geom_boxplot(fill= c("#C77CFF", "#7CAE00"), color="grey20") + 
  theme(legend.position="none")
print(b4)

(b1|b2)/(b3|b4)

aov_rwing_found <- aov(Right_Wing_Length ~ ID, m_found)
summary(aov_rwing_found) # not significant 0.901
aov_body_found <- aov(Total_Body_Length ~ ID, m_found)
summary(aov_body_found) # not significant 0.645
aov_notum_found <- aov(Notum_Length ~ ID, m_found)
summary(aov_notum_found) # not significant 0.84
aov_tibia_found <- aov(Right_Hind_Tibia_Length ~ ID, m_found)
summary(aov_tibia_found) # not significant 0.275

# linear regression: relationships between one variable and the other three?

m1 <- ggplot(data=m_treat) + 
  aes(x=Total_Body_Length,
      y=Right_Wing_Length,
      color=X) +
  ggtitle("Effect of Body Length on Right Wing Length")+ 
  xlab("Body Length (mm)") +
  ylab("Right Wing Length (mm)") +
  geom_point(size=2) +
  geom_smooth(method="lm",
              se=F,
              formula = y ~ x,
              color="grey20") +
  annotate("text", x=2.2, y=3.5, label="r = 0.6109") +
  annotate("text", x=2.2, y=3.3, label="r^2 = 0.3732") +
  annotate("text", x=2.2, y=3.1, label="p = 3.133e-06")
m1
# lm2 <- lm(Right_Wing_Length~Total_Body_Length, data=m_treat)
# summary(lm1)

m2 <- ggplot(data=m_treat) + 
  aes(x=Total_Body_Length,
      y=Notum_Length,
      color=X) +
  ggtitle("Effect of Body Length on Notum Length")+ 
  xlab("Body Length (mm)") +
  ylab("Notum Length (mm)") +
  geom_point(size=2) +
  geom_smooth(method="lm",
              se=F,
              formula = y ~ x,
              color="grey20") +
  annotate("text", x=2.2, y=1.5, label="r = 0.5560") +
  annotate("text", x=2.2, y=1.4, label="r^2 = 0.3091") +
  annotate("text", x=2.2, y=1.3, label="p = 7.342e-05")
m2
# lm2 <- lm(Notum_Length~Total_Body_Length, data=m_treat)
# summary(lm2)

m3 <- ggplot(data=m_treat) + 
  aes(x=Total_Body_Length,
      y=Right_Hind_Tibia_Length,
      color=X) +
  ggtitle("Effect of Body Length on Right Hind Tibia Length")+ 
  xlab("Body Length (mm)") +
  ylab("Right Hind Tibia Length (mm)") +
  geom_point(size=2) +
  geom_smooth(method="lm",
              se=F,
              formula = y ~ x,
              color="grey20") +
  annotate("text", x=2.2, y=1.3, label="r = 0.6692") +
  annotate("text", x=2.2, y=1.2, label="r^2 = 0.4478") +
  annotate("text", x=2.2, y=1.1, label="p = 3.173e-08")
m3
# lm3 <- lm(Right_Hind_Tibia_Length~Total_Body_Length, data=m_treat)
# summary(lm3)









"#F8766D" "#CD9600" "#7CAE00" "#00BE67" "#00BFC4" "#00A9FF" "#619CFF" "#C77CFF" "#FF61CC"


  