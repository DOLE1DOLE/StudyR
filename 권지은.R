## 1번

#결과1
seq(1.0,3.0,0.2)
#결과2
x<-1:11
rep(x[1:3],3)

## 2번

max.temp<-c(22,27,26,24,23,26,28)
names(max.temp)<-c('월','화','수','목','금','토','일')


barplot(max.temp,
        main='주간 최대 기온',
        col=rainbow(7),
        horiz=T,
        las=2,
        xlab='섭씨',ylab='요일')

## 3번

trees
plot(trees$Girth, trees$Volume,
     main='나무 둘레-용적 산점도',
     xlab='둘레', ylab='용적',
     las=0,
     col='skyblue',
     pch=19,
     xlim=c(7.9,21)
     )

## 4번

airquality

par(mfrow=c(2,2),mar=c(4.5,4,3,3))

color.1<-rep('#a8dadc',9)
color.1[1]<-'#1d3557'
color.2<-rep('#a8dadc',5)
color.2[4]<-'#1d3557'
color.3<-rep('#a8dadc',7)
color.3[6]<-'#1d3557'
color.4<-rep('#a8dadc',5)
color.4[2]<-'#1d3557'

hist(airquality$Ozone,
     main='오존분포',
     col=color.1,
     breaks=9,
     xlab='오존',
     )

hist(airquality$Temp,
     main='기온분포',
     col=color.2,
     breaks=5,
     xlab='기온',)

hist(airquality$Solar.R,
     main='자외선분포',
     col=color.3,
     breaks=7,
     xlab='자외선',)

hist(airquality$Wind,
     main='풍량분포',
     col=color.4,
     breaks=5,
     xlab='풍량',)

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)

## 5번

library(carData)
str(TitanicSurvival)
tData<-TitanicSurvival
#sum(is.na(tData$survived))
#sum(is.na(tData$sex))
#sum(is.na(tData$passengerClass))

tmp<-tData[complete.cases(tData),]
str(tmp)



tbl<-table(tmp$survived,tmp$passengerClass)
rownames(tbl)<-c('사망자','생존자')
str(tbl)
#room.class<-tmp$passengerClass
#survive<-tmp$survived
#str(room.class)
#str(survive)

#levels(tmp$survived)[1]<-'사망자'
#levels(tmp$survived)[2]<-'생존자'
barplot(tbl,
        main='타이타닉 클래스별 생존자',
        col=c('red','Turquoise'),
        names=c('First','Second','Third'),
        legend.text =rownames(tbl),
        args.legend = list(x='topleft', bty='y',inset=c(0.1,0)))
       
        
        
library(ggplot2)

#ggplot(tmp, 
#       aes(x=passengerClass, y=survived, fill=survived),
#       xlab=c('First','Second','Third'))+
 # geom_bar(stat='identity',position='stack')




