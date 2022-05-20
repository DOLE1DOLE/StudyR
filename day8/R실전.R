install.packages('HSAUR')
library(HSAUR)

## 1. 포브스
data("Forbes2000")
ds<-Forbes2000
ds[!complete.cases(ds),] # 결측값 확인(!로)

str(ds)
head(ds)

table(ds$country)
tmp<-sort(table(ds$country), decreasing = T)
top.10.country<-tmp[1:10]

par(mar=c(8,4,4,2))  # 그래프 여백 조정
barplot(top.10.country,
        main='기업수 상위 10개국',
        col=rainbow(10),
        las=2,
        ylim=c(0,800)     ##ylim= c()!!!!! c c c c c !!!!!
        )
par(mar=c(5,4,4,2))

table(ds$category)
tmp<-sort(table(ds$category), decreasing = T)
top.10.category<-tmp[1:10]

par(mar=c(10,4,4,2))  # 그래프 여백 조정
barplot(top.10.category,
        main='기업수 상위 10개 업종',
        col='hotpink',
        las=2,
        ylim=c(0,350)
)
par(mar=c(5,4,4,2))

tmp<-ds[ds$category %in% names(top.10.category),]  # A %in% B= A중에서 B인것 찾기 
levels(tmp$category)
# ds에 있던 업종들 출력. category열이 팩터 타입이어서(팩터는 포함하고 있는 값들과 그룹 정보를 함께 저장,
# 값들이 바뀌어도 그룹 정보는 유지됨)
tmp$category<-factor(tmp$category) # so 그룹 정보가 포함된 값들만 사용해서 범주를 10개로 재설정..
levels(tmp$category)

str(tmp)

par(mar=c(10,4,4,2))
boxplot(assets~category,
        data=tmp,
        ylim=c(0,100),
        xlab=' ',
        las=2)
par(mar=c(5,4,4,2))

# 기업 가치 상위 10대 기업
tmp<- ds[order(ds$marketvalue,decreasing = T),]
head(tmp$marketvalue)
tmp[1:10,c('name','country','category','marketvalue')]

korea<-subset(ds, country=='South Korea')
korea[,c('rank','name','category','marketvalue')]

tmp<-ds[,5:8]
tmp<-tmp[complete.cases(tmp),]
str(tmp)  # 결측값몇개나없어졌나확인
plot(tmp, upper.panel=NULL) # 중복패널 제거(lower/upper.panel=NULL)
cor(tmp)

