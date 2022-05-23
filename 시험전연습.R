##1~1000 합 구하기

sum <-0
for(i in 1:1000){
  sum<-sum+i
}
print(sum)

temp<-iris[,5]
temp

sqrt(126*17)

ggplot(data=iris, aes(Petal.Length, Petal.Width))+geom_point()

# 도움말실행방법
?sort  
help(sort)
# sort 블록설정후 F1키


?ceiling
ceiling(2.1)   # 올림 기능 함수

(931 - 225) %% 100
(931-231)/100

(754-225) %%100
(225+29)/100

age.1 <- 20 # 숫자 저장
age.2 <- 25 # 숫자 저장
print(age.1 + age.2) # 정상 실행
name.1 <- 'John'  # 문자 저장
print(name.1) # 정상 실행
grade.1 <- '3'  # 문자 저장
print(age.1 + grade.1)   #문자화한 숫자도 연산은 안됨

v1<-num[50:90]
v1

T+T
T+T+F+F+T

z <- c(TRUE,TRUE,FALSE,TRUE)
sum(z)

# 벡터 이름붙이기
absent<-c(8,2,0,4,1)
absent
names(absent)<-c('Mon','Tue','Wed','Thu','Fri')
absent

z<-names(absent[1])  # 인덱스는 1부터 출발
z

vec.1<-c('Mon','Tue','Wed','Thu','Fri')
names(vec.1)<-c(1,2,3,4,5)
names(vec.1[1])
vec.1[1]  # 문자다~ numeric 아님
var.1<-10
var.1


?double

setwd('C:/STUDY/StudyR/day4')  #working 디렉토리 지정
print('hello R')

# 실행결과를 저장  append=F 파일 새로생성

a<-10
b<-20
sink('test.txt', append=T)  # append-> 이전 문서 뒤에 계속 붙이기
cat('a+b=',a+b, '\n')
sink()
