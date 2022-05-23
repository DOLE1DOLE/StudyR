## 제어문
# if문
job.type<- 'A'

if (job.type=='B'){   
  bonus<-200
} else {   
  bonus<-100
}   # if문 바깥에서 실행해야 한번에됨

print(bonus)

a<-10;b<-20
if(a>5&b>5){
  print(a+b)
}
if (a>5|b>30){     #|: or
  print(a*b)
}

a<-10;b<-20
if (a>b){
  c<-a
} else {
  c<-b
}
c

c<-ifelse(a>b,a,b)
c

## 반복문
for(i in 1:5){
  print(i)
}

for (i in 1:5){
  cat(i, ' ')
}
cat('\n')

for (y in 1:9){   #구구단 2단만
  cat('2 x',y,'=',2*y,'\n')
}

# 구구단-파이썬과 비교
for (x in 2:9){
  for (y in 1:9){
    cat(x,'x',y,'=',x*y,' ')
  }
  cat('\n')
}

for (i in 1:20){   #짝수만 출력하기(나머지0)
  if (i %% 2 ==0){
    cat(i,'')
  }
}

## iris 꽃잎 크기로 분류
norow<-nrow(iris)
norow
mylabel<-c() #빈 벡터 생성
for (i in 1:norow){
  if (iris$Petal.Length[i]<=1.6){
    mylabel[i]<-'L'
  } else if (iris$Petal.Length[i]>=5.1){
      mylabel[i]<-'H'
  } else {
      mylabel[i]<-'M'
  }
}
print(mylabel)
str(mylabel)
newds<-data.frame(iris$Petal.Length,mylabel,iris$Species)
newds


## while문
sum<-0
i<-1
while(i<=100){
  sum<-sum+i
  i<-i+1
}
print(sum)

## 사용자 정의 함수
mymax<- function(x,y){
  num.max<-x
  if(y>x){
    num.max<-y
  }
  return(num.max)
}
mymax(6,3)

mydiv<-function(x,y=2){
  result<-x/y
  return(result)
}
mydiv(10,3)
mydiv(10,0)   # 디폴트y를 2로 잡았으니

myfunc<-function(x,y){
  val.sum<-x+y
  val.mul<-x*y
  return(list(sum=val.sum, mul=val.mul))
}
result<-myfunc(5,6)
result
result$sum
result$mul


## 내장함수 apply():apply(데이터셋, 행/열 방향 지정, 적용 함수)
# 행방향 1 열방향 2
apply(iris[,1:4],2,sd)  #mean,max,sum,sd....다됨

