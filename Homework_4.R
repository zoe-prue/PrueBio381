## Problem 1:
x<-1.1
a<-2.2
b<-3.3
z<-x^a^b
print(z)
z<-(x^a)^b
print(z)
z<-3*(x^3)+2*(x^2)+1
print(z)

## Problem 2:
c(seq(8),seq(7,1))
# output: 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1

rep(1:5, c(1,2,3,4,5))
# output: 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5

rep(5:1, c(1,2,3,4,5))
# output: 5 4 4 3 3 3 2 2 2 2 1 1 1 1 1

## Problem 3:
set.seed(0)
v<-runif(2)
y<-v[1]
x<-v[2]

r<-sqrt(((x^2)+(y^2)))
theta<-atan(y/x)
# print(c(r,theta))
# output: 0.9351795 1.2829248

## Problem 4:

queue<-c("sheep", "fox", "owl", "ant")
queue<-append(queue, "serpent")
queue<-queue[-1]
queue<-append(queue, "donkey", 0)
queue<-queue[-5]
queue<-queue[-3]
queue<-append(queue, "aphid", 2)
which(queue=="aphid")

## Problem 5:

v<-(1:100)
v<-which(v%%2!=0 & v%%3!=0 & v%%7!=0)
print(v)
# output: 1  5 11 13 17 19 23 25 29 31 37 41 43 47 53 55 59 61 65 67 71 73 79 83 85 89 95 97