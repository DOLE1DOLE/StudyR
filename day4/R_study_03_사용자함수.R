## 외부 파일 함수 실행
getwd()
setwd('./day4')
getwd()

# 함수파일 호출
source('myFunc.R')

result<-mydiv(109,6)
result

## LAB 자격증 합격 여부 판단
sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score<-data.frame(sub1,sub2,sub3)
score
result<-determine(score)

source('LAB_determine.R')  # 결과 안나올때 함수 가져오기?
result

## 조건에 맞는 데이터 위치 리턴 함수
score.two<-c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
score.two
which(score.two==69)
which(score.two==98)   # 없다
which(score.two==84)  # 같은값이면 다알려줘
which(score.two>=85)
max(score.two)
which.max(score.two)  #자리를알려주지!
which.min(score.two)

idx<- which(score.two<=60)
idx
score.two[idx]
score.two[idx]<-61  #성적이 60 이하인 값들은 61점으로 성적 상향조정

idx2<-which(score.two>=80)
idx2
score.two[c(2,5,7,9,10)]
score.high<-score.two[idx2]
score.high

## iris 꽃잎길이가 5.0 이상인 것
idx3<-which(iris$Petal.Length>5.0)
idx3
iris.big1<-iris[idx3,]
str(iris.big1) #데이터몇개?

str(subset(iris, iris$Petal.Length>5.0)) ##subset이 더 편하다


## LAB 언어발달상황 진단 프로그램

install.packages('Stat2Data')
library(Stat2Data)
data(ChildSpeaks)  #데이터가져옴

## 말문이 트인 개월수로 등급환산(전처리?!)
idx<-which(ChildSpeaks$Age<9)
idx
ChildSpeaks[idx,]  # 정보세부보기
ChildSpeaks[idx,'m1']<-5
ChildSpeaks
idx<-which(ChildSpeaks$Age >=9 & ChildSpeaks$Age<15)
idx
ChildSpeaks[idx,'m1']<-4
idx<-which(ChildSpeaks$Age >=15 & ChildSpeaks$Age<21)
idx
ChildSpeaks[idx,'m1']<-3
idx<-which(ChildSpeaks$Age >=21 & ChildSpeaks$Age<27)
ChildSpeaks[idx,'m1']<-2
idx<-which(ChildSpeaks$Age >=27)
ChildSpeaks[idx,'m1']<-1

## 언어이해력 점수(Gesell) 등급 환산
idx<-which(ChildSpeaks$Gesell<70)
idx
ChildSpeaks[idx, 'm2'] <- 1   #이렇게 해도 위와 같음
idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90 )
ChildSpeaks[idx, 'm2'] <- 2
idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110 )
ChildSpeaks[idx, 'm2'] <- 3
idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130 )
ChildSpeaks[idx, 'm2'] <- 4
idx <- which(ChildSpeaks$Gesell >= 130)
ChildSpeaks[idx, 'm2'] <- 5

ChildSpeaks$total<-ChildSpeaks$m1+ ChildSpeaks$m2

idx<-which(ChildSpeaks$total<3)
ChildSpeaks[idx,'result']<-'매우 늦음'
idx<-which(ChildSpeaks$total>=3 & ChildSpeaks$total<5)
idx
ChildSpeaks[idx,'result']<-'늦음'
idx<-which(ChildSpeaks$total>=5 & ChildSpeaks$total<7)
ChildSpeaks[idx,'result']<-'보통'
idx<-which(ChildSpeaks$total>=7 & ChildSpeaks$total<9)
ChildSpeaks[idx,'result']<-'빠름'
idx<-which(ChildSpeaks$total>=9)
ChildSpeaks[idx,'result']<-'매우 빠름'


# 종업원 팁 분석 혼자해보기
install.packages('reshape2')
library(reshape2)
str(tips)
unique(tips$sex) #공통요인만출력
unique
idx<-which(tips[,'sex']=='Female')
avg.f<-mean(tips[idx,'tip'])

idx<-which(tips[,'sex']=='Male')
avg.m<-mean(tips[idx,'tip'])

avg.f
avg.m

unique(tips$smoker)

idx<- which(tips$smoker=='Yes')
avg.s<-mean(tips[idx,'tip'])

idx<- which(tips$smoker=='No')
avg.n<-mean(tips[idx,'tip'])

avg.s
avg.n

source('./day4/myFunc.R')
meanbycol.tip('sex')
meanbycol.tip('smoker')
meanbycol.tip('size')
meanbycol.tip('day')
  ##9번부터안함
#categorize.tip<-function(tips)