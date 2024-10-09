x_1 <- c(1,2,3) 
x_1

10-6

x<- 1:100
x
x[1:8]

10-8

## объекты
x.1 <- 17 # переменная

x.1

rm(x.1)
x.1

# основные функции
1+6 
1-6
10:2
10*2
sqrt(25)
log2(8)
help(log)
? log

log(27, base = 3)

10^3
exp(1)

log(exp(1))

factorial(3)

## работа функции

sqrt(log2(16))

##  доступные пакеты https://cran.r-project.org/

search()

install.packages("effsize")

 library(effsize)



# part 2
a<-c(0,1,2,3)
a[2]
b<-c(rep(2,time=3))
b
a+b #  ошибка!
b.1<-rep(2,4)
b.1
a+b.1
a

seq(2,8,by=2) # четные
seq(1,9, by=2)#нечетные
?seq
seq(1,10,length.out = 5)
a
s<-1:10
s

rnorm(n=50,mean=0,sd=1) # задаем нормальное распеделение

rpois(100,10)# распеделение Пуассона
?rpois
set.seed(1)
rbinom(100,10,0.5) # биномиальное распределение

rep(c(0,2),time=2)
rep(c(0,2),each=2)

# текстовые векторы
letters
LETTERS

paste(letters, set="_",seq(1,26))
paste0(letters, set="_",seq(1,26))

?ISOdate

format(ISOdate(2019,9,1:30),"%d")
format(ISOdate(2019,9,1:30),"%b")
paste (format(ISOdate(2019,9,1:30),"%d"),set="_",format(ISOdate(2019,9,1:30),"%b")) 

paste0 (format(ISOdate(2019,9,1:30),"%d"),set="_",rep("сен",time=30)) 

## прочие функции
# обучающие наборы данных
data()
data(package = .packages(all.available = TRUE))

library(cluster)
animals
?animals

5 > 6
5 < 100
2!=2
3==3

10>=10
6>7 | 8>9

6>7 | 10 >9

6>7 & 10 >9
12>7  & 10 >9

((T==F)&(1==1))& 100 == 100

((T==F)&(1==1))| 100 == 100

is.na(animals)
sum(is.na(animals))

animals

head(animals,3)
animals$gro
animals$gro[!is.na(animals$gro)]

animals$gro[!is.na(animals[,5])]


?iris
head(iris,10)
tail(iris)
dim(iris)
str(iris)
unique(iris$Species)
levels(iris$Species)
iris[1,1]

traindat<-iris[1:5,c(2,4,5)]
traindat
traindat[traindat$Sepal.Width>3,]
traindat[traindat$Sepal.Width>3 &traindat$Petal.Width>1.4,]


# строим dataset

weight<- c(78,56,67,48,69,90)
height<-c(170,160,165,159,170,185)
sex<-c(rep("F",3),rep("M",3))
sex
class(sex)
df.1<- data.frame(weight,height,sex,stringsAsFactors = F)
df.1
str(df.1)
?data.frame
df.2<- data.frame(weight,height,sex,stringsAsFactors = T)
df.2

sex
factor(sex)

# строим матрицу

m<- 1:30
m
z<-c(10,3)
z
dim(m)
dim(m)<-z
m
class(m)

# 2 способ
y<- 1:50
y
mt<-matrix(y,10,5)
mt

imena<- LETTERS[1:10]
imena
cbind(imena,mt) # вознила проблема
class(cbind(imena,mt))

#########
?rownames
rownames(mt)
colnames(mt)
rownames(mt,do.NULL = T, prefix = "row")
rownames(mt)<-imena
mt

colnames(mt, do.NULL = TRUE, prefix = "col")
colnames(mt) <- paste("day",1:5)
mt
