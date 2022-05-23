## 기본 그래프

favorite.season<-c("WINTER","SUMMER" ,"SPRING" ,"SUMMER", "SUMMER" ,"FALL"  , "FALL"  , "SUMMER", "SPRING" ,"SPRING","SUMMER", "SUMMER")
f.season<-table(favorite.season)
str(f.season)
f.season

colors()
barplot(f.season, main='좋아하는 계절',col=rainbow(4),
        xlab='계절', ylab='빈도수',horiz=F,
        names=c('가을','봄','여름','겨울'), las=1)

## 중첩 막대그래프
age.A<-c(13709,10974,7979,5000,4250)
age.B<-c(17540,29701,36209,33947,24487)
age.C<-c(991,2195,5366,12980,19007)
ds<-rbind(age.A,age.B,age.C)
ds
colnames(ds)<- c('1970','1990','2010','2030','2050')
ds

par(mfrow=c(1,1),mar=c(3,3,3,6))   # Plot 여백조정하기
barplot(ds,main='인구수 추정',col=rainbow(3),horiz=T,las=1, beside=T) #beside 항목들따로출력

barplot(ds,main='인구수 추정',col=rainbow(3),las=0, 
        legend.text=c('0-14세','15-64세','65세 이상'),
        args.legend = list(x='topright',bty='y', inset=c(-0.35,-0)))  #bty=y 범례에 상자씌움

## LAB 사업부문별 매출액 그래프

ha <- c(54659, 61028, 53307, 46161, 54180)
he <- c(31215, 29863, 32098, 39684, 29707)
mc <- c(15104, 16133, 15222, 13208, 9986)
vs <- c(13470, 14231, 13401, 13552, 13193)
bs <- c(16513, 14947, 15112, 14392, 17091)

ds<-rbind(ha,he,mc,vs,bs)
ds
colnames(ds)<-c('19.1Q','19.2Q', '19.3Q', '19.4Q', '20.1Q')

par(mfrow=c(1,1),mar=c(4.5,4,3,3))
barplot(ds,
        main='사업부문별 매출액(분기)',
        col=rainbow(5),
        horiz=T,
        las=1,
        xlab='억원',ylab='',
        beside=T,   # 항목별로 따로 나눠줌
        legend.text = c('H&A','HE','MC','VS','BS'),
        args.legend = list(x='topright', bty='n', inset=c(-0.2,0))) #inset조정해야함 이상

## 히스토그램
cars
dist<-cars[,2]
dist
par(mfrow=c(1,1),mar=c(4.5,4,3,3))
hist(dist, 
     main='제동거리',
     xlab='제동거리',ylab='빈도수',
     border = 'blue',
     col='skyblue',
     las=1,
     breaks=10
)


# LAB 다이아몬드 시세 파악하기

library(Stat2Data)
data(Diamonds)
ds <- Diamonds$PricePerCt
color <- rep('skyblue', 9)
color[3] <- '#1d3557'    #가장높은값 다른색으로 지정하기
hist(ds,
     main='다이아몬드 시세(캐럿당)',
     breaks = 9,
     xlab='캐럿당 가격($)',ylab='빈도수',
     las=1,
     col=color,
     border = '#457b9d'
     )
color[3] <- '#1d3557'    #가장높은값 다른색으로 지정하기

