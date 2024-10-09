#hw-2.R

#1
#install.packages('cluster')
library(cluster)
data()
?votes.repub
head(votes.repub)
str(votes.repub)
?votes.repub
votes.repub(1:6,1:10)
colMeans(votes.repub)
colMeans(votes.repub, na.rm = TRUE)
if(mean(votes.repub[,30])>60){
  print('Респ. набрали высокий процент голосов')
}else{
  print('Респ. набрали менее 60% голосов')
}
# ...
if(mean(votes.repub[,1], na.rm = TRUE)>60){
  print('Респ. набрали высокий процент голосов')
}else{
  print('Респ. набрали менее 60% голосов')
}
#...
?ifelse()
x<-c(1,0,0,0,1,0)
ifelse(x!= 0, 'Yes', 'No') #6x

x<-c(3,0,0,0,1,0)
ifelse(x!=0,'yea', 'no')

#2
dat<-read.csv('hw-21dat.csv') #Файл hw-21datn.csv. Указать директорию через Session!
datn<-dat[,-1]
head(datn)
str(datn)
unique(datn$ball)
unique(datn$price)

#install.packages('lubridate')
library(lubridate)
?lubridate
class(datn$d.data)
datn$d.date

#x - номер покупки data - yy-mm-dd ...
getwd()
dat<-read.csv('datn.csv')
head(dat)
str(dat)
levels(dat$d.data)
unique(dat$ball)
unique(dat$price)
dim(dat)
datn<-dat[,-1]
head(datn,10)
str(datn)
unique(datn$ball)
unique(dat$price)

dayn<-ymd(datn$d.date) #YearMonthDay
class(dayn)
dayn
year(dayn)
month(dayn)
day(dayn)

datn$price
datn$price[day(dayn)==1]
sum(datn$price[day(dayn)==1]) #price 1st day


f.1<-function(d){sum(datn$price[day(dayn)==d])}
f.1(1)
f.1(2)
f.1(3)

sum(f.1(1),f.1(2), f.1(3)) #or
sum(datn$price)


f.2<-function(m,d)(sum(datn$price[month(datn$d.date)==day(datn$d.date)==d]))
f.2(1,1)
f.2(1,3)
f.2(2,1)

f.1(1)
f.2(2)
for (i in 1:3) {
  princomp(f.1(i))
}

# функции lapply, sapply
head(votes.repub)
?apply
class(votes.repub)
apply(votes.repub)
apply(votes.repub, 1, mean)
?lapply
lapply(votes.repub, sum)
sapply(votes.repub, sum)
sapply(votes.democrates , sum)
class(sapply(votes.repub, sum))

#3
data()
head(Orange,12)
?Orange
#три переменные: номер, возраст дерева, длина окружности столба
a<-c(1,2,3,5,11)
diff(a)

range(a)
min(a)
max(a)
diff(a)
diff(range(a))
l<-function(x){diff(range(x))}
l(a)

?tapply
tapply(Orange$circumference, Orange$Tree, l)

#Монте-Карло симуляция
a #...
b #...
sam.a<-sample(a,2)
sam.b<-sample(b,4)
sam.a
sam.b
c(sam.a,sam.b)
s<-sum(c(sam.a,sam.b))
s
#Вектор
mc<-function(m,n){sam.a<-sample(a,m)
sam.b<-sample(b,n)
s<-sum(c(sam.a,sam.b))
}
m<-replicate(100,mc(2,4))
m
mean(m==3)
mean(m.1==3)
m.1<-replicate(10000,mc(2,4))
mean(m.1==3)
m.1<-replicate(100000,mc(2,4))
mean(m.1==3)
m.1<-replicate(1000000,mc(2,4))

#length
vc
vg<-as.numeric(iris %>%filter(Species=='virginica')%>% select(Petal.Length) %>% unlist())
vg
vc %in% vg
sum(vc %in% vg)

#save
a<-c(1,2,3)
b<-c(0,0,0)
nm<-c('1_row', '2_row', '3_row')
nm
df<-data.frame(a,b)
class(df)
df
df.1<-`row.names<-`(df,nm)
df.1

write.csv(df.1, file = 'hw-22dat.csv', fileEncoding = 'utf-8')

read.csv(file='hw-22dat.csv')

#4
install.packages('readxl')
?read_xls
library(readxl)
read_xls('hw-23book_1.xls')

#5 cardio.xls
#https://www.kaggle.com/sulianova/eda-cardiovascular-data/data

#...

head(read.csv('cardio_train.csv'))

head(read.csv('cardio_train.csv', sep = ':')) #разбивает строку на столбики после :

head(read.csv('cardio_train.csv', sep = ':', nrows = 5, row.names = 1))

head(read.csv('cardio_train.csv', sep = ':', nrows = 5, header = FALSE))



#5 from www
#https://biometry.nci.nih.gov/cdas/datasets/nlst/

install.packages('rvest')
library(rvest) #??? Error. No package ...
url1<-paste('https://biometry.nci.nih.gov/cdas/datasets/nlst/')
url1
ht1<-read_html(url1)
ht1
tab1<-ht1 %>% html_nodes('table')
head(tab1)
class(tab1)
tab1<-tab1 %>% setNames(c('data', 'description'))
tab1$data
class(tab1$data)
#...

#6
install.packages('dplyr')
library(dplyr)
