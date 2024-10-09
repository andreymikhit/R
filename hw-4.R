#hw-4

#1
set.seed(4)
samp<-rnorm(50,7,3)
samp

#plot
qqnorm(samp)
qqline(samp)

z<-qnorm(0.975)
z
SE<-3/sqrt(50)
SE
lolv<-mean(samp)-z*SE
uplv<-mean(samp)+z*SE
CI<-c(lolv,uplv)
CI

7>=CI[1]&7<=CI[2]

#2
qnorm(0.95)
sig=signif(0.3/sqrt(20),2)
sig
9.0+1.645*0.067
(9.11-9.3)/0.067
1-pnorm(-2.835)

install.packages('asbio') #package ‘asbio’ is not available (for R version 3.5.2)
library(asbio)
power.z.test(sigma=0.3, n=20, alpha=0.05, effect=0.3, test='one.tail')$ power
sigma
n
power
alpha
effect
test

1-pnorm(-2.835)

#3
install.packages('BSDA')
library(BSDA)

z.test(post, alternative = 'g', mu=9, sigma.x = 0.3)

z.test(post, alternative = 'two.sided', mu=9, sigma.x = 0.3)
0.1971*2

#4
install.packages('effsize')
library(effsize)
cohen.d(d=.men,.women)
d<-cohen.d(.men,.women)$estimate
d
d<-(mean(.men)-mean(.women))/s.pool
d