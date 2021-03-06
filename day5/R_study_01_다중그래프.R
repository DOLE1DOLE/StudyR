## 다중그래프
par(mfrow=c(2,2), mar=c(3,3,4,2))  # 화면 분할 2x2
hist(iris$Sepal.Length,
     main='붓꽃 꽃받침길이',
     col='orange')   # 히스토그램

mtcars
barplot(table(mtcars$cyl),
        main='자동차 실린더',
        col=c('red','green','blue')
)

barplot(table(mtcars$gear),
        main='자동차 기어수',
        col=rainbow(3),
        horiz=T)

pie(table(mtcars$cyl),
    main='자동차 실린더',
    col=topo.colors(3),  #색 topo팔레트 사용
    radius=1)
par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)  # 화면 복귀

## LAB
install.packages('carData')
library(carData)
carData

ds<-Chile
colors<-rainbow(20)
colors

## 정책지지도 그래프
par(mfrow=c(2,3))   # 화면분할의 par
ds_region<-table(ds$region)  # 2700행 C,M,N,S,SA를 취합해서 하나의 테이블로 만들어주는 table()
ds_gender<-table(ds$sex)
ds_edu<-table(ds$education)

barplot(ds_region,
        main='지역별 분포',
        col=colors[1:5])
barplot(ds_gender,
        main='성별 분포',
        col=colors[5:6])
barplot(ds_edu,
        main='교육수준별 분포',
        col=colors[7:9])

hist(ds$age,
     breaks=6,
     main='연령별',
     xlab='ages',
     col=colors[10:15])

hist(ds$income,
     breaks=4,
     main='수입별',
     col=colors[15:18])

hist(ds$statusquo,
     breaks=9,
     main='지지도',
     col=colors[12:20])

par(mfrow=c(1,1))   #partition의 par랍니다


## 실전! 종업원 팁 그래프 작성
library(reshape2)
str(tips)

# 높은값 색상지정
color.6<-rep('#a8dadc',6)
color.6[2]<-'#1d3557'
color.4<-rep('#a8dadc',4)
color.4[2]<-'#1d3557'
color.4[3]<-'#457b9d'
color.2<-c('#a8dadc','#1d3557')
color.2[2]

par(mfrow=c(2,2))
barplot(table(tips$sex), main='성별',
        col=color.2)
barplot(table(tips$day), main='요일별',
        col=color.4)
barplot(table(tips$time), main='시간대별',
        col=c(color.2[2],color.2[1]))
barplot(table(tips$size), main='인원수별',
        col=color.6)
par(mfrow=c(1,1))

tips.new<-tips
tips.new$perHead<-tips.new$total_bill/tips.new$size

## 1행3열로 1인당 주문금액별 차트
color.5<-rep('#a8dadc',5)
color.5[2]<-'#1d3557'

par(mfrow=c(1,3), mar=c(5,4,4,2)+.1) #mar이값이제일예쁘다
hist(tips.new$perHead,
     breaks=5,
     main='1인당 주문액',
     xlab='단위:$',ylab='빈도수',
     las=2,
     col=color.5)
lunch.perHead<-tips.new[tips.new$time=='Lunch', 'perHead'] # 데이터프레임 그대로 hist 안됨
dinner.perHead<-tips.new[tips.new$time=='Dinner', 'perHead'] 

hist(lunch.perHead,
     breaks=4,
     main='1인당 주문액(점심)',
     xlab='단위:$',ylab='빈도수',
     las=0,
     col=color.5)   
hist(dinner.perHead,
     breaks=4,
     main='1인당 주문액(저녁)',
     xlab='단위:$',ylab='빈도수',
     las=2,
     col=color.5)

par(mfrow=c(1,1))

## 주문금액 대비 팁의 비율
tips.new$percent<-(tips.new$tip/tips.new$total_bill)*100

lunch.percent<-tips.new[tips.new$time=='Lunch', 'percent'] # 데이터프레임 그대로 hist 안됨
dinner.percent<-tips.new[tips.new$time=='Dinner', 'percent']
par(mfrow=c(1,2))

res.lunch<-hist(lunch.percent,
                main='주문액 대비 팁비율(점심)',
                xlab='per(%)',
                breaks=5)
res.dinner<-hist(dinner.percent,
                main='주문액 대비 팁비율(저녁)',
                xlab='per(%)',
                breaks=10)
par(mfrow=c(1,1))

# 일부 구간 병합
res.lunch$counts
res.dinner$counts[1:6]
res<-rbind(lunch=c(0,res.lunch$counts),  #원래 개수하면 안맞아서 0 붙여줌
      dinner=res.dinner$counts[1:6])
colnames(res)<-res.dinner$breaks[2:7]
res  #매트릭스임

barplot(res,
        main='식사시간에 따른 팁비율 분포',
        col=color.2,
        legend.text = c('Lunch','Dinner')
        )
