## 기본그래프
# 막대그래프 bar chart
favorite.season<-c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL',
                   'FALL','SUMMER','SPRING','SPRING')
favorite.season
ds<-table(favorite.season) #도수분포 계산

barplot(ds, main='좋아하는 계절')
colors()

barplot(ds, main='좋아하는 계절', col='#FF00FF')
barplot(ds, main='좋아하는 계절', col='thistle3')
barplot(ds, main='좋아하는 계절', col=c('thistle3','tomato','wheat','pink'))
barplot(ds, main='좋아하는 계절', col=rainbow(4))
barplot(ds, main='좋아하는 계절', col=c('thistle3','tomato','wheat','pink'),
        xlab='계절',ylab='빈도수', horiz=T)
barplot(ds, main='좋아하는 계절', col=c('thistle3','tomato','wheat','pink'),
        xlab='계절',ylab='빈도수',
        names=c('가을','봄','여름','겨울'),las=3)  #las는 x,y축이 사방으로돌아

        
        