## 고급 그래프
# treemap
install.packages('treemap')
library(treemap)

data(GNI2014)
str(GNI2014)
GNI2014$country

treemap(GNI2014,
        index=c('continent','iso3'), # 계층구조설정(대륙-국가)
        vSize = 'population',  # 타일 크기
        #데이터,인덱스,vsize까지는 해야 그래프구현
        vColor='GNI',        # 타일 컬러
        title='대륙간 인구수/GNI',
        type='value',   # 타일 컬러링방법
        #bg.labels = 'yellow', #사용불가!
        na.rm=T,
        
        )

## LAB 미국 주요도시 통계 데이터 분석
library(carData)
head(Ericksen)
str(Ericksen)

ds<-subset(Ericksen, city=='state')
ds$stname<-rownames(ds)

treemap(ds,
        index=c('stname'),
        vSize = 'poverty',
        type='value',
        vColor='crime',
        title='미국 막장도시 찾기',
        
        )


## 레이다차트
install.packages('fmsb')
library(fmsb)

score<-c(80,60,95,85,40,55)
max.score<-rep(100,6)
min.score<-rep(0,6)
ds<- rbind(max.score,min.score,score)
ds
class(ds)
ds<-data.frame(ds)
class(ds)
colnames(ds)<-c('국어','영어','수학','물리','음악','체육')
ds

radarchart(ds)

## 매개변수(옵션)
# R에서는 RGB(RR,GG,BB,AA) 순서
radarchart(ds,
           pcol='darkgreen',              # 선의 색
           pfcol=rgb(0.2,0.5,0.5,0.5),        # r,g,b,투명도 순서
           plwd=3,     # 선 두께
           cglcol='grey',   # 거미줄 색
           cglty=1,         # 거미줄 타입
           cglwd = 0.1,     # 거미줄 두께
           axistype = 2,    # 축의 레이블 타입
           seg=4,           # 축의 눈금 분할
           axislabcol = 'darkgrey',   # 축의 레이블 색
           caxislabels = seq(0,100,25),  # 축의 레이블 값
           
           )

## LAB 종교 조사 데이터
str(WVS)

pop<- table(WVS$country)

tmp<- subset(WVS, religion=='yes')
length(tmp$religion)
rel <- table(tmp$country)
pop
rel
stat<-rel/pop  #나라별비율

max.score<- rep(1,4)
min.score<-rep(0,4)
ds<-rbind(max.score, min.score,stat)
ds<- data.frame(ds)


radarchart(ds,
           pcol='tomato4',
           pfcol='#7f33337f',
           plwd=3,
           cglcol='grey',
           cglty=1,
           cglwd=0.1,
           axistype = 1,
           caxislabels = seq(0,1,0.3),
           seg=3,
           
           )


## ggplot
library(ggplot2)

month<-c(1,2,3,4,5,6)
rain<- c(55,50,45,50,60,70)
df<-data.frame(month,rain)

ggplot(df,
       aes(x=month, y=rain)) +
        geom_bar(stat='identity',
                 width=0.7,
                 fill='steelblue',
                 
                 
                 )
       
## 막대그래프 가로
ggplot(df,
       aes(x=month, y=rain)) +
  geom_bar(stat='identity',
           width=0.7,
           fill='steelblue') +
  ggtitle('월별 강수량(1~6월)') +
  labs(x='월',y='강수량')+
  coord_flip()+    # 옆으로눕히기
  theme(plot.title=element_text(size=20,
                                face='italic',
                                color='darkblue',
                                hjust=0.5    #0~1값.정렬
                                
                                ))


## 히스토그램
ggplot(data=iris,
       aes(x=Petal.Length)) +  #히스토그램은 원래 벡터->x값만
   geom_histogram(binwidth=0.5,       #breaks같은것 
                  position='dodge')


ggplot(data=iris,
       aes(x=Sepal.Width,
           fill=Species)) +    #품종에 따라 !!분류됨
        geom_histogram(position='dodge') +   # dodge:안 겹치게 그림
      ggtitle('붓꽃 품종별 꽃받침 넓이 히스토그램') +
    theme(legend.position = 'bottom')
 

## 산점도
ggplot(data=iris,
       aes(x=Petal.Length, y=Petal.Width, color=Species))+
  geom_point(size=3) +  # 점 크기
  ggtitle('붓꽃 품종별 꽃잎 산점도') +
  theme(plot.title=element_text(size=16,
                                face='bold',
                                color='darkblue',
                                hjust=0.5))

## 선그래프
year<- 1937:1960
cnt<-as.vector(airmiles)
df<-data.frame(year,cnt)

ggplot(data=df,
       aes(x=year, y=cnt))+
  geom_line(col='tomato')


## LAB Airquality
# 월별 평균기온 변화 막대그래프
df<-aggregate(airquality[,'Temp'], by=list(month=airquality$Month),
              FUN=mean)
class(df)
colnames(df)<-c('month','temp')
library(ggplot2)
ggplot(data=df,
       aes(x=month,y=temp)
       )  +
  geom_bar(stat='identity', width=0.6, fill='darkgreen') +
  ggtitle('5개월 평균 기온(화씨)')

# 오존-농도 관계 산점도
df<-airquality[complete.cases(airquality),]  #NA제거
ggplot(data=df,
       aes(x=Temp, y=Ozone, color='orange'))+
  geom_point(size=2)
cor(df$Temp, df$Ozone)  #상관계수

# 7월의 일별 오존농도 변화 선그래프
df.7<-subset(df,Month==7)
ggplot(data=df.7, aes(x=Day, y=Ozone))+
  geom_line(col='wheat3', 
            linetype='dashed')+
  geom_point(col='orange', size=2)+
  ggtitle('일별 오존지수')+
  theme(plot.title=element_text(size=16,
                                face='bold',
                                color='darkblue',
                                hjust=0.5))+
  labs(x='일',y='오존지수수')

## 실전분석 세계각국지표분석
str(UN98)
help(UN98)

df<-UN98[,c('region','tfr')]
df<-df[complete.cases(df),]
df<-aggregate(df[,'tfr'], by=list(region=df$region), FUN=mean)

ggplot(data=df, aes(x=region, y=x))+
  geom_bar(stat='identity', width=0.8, col='#333333', fill=rainbow(5))+
  ggtitle('대륙별 평균 여성출산율')+
  labs(x='대륙',y='평균출산율')

## 타일의 크기를 여성의 평균수명(lifeFemale)으로, 타일의 색을 여성의 문맹률
#(illiteracyFemale)로 나무지도
library(treemap)
df.tm<-UN98[,c('region','lifeFemale','illiteracyFemale')]
df.tm<-df.tm[complete.cases(df.tm),]   #NA제거
df.tm$country<-rownames(df.tm)
treemap(df.tm,
        index=c('region','country'),
        vSize='lifeFemale',
        vColor='illiteracyFemale',
        type='value')

# 남성의 교육수준(educationMale)과 여성의 교육수준(educationFemale) 산점도

df.edu<- UN98[,c('region','educationMale','educationFemale')]
df.edu<-df.edu[complete.cases(df.edu),]

ggplot(data=df.edu, aes(x=educationMale,y=educationFemale, color=region))+
  geom_point(size=2)+
  ggtitle('대륙별 남녀 교육수준')+
  theme(plot.title=element_text(size=16,
                                face='bold',
                                color='steelblue',
                                hjust=0.5))+
  labs(x='교육수준(남)',y='교육수준(여)')
  
plot(UN98)

cor(df.edu$educationMale,df.edu$educationFemale)

