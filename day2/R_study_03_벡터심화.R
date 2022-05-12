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
condi<-d>5&d<8
d[condi]
