## 데이터 전처리!!

z<-c(1,2,3,NA,5,NA,7,8,9,10)
z
summary(z) #결측값제외하고해줌
sum(z)  #안됨
min(z)

is.na(z)  #결측값 확인
sum(is.na(z))
sum(z, na.rm=T) #결측값제거

# 결측값 제거/치환(0, 평균값)
z1<-c(1,2,3,NA,5,NA,7)
z2<-c(5,8,1,NA,3,NA,7)
z1[is.na(z1)]<-0   #NA를 0으로
z3<-as.vector(na.omit(z2))
z4<-z1
z4[is.na(z4)]<- ceiling(sum(z4,na.rm=T)/length(z4)) #0은 값이 더 틀어지니 평균값으로 처리
summary(z4)
summary(c(1,2,3,4,5,6,7)) #비교해보기

## 2차원 결측값

iris.na<-iris
iris.na[1,2]<-NA
iris.na[1,3]<-NA
iris.na[2,3]<-NA
iris.na[3,4]<-NA
head(iris.na)

## 결측값 열별로 확인
for(i in 1:ncol(iris.na)){
  this.na<- is.na(iris.na[,i])
  cat(colnames(iris.na)[i], '\t', sum(this.na), '\n')
  }

## apply 함수  -for문보다 이게편함
col_na= function(y) {
  return(sum(is.na(y)))
}
na_count<-apply(iris.na,2, FUN=col_na)
na_count

## 결측값 행별로 확인
result<-rowSums(is.na(iris.na))
sum(result>0)  # 결측값있는 행의 총수
sum(is.na(iris.na))

## 매트릭스 NA 제외 전처리

head(iris.na)
iris.na[complete.cases(iris.na),] # NA가 없는 행 표시
iris.na[!complete.cases(iris.na),]  # ! 로
iris.na[complete.cases(iris.na)==F,]  # 위와 같음

iris.comp<-iris.na[complete.cases(iris.na),] # 제외하고 다시 만들기

## LAB 전세계 통계데이터
library(carData)
str(UN)
levels(UN$region)
levels(UN$group)

apply(UN,2,FUN=col_na)
length(UN$region)

mean(UN$lifeExpF, na.rm=T)
tmp<-UN[,c('pctUrban','infantMortality')]
tmp<-tmp[complete.cases(tmp),]   #NA제거


colMeans(tmp)

tmp.asia<-subset(UN, region=='Asia')
mean(tmp.asia$fertility)  #결측값 없어 계산잘됨


## 정렬
v1<-c(1,7,6,8,4,2,3,9)
v1
sort(v1, decreasing = T)

name<-c('정대일','강재구','신현석','홍길동')
sort(name, decreasing = T)

idx<-order(name,decreasing = T)
idx
name[idx[1]]
name[idx[4]]

a <- c(1,2,3,4,5)
b <- c(11,24,55,23,9)
z<-rbind(a,b)
z
str(z)
colnames(z)<-c('c1','c2','c3','c4','c5')
z
z[,1]


## 데이터프레임 정렬

sort(iris$Sepal.Length)

sl.order<-order(iris$Sepal.Length)
iris[sl.order,]
iris.new<-iris[sl.order,]

# 정렬 기준 2개일때
iris.ag<-iris[order(iris$Species,iris$Petal.Length,
                    decreasing = T),]

## LAB 고속도로 교통사고 데이터
library(carData)
str(Highway1)
levels(Highway1$htype)

Highway1[order(Highway1$rate, decreasing = T),]

#구간의 길이(len)가 가장 긴 상위 10개 구간의 총 길이
#내림차순정렬부터
tmp<-Highway1[order(Highway1$len, decreasing = T), 'len']
tmp
sum(tmp[1:10])
#위와같은결과
tmp.2<-sort(Highway1$len, decreasing = T)
sum(tmp.2[1:10])

#일일 교통량(adt)이 적은 하위 10개 구간의 일일 교통량(adt), 사고율

tmp<- Highway1[order(Highway1$adt), c('adt','rate')]
tmp[1:10,]

tmp<-Highway1[order(Highway1$slim, decreasing = T),
              c('len','adt','rate')]
tmp
tmp[1:5,]

