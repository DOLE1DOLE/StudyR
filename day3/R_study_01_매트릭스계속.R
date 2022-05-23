## 매트릭스 계속
z<-matrix(1:20, nrow=4, ncol=5, byrow=T)
z

x<- c(20,25,30,35)
x
m1 <- cbind(z,x)  #열기준결합-세로 더하기
m1

y<- 36:41
y
m2<- rbind(m1,y) #행기준결합-가로 더하기
m2

# 값추출
m2[1,3]
m2[1,7]
z
z[1,6]
z[,5]
z[2,1:3]
z[1,c(1,2,4)]
z[1:2,]
z[1:2,c(2,4)]
z[,c(1,4)]

score<- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60),nrow=4)
score
rownames(score)<-c('Jon','Tom','Mark','Jane')
colnames(score)<-c('Eng','Math','Sci')

score['Jon','Math']
score['Math','Jon']  ##오류. 순서지켜야

rownames(score)
colnames(score)


## 햄버거 영양성분 정보 제공하기
burger<- matrix(c(514, 917, 11,
                  533, 853, 13,
                  566, 888, 10), nrow=3, byrow=T)
burger
rownames(burger)<-c('McD','Lot','BuK')
colnames(burger)<-c('열량(kcal)','나트륨(na)','포화지방(fat)')

burger['McD','열량(kcal)']

# 데이터프레임 은 2가지 이상의 자료형!(매트릭스는 동일 자료형)
physicals<- matrix(c(168.4,169.5,62.4,65.5,'M','F'), nrow=2)
physicals  #자료형 다른데 다 문자화됨......

city<- c('Seoul','Tokyo','Washington')
rank<- c(1,3,2)
city.info<- data.frame(city,rank)
city.info

## iris 데이터셋
iris
head(iris)  #처음일부데이터만출력
tail(iris)  #끝데이터들
str(iris)   #데이터타입 알려줌 str
str(z)
str(burger)  #왜 매트릭스로안뜨지?????
class(burger) #뜸
str(c('Jon','Tom','Mark','Jane'))

iris[140,]
iris[,5]
levels(iris[,5])  #factor보기
iris[,c(1,2)]
iris[,c('Sepal.Length','Petal.Length','Species')]

head(iris[,c('Sepal.Length','Petal.Length','Species')])[1,]
head(iris[,c('Sepal.Length','Petal.Length','Species')])[1,3]


## LAB2 햄버거2

kcal<- c(514, 533, 566)
na<- c(917, 853, 888)
fat<- c(11, 13, 10)
menu<- c('새우', '불고기', '치킨')
burger.2<-data.frame(kcal,na,fat,menu)
burger.2
rownames(burger.2)<- c('McD','Lot','BuK')
burger.sum<- burger.2[,'na']*burger.2[,'fat']  #임의연산해보기
burger.sum
burger.2['McD',]

##
dim(iris)  # 행,열 개수
x
dim(x)
dim(burger)  #2차원이죠
dim(burger.2)

nrow(iris)
ncol(iris)
colnames(iris)
rownames(burger.2)
rownames(iris)

head(iris, n=2)   #n으로 몇개나 출력할지 설정가능
tail(iris)
str(iris)  #속성출력~~

iris$Sepal.Length
levels(iris$Species)
levels(iris[,'Species'])  #결과 같으니까 편한걸쓰자

# 행별, 열별 합계,평균 산술계산
colSums(iris)  #문자있어서안됨

colSums(iris[,c(1,2)]) # 최소 2개 이상의 열 선택되어야함
colSums(iris[,-5])   # 5번째 열 값을 빼고 계산
colSums(iris[,-'Species'])  #안됨

colMeans(iris[,-5])
head(iris)
rowSums(iris[,-5])
rowMeans(iris[,-5])

z<- matrix(1:20, nrow=4)  # ncol안적어도됨
z
t(z)   #행-열 바꾸기
str(burger.2)
t(burger.2)
str(t(burger.2))  #바꾼건더이상 dataframe아님

iris.subset.1<-subset(iris, Species=='setosa')
iris.subset.1     
iris.subset.2<-subset(iris, Sepal.Length>5.0 & Sepal.Width>3.0)    
iris.subset.2
str(iris.subset.2)

iris.subset.2$Sepal.Length

iris.subset.2[,c(1,2,5)]

a<- matrix(1:20, 4,5)
b<- matrix(21:40, 4,5)
a
a+b
a.2<-2*a
a.2

class(iris) #타입만
str(iris)  #내용도보여줌
class(z)
str(z)
is.matrix(iris)  #iris가 matrix야?
is.matrix(z)
is.data.frame(iris)

# LAB 벚나무 판매

trees
class(trees)
str(trees)

girth.mean<-mean(trees[,1])
girth.mean
girth.mean2<-mean(trees$Girth)
girth.mean2

candidate<- subset(trees, Girth >=girth.mean & Height>80 & Volume>50)
nrow(candidate)

# 종업원 팁계산
install.packages('reshape2')
library(reshape2)
tips

is.matrix(tips)
is.array(tips)
is.data.frame(tips)
class(tips)
str(tips)
levels(tips$day)

head(tips)
tail(tips)

table(tips$day)
table(tips$time)
class(table(tips$day))

dinner<- subset(tips, time=='Dinner')
dinner
lunch<-subset(tips, time=='Lunch')
lunch

table(dinner$day)
table(lunch$day)

head(dinner)
dinner.data<-dinner[c('total_bill','tip','size')]
lunch.data<-lunch[c('total_bill','tip','size')]
colSums(dinner.data)
colMeans(dinner.data)
colSums(lunch.data)
colMeans(lunch.data)

tips.rate<-tips$tip/tips$total_bill
tips.rate
mean(tips.rate) *100
