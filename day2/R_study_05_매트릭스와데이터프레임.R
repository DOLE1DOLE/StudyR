# 매트릭스

z<- matrix(1:20, nrow=4, ncol=5)
z
z[2,3]

z2<- matrix(1:20, nrow=4, ncol=5, byrow=T)  #byrow 가로쭉~다음행~
z2
z2[2,4]

x<- 1:4
y<- 5:8
z3<- matrix(1:20, nrow=4, ncol=5, byrow=T)
z3

m1<-cbind(x,y)  #column방향으로결합
m1
m2<-rbind(x,y)  #row방향으로결합
m2

m3<- rbind(m2,x)
m3
m3.1<-cbind(m2,x)  #안됨

m4<-cbind(z,x)  #rbind안됨
m4
z[2,]
z[,3]
