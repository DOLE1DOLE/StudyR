# 팩터와 리스트
bt<-c('a','b','b','o','ab','a')
bt
bt.new<-factor(bt)
bt.new
bt[5]
bt.new[2] #1-6까진 나옴 7은 NA와 Levels출력
levels(bt.new)  #함수levels는 소문자
levels(bt)  #매트릭스의 levels는 없다
as.integer(bt.new) #levels를 숫자인덱스로
levels(bt.new)[4]   #레벨은 1-4까지.순서대로. 5부턴 없ㄹ음
levels(bt.new)[2]

bt.new[7]<-'b'
bt.new[7]<-'c' #팩터->levels에 없는 요인..NA로 추가됨


# 리스트  파이썬 딕셔너리같은것
h.list<-c('balling','tennis','ski')
person<-list(name='Tom',age=25,student=T,hobby=h.list)
person
person[]
person[1]
person['age']
person[['age']]
person$name
person$hobby[1]
person[[4]][2]
person[['hobby']][2]


# LAB 그 카페분석-리스트와 팩터로
cafe<-list(espresso = c(4,5,3,6,5,4,7),
americano = c(63,68,64,68,72,89,94),
latte = c(61,70,59,71,71,92,88),
price = c(2000,2500,3000),
menu = c('espresso','americano','latte'))
cafe  

cafe$menu<-factor(cafe$menu)
cafe$menu

names(cafe$price)<-cafe$menu
cafe$price

sale.espresso<-cafe$espresso * cafe$price[1]
sale.espresso
sale.americano<-cafe$americano * cafe$price[2]
sale.latte<-cafe$latte * cafe$price[3]
sale.americano
sale.latte

sale.day
total
avg
sale.mean<-mean(sale.day)
sale.mean
names(sale.day)<-c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
names(sale.day[sale.day>=sale.mean])

#월별 감전사고 통계
accident <- c(31,26,42,47,50,54,70,66,43,32,32,22)
mon<-1:12
mon.name<-paste('M',mon,sep='')
mon.name
names(accident)<-mon.name
accident

sum(accident)
max(accident)
min(accident)
accident * 0.9  #사고율이 10% 감소하면 사고 건수의 변화

names(accident[accident>=50])
mean(accident)
accident[accident>=mean(accident)] #평균보다 자주발생한

