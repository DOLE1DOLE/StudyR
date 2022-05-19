str(Chile)

nrow(Chile) - sum(is.na(Chile))
ch <- Chile[complete.cases(Chile),]
ch

set.seed(100)
idx <- sample(nrow(ch), nrow(ch)*0.6)
ch60 <- ch[idx,]
dim(ch60)

agg <- aggregate(ch60[,'population'], by=list(지역=ch60$region), sum)
agg

table(ch60$vote)

no.people <- table(ch60$sex)
no.people
tmp <- subset(ch60, vote=='Y')
str(tmp)
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex), length)
yes.ratio <- agg$x / no.people
yes.ratio

229 / 703
287 / 755


no.region <- table(ch60$region)
tmp <- subset(ch60, vote=='Y')
agg <- aggregate(tmp[,'vote'], by=list(지역=tmp$region), length)
agg
yes.ratio <- agg$x / no.region
yes.ratio
