##그래프2
# 원그래프(Pie chart)
par(mfrow=c(1,1))
favorite.season
ds<-table(favorite.season)

pie(ds,
    main='선호계절',
    radius=1,    #반지름
    col=rainbow(4))    

# 원그래프2
install.packages('plotrix')
library(plotrix)
pie3D(ds,
      main='선호계절',
      labels=names(ds),
      labelcol='yellow',
      labelcex = 1.0,  # 레이블 글자크기
      explode=0.1,  #파이조각 나누기
      radius=1.5,
      col=c('brown','lightgreen','skyblue','white')
)

# 선그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month, late,  #x축, y축
     main='지각생 통계',
     type='l',  # 숫자1아님   l,b,s,o
     lty=1,   #선 종류
     lwd=2,   # 선 굵기
     xlab='월',ylab='지각생 수',
     )

# 선그래프 2개 이상
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2= c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late2,  #x축, y축
     main='지각생 통계2',
     type='o',  # 숫자1아님   l,b,s,o
     lty=1,   #선 종류
     lwd=2,   # 선 굵기
     xlab='월',ylab='지각생 수',
     col='red',
     ylim=c(0,15)   # 그래프 밖으로 튀어나가는거 조정!(x값은여기선상관x)
)

lines(month, late, type='o',col='blue')

## LAB 
install.packages('DAAG')
library(DAAG)

science
table(science$like)
ds<-table(science$like)
pie(ds,
    radius=1,
    main='선호점수별 비율',
    col=rainbow(length(ds)),   #데이터셋길이만큼 rainbow씀
    
    )

pie3D(ds,
      main='선호점수별 비율',
      labels=names(ds),
      labelcex=1.0,
      radius=1.5,
      labelcol='white',
     
      )

# 산점도

wt<-mtcars$wt
mpg<-mtcars$mpg

plot(wt,mpg,
     main='중량-연비 산점도',
     xlab='중량', ylab='연비',
     las=1,
     col='red',
     pch=19,   # 점의 종류
     
     )

# 아래 세가지 산점도는 모두 동일
plot(mtcars$wt,mtcars$mpg)  # 이렇게해도됨
plot(mtcars[,c('wt','mpg')])
plot(mpg~wt, data=mtcars)

vars<-c('mpg','disp','drat','wt')
target<-mtcars[vars]
plot(target,
     main='다중 산점도')

## iris
iris.2<-iris[,3:4]
levels(iris$Species)
group<-as.numeric(iris$Species)
iris.2
color.3<-c('red','green','blue')
plot(iris.2,
     main='붓꽃 꽃잎 길이-너비 산점도',
     pch=group,
     col=color.3[group],  # 그룹별로 다른색 주기
     xlab='꽃잎길이',ylab='꽃잎넓이',
     las=1)
legend(x='bottomright',legend= levels(iris$Species),
       pch=(1:3), col=color.3)   #범례함수 따로
     
     
## LAB 자동차 선팅 분석
library(DAAG)
str(tinting)
plot(tinting$it,tinting$csoa)

group<- tinting$tint
group<-as.numeric(tinting$tint)
color<-c('red','green','blue')
plot(tinting$it,tinting$csoa,
     pch=c(group),
     col=color[group])

group <- tinting$agegp
color <- c('red','blue') 
plot(tinting$it,tinting$csoa,
 pch=group,
 col=color[group])


## 호주의 사회복지 서비스와 만족도
str(socsupport)
ds<-table(socsupport$age)
pie3D(ds,
      main='연령분포',
      labels=names(ds),
      labelcex=1.0,
      radius=1.5,
      explode=0.1,
      col=rainbow(length(ds))
      )

group<-as.numeric(socsupport$gender)
color<-c('blue','red')
plot(socsupport[,c('emotionalsat','tangiblesat','age')],
     pch=group,
     col=color[group])
