# 벡터 =파이썬 리스트
# 학생 성적
score<-c(68,95,83,76,90,80,85,91,82,70)
mean(score) #평균
score

c<-51:80  #도 벡터
c

x<-c(1,2,3)   #values가 num
x.1<-1:3      #         int
x
x.1
y<-c('a','b','c')
y
z<-c(TRUE, FALSE, F, T)
z
y.1<-c('hello','world','!')
y.1
w<-c(1,2,'3','4',5)    # 부분만 다르게x 숫자 문자 섞여있으면 다 문자로 바뀜
w  #문자 하나라도들어가면 문자로
w.1<-c('7',8)
w.1
v1<-50:90
v1
v2<-c(1,2,3,10:20)
v2

v3<-seq(1,100,3)
v3

##장점!!!! 파이썬에선안됨
v4<-seq(0.1,1.0,0.1)
v4

v4.date<-seq.Date('2021-01-01','2021-01-31')

v5<-rep(1,times=5)
v5
v6<-rep(1:5, times=3)
v6
v7<-rep(c(1,3,5),times=3)
v7
v8<-rep(seq(1,10,2),times=2)
v8
v9<-rep(c('a','b',3),each=4)  # 각각 반복 each
v9


# 벡터 이름붙이기
absent<-c(8,2,0,4,1)
absent
names(absent)<-c('Mon','Tue','Wed','Thu','Fri')
absent

absent[0]  # 인덱스는 1부터 출발 0아닙니다 character(0) 나옴
absent[1]
absent[2]
absent[6]  #에러x NA
absent['Mon']

vec.1<-c('Mon','Tue','Wed','Thu','Fri')
names(vec.1)<-c(1,2,3,4,5)
names(vec.1)
vec.1[0]  # 문자다~ numeric 아님
var.1<-10
var.1
