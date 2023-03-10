# Homework_5
# 2/15/2023
# ZMP
## Notes:


## Problem #1:

n_dims<-sample(3:10, 1)
v<-1:(n_dims^2)
nv<-sample(v)
m<-matrix(data=nv,nrow=n_dims,byrow=TRUE) # matrix generation
print(m)
m_transpose<-t(m) # matrix transposition
print(m_transpose)
sum(c(m[1,])) # sum of first row elements of matrix
mean(c(m[1,])) # mean of first row elements of matrix
sum(c(m[n_dims,])) # sum of last row elements of matrix
mean(c(m[n_dims,])) # mean of last row elements of matrix
eigen(m) # eigenvalues and eigenvectors
print(eigen(m))
# lambda*v = A*v
# eigenvalue (lambda)
# eigenector (v)
typeof(eigen_m$values)
typeof(eigen_m$vectors)

## Problem #2:

my_matrix<-matrix(data=runif(16),nrow=4, ncol=4,byrow=TRUE) # matrix generation
my_matrix
my_logical<-runif(100)<0.5
my_logical
my_letters<-sample(letters, 26, replace=FALSE)
my_letters
new_list<-list(my_matrix[2,2], my_logical[2], my_letters[2])
typeof(new_list[[1]]) # double
typeof(new_list[[2]]) # logical
typeof(new_list[[3]]) # character
new_vec<-c(unlist(new_list)) # creating a vector from new_list
typeof(new_vec) # data is type character

## Problem #3:

my_unis <- runif(26, min=0, max=10)
my_letters <- sample(LETTERS, 26, replace=FALSE)
d_frame <- data.frame(my_unis,my_letters,stringsAsFactors=FALSE)
d_frame<-d_frame[sample(1:26,4, replace=FALSE),1]<-NA # replace values of 4 randoms rows from my_unis with NA
print(d_frame)
which(!complete.cases(d_frame)) # find NA slots, give positions
d_frame2 <- d_frame[order(d_frame$my_letters),] # use order() function to reorder my_letters alphabetically
d_frame2
mean(complete.cases(d_frame2[1])) # calculate mean of first column (my_letters)

