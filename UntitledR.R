str(Chile)

nrow(Chile) - sum(is.na(Chile))
ch <- Chile[complete.cases(Chile),]
ch

set.seed(100)
idx <- sample(nrow(ch), nrow(ch)*0.6)
ch60 <- ch[idx,]
dim(ch60)

agg <- aggregate(ch60[,'population'], by=list(지역=ch60$region), sum)
agg

table(ch60$vote)

no.people <- table(ch60$sex)
no.people
tmp <- subset(ch60, vote=='Y')
str(tmp)
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex), length)
yes.ratio <- agg$x / no.people
yes.ratio

229 / 703
287 / 755


no.region <- table(ch60$region)
tmp <- subset(ch60, vote=='Y')
agg <- aggregate(tmp[,'vote'], by=list(지역=tmp$region), length)
agg
yes.ratio <- agg$x / no.region
yes.ratio



library(ggplot2)


max.temp<-c(22,27,26,24,23,26,28)
names(max.temp)<-c('월','화','수','목','금','토','일')

barplot(max.temp,
        main='주간 최대 기온',
        col=rainbow(7),
        horiz=T,
        las=2,
        xlab='섭씨', ylab='요일',
)



tData<-TitanicSurvival

tmp<-tData[complete.cases(tData),]
str(tmp)
idx<-order(levels(tmp$survived), decreasing = T)
levels(tmp$survived)<-levels(tmp$survived)[idx]

#levels(tmp$survived)[1]<-"yes"
#levels(tmp$survived)[2]<-"no"


tbl<-table(tmp$survived,tmp$passengerClass)
tbl2<-table(tmp$passengerClass,tmp$survived)
str(tbl)
class(tbl)

#tbl[1,1]<-tbl[2,1]
#tbl[1,2]<-tbl[2,2]
#tbl[1,3]<-tbl[2,3]

rownames(tbl)<-c('생존자','사망자')

#levels(tmp$survived)[1]<-'사망자'
#levels(tmp$survived)[2]<-'생존자'
#tmp$survived<-factor(tmp$survived, levels=c('생존자','사망자'))
barplot(tbl,
        main='타이타닉 클래스별 생존자',
        col=c('red','skyblue'),
        names=c('First','Second','Third'),
        legend.text =levels(tmp$survived),
        args.legend = list(x='topleft', bty='y',inset=c(0.1,0)))
