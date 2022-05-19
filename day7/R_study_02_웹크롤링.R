## 웹 크롤링
# 1. rvest 패키지 설치
install.packages('rvest')
library(rvest)
library(stringr)

# 2. 보배드림 URL검색->URL 가져오기

url<-'https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=I&page=1&order=S11&view_size=70'
usedCar<-read_html(url)

# 3. HTML .mode-cell.title 안에 차정보 리턴
carInfos<-html_nodes(usedCar, css='.mode-cell.title')

# 4. .tit.ellipsis 안에 있는 나머지 요소들 제거
carTitles<-carInfos %>% html_nodes('.tit.ellipsis') %>% html_text()

# 5. 불필요한 요소 제거
carTitles<-gsub('  ','', carTitles)  #공백제거(차종 공백은 그대로! 스페이스2칸)
carTitles<-gsub("\r\n\t",'',carTitles)

# 6. 연식 가져오기
carYears<-html_nodes(usedCar, css='.mode-cell.year')

# 7. css text에 있는 정보 가져오기
carYears<-carYears %>% html_nodes('.text') %>% html_text()
carYears<-carYears[2:length(carYears)]   # 첫번째 타이틀말고 나머지....

# 8. 연료 정보 가져오기
carFuels<-html_nodes(usedCar, css='.mode-cell.fuel')

# 9. css text 정보 가져오기
carFuels<-carFuels %>% html_nodes('.text') %>% html_text()
carFuels<-carFuels[2:length(carFuels)]
carFuels<-factor(carFuels)

# 10. 정제
carTitles[11]<-'랜드로버 뉴 레인지로버 스포츠 3.0 SDV6' # 얘만너무길어

# 11. 합치기
carUsed<-data.frame(carTitles,carYears,carFuels)

# 12. 데이터셋(차트만들기위해)
ds<-table(carUsed$carFuels)
ds<-data.frame(ds)

# 13. 차트
library(ggplot2)

ggplot(data=ds, aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat='identity')+
  ggtitle('보배드림 1페이지 수입차 연료별')+
  theme(plot.title=element_text(size=16,
                                face='bold',
                                color='steelblue',
                                hjust=0.5))+
  labs(x='연료',y='차량수')
