##패키지설치 및 로드

install.packages('ggplot2')
data<-iris
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()


## cowsay 패키지
install.packages('cowsay')
library(cowsay)       
say(what='Hi~', by='cow')
say(what='Hi~', by='cat')
say(what='야둥둥이', by='endlesshorse')


##시스템함수
Sys.Date()
Sys.time()

##생일맞추기=((m*4+9)*25)+d
#100m+225+d
#9월 21일    
900+225+21
(1146-225)/100
(931-225)/100
(754-225)/100
# 소윤 931 주연 754 민철 1029 석준 1139 현석 1442
val<-754
d<-(val-225)%%100
m<-((val-225)-(val-225)%%100)/100
cat(m,d)
