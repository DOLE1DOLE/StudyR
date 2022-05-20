## 2. 대기오염
getwd()
setwd('./day8')
files <- c('ds.2015.csv', 'ds.2016.csv','ds.2017.csv',
 'ds.2018.csv','ds.2019.csv')

ds<-NULL

for(f in files){
  tmp<-read.csv(f, header=T)
  ds<-rbind(ds,tmp)
  print(f)
}
str(ds)
unique(ds$mdate)  #중복값제외하고다가져옴
tail(ds$mdate)

range(ds$mdate)

for(i in 3:8){
  cat(names(ds)[i],
      sum(is.na(ds[,i])),
      sum(is.na(ds[,i]))/nrow(ds), '\n') # 열별 결측값 확인-pm25는 결측값이 너무 많음(18%)
}

ds<-ds[,-8]  # 결측값너무많아서 뺌
ds<-ds[complete.cases(ds),]

# 그룹 정보 추가
mdate<-as.character(ds$mdate)  # 문자열로 바꾸기(substr은 문자를 쪼개는거)
head(mdate)
# substr 사용해서 mdate를 연도,월,시간으로 쪼갬
ds$year<-as.numeric(substr(mdate,1,4))   # 1~4자리까지
ds$month<- as.numeric(substr(mdate,5,6))
ds$hour<-as.numeric(substr(mdate,9,10))

# loc의 코드 확인- unique
unique(ds$loc)

ds$locname<-NA   #locname 열 추가(서울 목포 강릉 각각 따로넣을거라 이렇게 하는게 안전)
ds$locname[ds$loc==111123]<- '서울'
ds$locname[ds$loc==336111]<-'목포'
ds$locname[ds$loc==632132]<-'강릉'
head(ds)
unique(ds$locname)

# 상자그림
boxplot(PM10~locname,  #변수설정
        data=ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100))

# 연도별, 지역별 PM10 농도 추이
library(ggplot2)

tmp.year<-aggregate(ds[,7],
                    by=list(year=ds$year, loc=ds$locname),
                    FUN=mean)
tmp.year$loc<-as.factor(tmp.year$loc)
head(tmp.year)

ggplot(tmp.year, aes(x=year, y=x, color=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

# 월별
tmp.month<-aggregate(ds[,7],
                    by=list(month=ds$month, loc=ds$locname),
                    FUN=mean)
tmp.month$loc<-as.factor(tmp.month$loc)
head(tmp.month)

ggplot(tmp.month, aes(x=month, y=x, color=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')

# 시간대별
tmp.hour<-aggregate(ds[,7],
                     by=list(hour=ds$hour, loc=ds$locname),
                     FUN=mean)
tmp.hour$loc<-as.factor(tmp.hour$loc)
head(tmp.hour)

ggplot(tmp.hour, aes(x=hour, y=x, color=loc, group=loc))+
  geom_line()+
  geom_point(size=3, shape=19, alpha=0.5)+
  ggtitle('시간대별 PM10 농도 변화')+
  ylab('농도')

# 상관관계
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])

# 미세먼지 최고점/저점 확인
tmp.yml<-aggregate(ds[,7],   #year,month 따로 안하면 마구 뭉쳐짐
                   by=list(year=ds$year,month=ds$month,loc=ds$locname),
                   FUN=mean)
idx<-which(tmp.yml$x==max(tmp.yml$x))  #x가 mean값들 열, which는 인덱스(순번)를 가져옴
tmp.yml[idx,]

idx<-which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]

