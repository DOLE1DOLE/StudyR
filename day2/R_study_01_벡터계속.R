total<-50

d<-c(1,2,3,4,5,6,7,8)
d[1]
d[1:3]
d[c(1,3,5)]
d[seq(1,5,2)]   #seq(처음값,끝값,올리는단위)
d[-2]  #파이썬과 다름 -는 해당 인덱스 빼고 출력
d[-seq(1,5,2)]   #seq(1,5,2)에 해당하는 값 빼고 출력

e<-1:10
e
e<-10:1
e
f<-seq(10,1,-2)  # 역순출력일땐 - !
f

# 1-4월까지 1분기 매출액
sales<-c(640,720,680,540)
names(sales)<-c('M1','M2','M3','M4')
sales
sales[1]   #인덱스 1번 매출액=M1
sales['m2']  #소문자: NA
sales[c('M1','M4')]  #1,4월 매출액 출력

# 벡터의 원소값 변경
v1<-c(1,5,7,8,9)
v1[2]<-4
v1
sales['M2']<-880
sales
v1[c(1,5)]<-c(100,200)  #출력시 알아서 자릿수 맞춰줌
v1
v1<-c(1,2,3,4,5)
v1

## LAB 만기적금액 계산
customer<-c('kim','lee','park','choi','seo')
deposit<-c(5000000,4500000,4000000,5500000,6000000)
rate<-c(3.5,3.0,4.0,5.0,4.5)
period<-c(2,2,5,7,4)

z<-data.frame(customer,deposit,rate,period)###데이터프레임보고다시와
z

names(deposit)<-customer
deposit
names(rate)<-customer
names(period)<-customer
rate
period

kim_total<-deposit['kim']*(1+rate['kim']/100)^period['kim']
kim_total
lee_total<-deposit['lee']*(1+rate['lee']/100)^period['lee']
lee_total

##최종코드
who<-'seo'
sum<-deposit[who]*(1+rate[who]/100)^period[who]
sum

#산술연산으로 간단하게 결과내기
result<-deposit*(1+rate/100)^period  #벡터연산 배우고 간편하게~
result
