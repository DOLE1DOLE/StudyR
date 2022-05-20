## p value
library(ggplot2)
library(dplyr)

#compact 자동차와 suv 자동차의 도시 연비 t 검정
# 데이터준비
mpg<-as.data.frame(ggplot2::mpg) #mpg=연비

mpg_diff<-mpg %>%   #%>%:단축키 ctrl+shift+m, 데이터 부분추출
  select(class,cty) %>%
  filter(class %in% c('compact','suv'))
head(mpg_diff)
unique(mpg_diff$class)

table(mpg_diff$class) 

t.test(data=mpg_diff, cty~class, var.equal=T)  #cty,class변수 / var.equal=T 등분산성 가정

# 일반 휘발유와 고급 휘발유의 도시 연비 t 검정
mpg_diff2<-mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c('r','p')) #regular premium 일반/고급
table(mpg_diff2$fl)

t.test(data=mpg_diff2, cty~fl, var.equal=T)  #평균차이 유의x

# 실업자 수와 개인 소비 지출의 상관관계
eco<-as.data.frame(ggplot2::economics)

cor.test(economics$unemploy, economics$pce)


# 상관행렬 히트맵
head(mtcars)
car_cor<-cor(mtcars) #상관행렬 생성
round(car_cor,2)  #반올림

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)
corrplot(car_cor,method='number')

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_cor,
         method = "color", # 색깔로 표현
         col = col(200), # 색상 200 개 선정
         type = "lower", # 왼쪽 아래 행렬만 표시
         order = "hclust", # 유사한 상관계수끼리 군집화
         addCoef.col = "black", # 상관계수 색깔
         tl.col = "black", # 변수명 색깔
         tl.srt = 45, # 변수명 45 도 기울임
         diag = F) # 대각 행렬 제외


