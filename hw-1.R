#HW-1.R
#0
plot.new()
demo(persp)
#1
x1  <- seq(-2, 2, 0.05)
x2  <- seq(-3, 3, 0.05)
y1 <- pnorm(x1)
y2 <- pnorm(x2,1,1)
plot(x1,y1,ylim=range(c(y1,y2)),xlim=range(c(x1,x2)), type="l",col="red")
lines(x2,y2,col="green")
#2
x  <- seq(-2, 2, 0.5)
y  <- seq(-2, 2, 0.5)
y1 <- (x^2+y^2-1)^3
y2 <- x^2*y^3
plot(y2*sin(y1), -y1, type="l", col="red")
#3
my_str <- sample(1:10)
remove <- c(3,5)
my_str <- my_str[-remove]
#4
string_with_nums <- " dfg45h 67 h"
string_without_nums <- gsub("[^[:digit:]]", "", string_with_nums)
string_without_nums
#5
A = matrix( c(1,     2,          3,       4,
              2, 0.90099010, 0.04950495, 0.000,
              3, 0.05000000, 0.90000000, 0.050,
              4 ,0.00000000, 0.02500000 ,0.975
), # the data elements 
nrow=4,              # number of rows 
ncol=4,              # number of columns 
byrow = TRUE)        # fill matrix by rows 

A_new <- 2*A - 2*A*0.5

det(A)
det(A_new)
determinant.matrix(A_new)