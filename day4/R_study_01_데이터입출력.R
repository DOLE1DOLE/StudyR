## 데이터 입출력

setwd('C:/STUDY/StudyR/day4')  #working 디렉토리 지정
print('hello R')

# 실행결과를 저장  append=F 파일 새로생성

a<-10
b<-20
sink('result.txt', append=T)  # append-> 이전 문서 뒤에 계속 붙이기
cat('a+b=',a+b, '\n')
sink()     #꼭 싱크 닫아줘야

cat('hello')
sink('result.txt',append=T)
cat('a+b=',a+b, '\n')
sink()
print('end')


## txt파일 읽기/ 구분자는 공백or 탭

air.txt<- read.table('./airquality.txt',header=T,sep=' ')
air.txt

# csv파일도 read.table로 로드 가능(단 구분자가 , 여야함)
air.csv<-read.table('../day3/airquality.csv',header=T, sep=',')
air.csv

## LAB 체질량지수 계산 2

library(svDialogs)

# 이하 다 작성하고 한번에 Ctrl+Enter
height<-dlgInput('키 입력(cm)')$res
weight<-dlgInput('몸무게 입력(kg)')$res
height<-as.numeric(height)
weight<-as.numeric(weight)
height.unit<-height/100
bmi<-weight/(height.unit^2)
bmi

sink('bmi.txt', append=F)
cat('height','weight','bmi','\n')  # \n을 따로 설정하면 결측값으로 읽어서 스캔에러남 ! 'bmi\n'으로 붙여쓸것 
cat(height.unit*100, weight, bmi)
cat('\n')
sink()

result<-read.table('bmi.txt', header = T, sep = ' ')  #결측값스캔에러는 fill=T로 해결 
result

names(result)<-c('키','몸무게','체질량지수')
result
write.table(result,'./bmi2.txt', row.names=F)


## 엑셀 해결`!~!~!~!`
install.packages('readxl') #엑셀 읽기용 패키지
library(readxl)

air.xlsx<-read_excel('../day3/airquality.xlsx')
air.xlsx

install.packages('openxlsx')  #엑셀 쓰기용 패키지
library(openxlsx)
write.xlsx(result, 'bmi_result.xlsx',rownames=F)
##tibble은 특수한? 데이터프레임같은것

## 실전분석 차정보 조회

carprice.new<-read.csv('./carprice.csv', header=T)
str(carprice.new)
levels(carprice.new$Type)   #안됨

input.type<-dlgInput('차량타입 입력(Compact, Small, Midsize, Large, Sporty, Van)')$res
input.city<-dlg_input('최소 시내연비 입력')$res
input.city<-as.numeric(input.city)

result<-subset(carprice.new, Type==input.type & MPG.city>=input.city)
result

write.xlsx(result, './van_result.xlsx', rowNames=F)


## 오라클 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
remove.packages('RJDBC')
