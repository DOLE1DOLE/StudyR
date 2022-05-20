## 

getwd()
setwd('./day8')
install.packages('data.table')
library(data.table)
library(dplyr)
library(ggplot2)
install.packages('lubridate')
library(lubridate)
library(stringr)
install.packages('forecast')
install.packages('randtests')
library(randtests)

load(file='./result_sales_dt.RData')
str(result_sales_dt)
unique(result_sales_dt$yyyyqrt)
glimpse(result_sales_dt,width=60) #데이터파악 보기는편함

# 쿼터별 매매량 계산
qrt_cnts<-result_sales_dt[,.N,yyyyqrt]   #.N 모든개체수 가져오기
str(qrt_cnts)
tail(qrt_cnts)   # 2015Q2 의 데이터가 너무 적음
qrt_cnts<- result_sales_dt[yyyyqrt !='2015Q2', .N, yyyyqrt]

ggplot(qrt_cnts, aes(x=yyyyqrt, y=N, group=1))+
  geom_line()+
  xlab('년도분기')+ylab('매매건수')+
  theme(axis.text.x = element_text(angle=90))+
  stat_smooth(method='lm')   # 가운데 추세선!(패턴 시각화) lm은 선형회귀

region_cnts<-result_sales_dt[yyyyqrt !='2015Q2', .N, .(yyyyqrt,region)]
ggplot(region_cnts, aes(yyyyqrt, N, group=region))+  # aes에서 x=, y= 생략가능
  geom_line()+
  facet_wrap(~region,scale='free_y',ncol=3)+  # 범주형 변수 기준으로 플롯 면분할
  stat_smooth(method='lm')+
  theme(axis.text.x = element_blank())

# 월별 지역별 매매량
region_cnts<-result_sales_dt[, .N, .(yyyymm,region)]
head(region_cnts)

# 대표지역 추출
regions<- unique(region_cnts$region)

# 각 지역별로 매매량의 랜덤성 검정 결과를 runs_p 변수에 추가
# H0:연도별 지역별 아파트 매매량의 변동이 랜덤하다
# p값: H0이 참이라 가정할 때 관측값이 나올 확률
runs_p<- c()
for(reg in regions){
  runs_p<-c(runs_p, runs.test(region_cnts[region %chin% reg, N])$p.value)  #p.value열을 새로 생성!
}

ggplot(data.table(regions, runs_p), aes(regions, runs_p, group=1))+
  geom_line()+ geom_point()+
  ylab('P-value')+ xlab('지역')

runs.test(region_cnts[region %chin% reg, N])


# 시계열 분할(서울)
seoul_cnts<-result_sales_dt[yyyymm != '201504'& region %chin% '서울', .N, .(yyyymm)]
tot_ts<-ts(seoul_cnts$N, start=c(2006,1), frequency = 12)  #ts time series 12개월 단위로(freq)돌아간다
plot(stl(tot_ts,s.window = 'periodic'))  # stl : 시계열을 seasonal(주,월,분기 등), trend(장기), cyclic(최소2년이상 단위, 고정된기간x) 등으로 나눠줌


arima_mdl<- auto.arima(tot_ts)  #arima모델로 
tsdiag(arima_mdl)   # 표준잔차, ACF,p값

plot(forecast(arima_mdl, h=12)) #h=8은 8단위까지(이후로) 예측한다. 파란선이 예측, 음영이 오차범위

