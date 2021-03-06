## 벡터 심화
## 산술연산
d<-c(1,4,3,7,8)
2*d
d-5
3*d+4

x<-c(1,2,3,4)
y<-c(5,6,7,8)
x+y
x*y
z<-x+y
z

# 벡터와 벡터 연산
m<-c(x,y)
n<-c(y,x)
p<-c(m,n,90,100)
p
q<-c(x,y,90,100)
q

# 벡터 연산 2
v1<-c(1,2,3)
v2<-c('jon','jane','doledole')
v3<-c(v1,v2) #모든 원소가 문자화
v3 
v4<-c(v1,T,F,T,v2)  #T,F까지 문자화됨
v4

## 벡터 사용 함수
datas<-1:10
sum(datas)
sum(2*datas)
length(datas)
mean(datas)
median(datas)
max(datas)
min(datas)
sort(datas, decreasing = T)  #T 내림차순
v2<-sum(datas)/length(datas)  #귀찮게평균계산하기
v2
var(datas)
sd(datas)
range(datas)
range(v3)

#논리연산자
d<-1:9
d>=5
d<5
d[d>5]
sum(d>5)  # true 개수 합을 내놓는다
sum(d[d>5])  #5보다 큰애들 합
d>5&d<8
condi<-d>5&d<8   #조건!을 변수에 저장
d[condi]    # 조건에 해당하는 값 출력
d[d>5&d<8]

##LAB 연습문제 카페매출액분석
espresso<-c(4,5,3,6,5,4,7)
americano<-c(63,68,64,68,72,89,94)
latte<-c(61,70,59,71,71,92,88)
price<-c(2000,2500,3000)
names(price)<-c('esp','ame','lat')
price
sale.espresso<-price['esp']*espresso
sale.espresso
sale.americano<-price['ame']*americano
sale.americano
sale.latte<-price['lat']*latte
sale.latte

sale.day<-sale.espresso+sale.americano+sale.latte
sale.day
names(sale.day)<-c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
total<-sum(sale.day)
total
cat('총매출액',total,'원')
avg<-mean(sale.day)


avg
cat('평균매출액',avg,'원')
result<-names(sale.day[sale.day>=avg])
cat('평균매출액보다 매출액이 높은 요일은',result)

cat('총매출액',total,'원')
cat('평균매출액',avg,'원')
cat('평균매출액보다 매출액이 높은 요일은',result)
