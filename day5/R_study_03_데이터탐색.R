## 데이터탐색
# 단일범주 데이터
library(carData)
str(TitanicSurvival)
tData<-Titanic
tData2<-TitanicSurvival

room.class<-tData2$passengerClass
str(room.class)
tbl<-table(room.class)
sum(tbl)

barplot(tbl,
        main='선실별 탑승객',
        xlab='선실등급', ylab='탑승객수',
        col=c('blue','green','yellow'),
        names=c('1등실','2등실','3등실'))

tbl/sum(tbl)

pie3D(tbl,
      main='선실별 탑승객 비율',
      radius=1.5,
      labels=c('1등실','2등실','3등실'),
      labelcex=1.0,
      labelcol='white',
      col=c('blue','green','yellow'),
      explode=0.1
      )
#생사여부, 성별 모두 위와 동일.

## 단일변수 수치형
str(state.x77)    #데이터프레임아님
grads<-state.x77[,'HS Grad']  #매트릭스임 so $로 안뽑혀
str(grads)
summary(grads)  ####주요통계치출력
var(grads)
sd(grads)
hist(grads,
     main='주별 졸업률',
     xlab='졸업률', ylab='주의 개수',
     col='orange'
     )
boxplot(grads,
        main='주별 졸업률',
        col='green'
        )   #summary결과값과 순서동일 밑에서부터~

idx<-which(grads==min(grads))  #조건값뽑기
grads[idx]
idx<-which(grads==max(grads))  #조건값뽑기
grads[idx]
idx<-which(grads<mean(grads))  #조건값뽑기
grads[idx]


## 74-79년 영국 폐질환 사망자 데이터
getwd()
ds<-read.csv('./day5/fdeaths.csv', header=T,
             row.names = 'year')
ds

my.color<-c('orange', 'blue','red', 'green','purple','darkgray')
my.lty<-1:6
plot(1:12,                          # x축 데이터
     ds[1,],                        # y축 데이터(1974)
     main='월별 사망자 추이',       # 제목
     type='b',                      # 포인트 타입
     lty=my.lty[1],                 # 라인 종류
     lwd=2,                         # 라인 두께
     xlab='월', ylab='사망자수',    # 라벨
     ylim=c(300,1200),              # y축 범위
     las=1,                         # y축 가로로로로로로로ㅗㄹ
     col=my.color[1],               # 선의 색
     
     )

for(i in 2:6){   #for다음 안 띄우고 바로괄호
  lines(1:12,
        ds[i,],
        type='b',
        lty=my.lty[i],
        col=my.color[i])
}

legend(x='topright',
       legend=rownames(ds),
       lty=my.lty,
       col=my.color,
       lwd=2,
       inset=c(0,-0.5)
       
       )

rownames(ds)


## LAB 미국 자동차 판매가격 데이터
library(DAAG)
str(carprice)
range(carprice$Price)
summary(carprice$Price)

hist(carprice$Price,
     main='자동차 가격 분포',
     xlab='가격대(1,000$)', ylab='빈도수',
     col=rainbow(8)
     
     )

barplot(carprice$Price)

tbl<- table(carprice$Type)
barplot(tbl, 
        main='차종별 빈도수',
        xlab='타입', ylab='빈도수',
 col=rainbow(length(tbl)))

idx<-which(carprice$Price==max(carprice$Price))
carprice[idx, c('Type','Price')]


## 다중변수 분석

str(pressure)

plot(pressure$temperature,pressure$pressure,
     main='온도와 기압',
     xlab='온도(섭씨)',ylab='기압',
     #xlim=c(0,200), ylim=c(0,100)
     )
