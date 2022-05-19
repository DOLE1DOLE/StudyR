## 샘플링

x<-1:100
y<- sample(x, size=10, replace=F) $ replace=F #비복원추출
y

idx<- sample(1:nrow(iris), size=15, replace = F)
idx
iris.15<-iris[idx,]
dim(iris.15)  # 행,열 개수 확인

## set.seed():임의 추출을 하되 재현가능한 결과가 필요한 경우 

sample(1:20, size=5)
set.seed(100) #를 하면 다음 1번 샘플링 값이 항상 같음(2번째부턴....의미없다)
sample(1:20, size=5)

# 1~5까지 수에서 열을 임의로 조합
combn(1:5,4)
combn(1:5,1)
combn(1:10,10)  # 10개를 뽑는 조합은 한 종류뿐

x<-c('red','green','blue','black','white')
com<-combn(x,2)

for(i in 1:ncol(com)){
  cat(com[,i], '\n')
}


## LAB 편두통 데이터
str(KosteckiDillon)

#전체 관측값의 10%, 20%, 30%, 40%, 50%를 샘플링했을 때의 평균 
#치료일수(dos)가 전체 데이터의 치료일수와 얼마나 차이나는가

tot.mean<- mean(KosteckiDillon$dos)
summary(KosteckiDillon$dos)

for(rt in (1:5)*0.1){
  set.seed(100)
  idx<-sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rt)
  sam.data<-KosteckiDillon[idx,'dos'] # 샘플링 데이터 추출
  tmp.mean<-mean(sam.data)  # 샘플링 데이터 평균
  cat('비교:', rt*100, '% 샘플링 평균치료일수=', tmp.mean, ' : ', tot.mean-tmp.mean, '\n')
}

## 데이터 그룹에서 합계나 평균 계산(집계)
agg.result<- aggregate(iris[,-5], by=list(iris$Species), FUN=mean)
 # iris[,-5]  5번째열 빼고 나머지 다!
summary(iris)
aggregate(iris[,-5], by=list(품종=iris$Species), FUN=median)


## LAB 2011 캐나다 전국 선거 통계
str(CES11)
table(CES11$abortion)
table(CES11$abortion)/nrow(CES11)

agg<-aggregate(CES11[,'abortion'], by=list(CES11$gender), FUN=table)
str(agg)
agg.2<-agg[,2] # yes/no 빈도수 부분만 추출

colnames(agg[,2])<-c('낙태찬성','낙태반대')
agg.2[1,]<-agg.2[1,]/sum(agg.2[1,])   #female 비율 계산
agg.2[2,]<-agg.2[2,]/sum(agg.2[2,])   #male 비율 계산
rownames(agg.2)<-agg[,1]
agg.2


## 실전분석 칠레 대통령 선거 여론조사

help(Chile)
str(Chile)
nrow(Chile)-sum(is.na(Chile))  #결측값확인
ch<- Chile[complete.cases(Chile),]  #결측값 제거

set.seed(100)
idx<-sample(nrow(ch),nrow(ch)*0.6)  #60%샘플링
ch60<-ch[idx,]
dim(ch60)

agg<-aggregate(ch60[,'population'],by=list(지역=ch60$region),sum)
agg

table(ch60$vote)

no.people<-table(ch60$sex)
tmp<-subset(ch60,vote=='Y')
str(tmp)
agg<-aggregate(tmp[,'vote'], by=list(성별=tmp$sex),length)
yes.ratio<-agg$x/no.people

no.region<-table(ch60$region)
tmp<-subset(ch60, vote=='Y')
agg<-aggregate(tmp[,'vote'], by=list(지역=tmp$region),length)
yes.ratio<-agg$x/no.region
