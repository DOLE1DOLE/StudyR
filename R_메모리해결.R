## 메모리 문제 RStudio가 느려질 때 해결

# R에 있는 파일을 다 지우는 함수
rm(list=ls())
# garbage collection
gc()

# Tools>Global Options>General>'Restore previously open source ~~' 체크해제
