##변수
total<-5050
cat('합계는', total)

#print('합계는', total)  #안됨. cat써야함

변수<-100
변수   #출력안됨
print(변수)   #가능

a<-10
b<-20
c<-a+b
cat(a,'+',b,'=',c)

a<-50    ##다시 c<-a+b실행시키고 cat해야 제대로됨

## 변수명
avg
.total <- 20202    #쩜 되지롱

iris

# R에서 변수 특이한점 . 허용
mid.sum<-5*5
mid.sum


10/0   #파이썬에선에러!~였지지
-10/0
sqrt(-2)   # NaN값
val<-NULL
val

##숫자형 변수
age.1<-20
age.2<-25
print(age.1+age.2)
name.1<-'John'
print(name.1+3)     #error 문자 숫자 합치기x
name.1*3

## 논리형
3<8
3>8
a<-TRUE
a
b<-T
b
c<-F   #<-대문자 t,f는 변수명으로 못씀
c


a<-NA
a

##소금물의 농도- 변수 salt 소금양 water 물의양 result 농도도
#결과를 "소금=*mg,물=*ml:농도=**%"

salt<-10  #mg
water<-100 #ml
result<-(salt/(salt+water))*100
cat('소금=',salt,'mg,','물=',water,'ml : 농도 =', result,'%')
