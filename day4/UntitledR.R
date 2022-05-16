setwd('C:/STUDY/StudyR/day4') # 작업 폴더 지정
print('Begin work') # 화면으로 출력
a <- 10; b <- 20
sink('result.txt', append=T) # 파일로 출력 시작
cat('a+b=', a+b, '\n')
sink( ) # 파일로 출력 정지
cat('hello world \n') # 화면으로 출력
sink('result.txt', append=T) # 파일로 출력 시작
cat('a*b=', a*b, '\n')
sink( ) # 파일로 출력 정지
print('End work')