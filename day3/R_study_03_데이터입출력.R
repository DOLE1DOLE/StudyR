## 데이터입출력
age<- c(28, 17, 35, 46, 23, 67, 30, 50)
age
class(age)

min(age)
max(age)
mean(age)
var(age)
sd(age)

cat('가장 젊은 나이는', min(age),'세 이고,\n 최고령은', max(age), '세 입니다')

# 화면에서 데이터 입력받기
install.packages('svDialogs') #
library(svDialogs)

user.input<-dlg_input('수입을 입력하세요')$res
user.input
income<- as.numeric(user.input)
income
tax<-income * 0.05
tax
cat('세금',tax,'원')
options(scipen=1)  # 1e+4부터 출력을 10000으로 변경하는 옵션

x<-1
y<-10
print(x,y)  #안되죠
cat(x)
cat(x,y)
print(iris[1:6,])
cat(iris[1:6,]) #안됨

## LAB 체질량지수 계산1

height<-dlg_input('키를 입력하세요(cm)')$res  #dlg_input쓸땐 항상 $res 붙여
weight<-dlg_input('몸무게를 입력하세요(kg)')$res
height<-as.numeric(height)
weight<-as.numeric(weight)
height.res<-height/100
bmi<-weight/(height.res^2)
cat('키',height,'cm, 몸무게', weight, 'kg\n', '체질량지수', bmi, '입니다.\n
    (25이상 과체중, 30이상 비만)')

# 숫자 천단위 콤마
install.packages('formattable')
library(formattable)

num.data<- c(1250000, 509009938,322322222,123.435)
num.data
comma(num.data)

# 파일 입출력

getwd()
setwd()

# csv 파일읽기
air.quality<-read.csv('airquality.csv',header=F)  #header=F 첫줄이 제목 아닐때
air.quality
head(air.quality)
str(air.quality)

setosa.iris<-subset(iris,Species=='setosa')
str(setosa.iris)
write.csv(setosa.iris,'./day3/setosa_iris.csv', row.names=F)

install.packages('xlsx')
library(xlsx)
air.quality.xlsx<-read.xlsx('./day3/airquality.xlsx',header=T)

air.quality.xlsx<-readxl::read_excel(file.choose())
air.quality.xlsx

## LAB 다이아몬드 정보
library(ggplot2)
diamonds
str(diamonds)
levels(diamonds$cut)
levels(diamonds$color)
dia<-subset(diamonds, cut=='Premium' & carat>=2)
dia
write.csv(dia, './day3/shiny_diamonds.csv', row.names=F)

# color가 D,H 아닌 나머지 
dia2<-subset(dia, color!='D'& color!='H')
str(dia2)
write.csv(dia, './day3/shiny_diamonds_without_DH.csv', row.names=F)
