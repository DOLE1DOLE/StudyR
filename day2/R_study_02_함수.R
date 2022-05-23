## 함수
y<-sqrt(2)
y<-sqrt()
Y
Y<-C(1,2,3,4,)  #안됨
y<-c(1,2,3,4,NA,5)
sort(y)
# x, decreasing은 매개변수, y와 T/F는 매개변수 값.
# 아래는 정확한 명령문
sort(x=y, decreasing= T)    #NA값은 무시하고 정렬
sort(x=y, decreasing= F)
sort(x=y, decreasing= F, na.last=T)   #결측값 출력한다 제일 마지막에

# 문자열 붙이기 함수
paste('hello','world','!', sep='|')  # sep 구분자 공백 뭐든됨

a<-'나의 나이는'
b<-20
c<-'입니다'
paste(a,b,c)


a<-1:12
b<-'월'
c<-paste(a,b,sep='')
c

## 월별 매출액 분석
sales<-c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales)<-paste(1:12,'월',sep='')
sales

sales['7월']
sales['1월']+sales['2월']
max.sales.month<-sort(sales,decreasing=T)
max.sales.month[1]
max.sales.month

sum(sales[1:6])  # 1-6월간 매출액합
sum(sales[7:12])
