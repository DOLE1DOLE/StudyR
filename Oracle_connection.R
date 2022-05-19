## 1.Oracle 연결
# Rjava, rjdbc, ROracle 등 패키지많은데 잘안됨
# 한글해결 : DBMSencoding='euc-kr' (not utf-8)
install.packages('ROracle')  # 이거아냐잘안됨 RODBC임
# ROracle Open Database Connectivity

# 2.적재 
library(RODBC)

# 3. ODBC 데이터원본(64비트) 설정
conn1<- odbcConnect('SCOTT_DSN',uid='SCOTT',pwd='tiger',
                    DBMSencoding='euc-kr',
                    believeNRows=F)

# 4. 연결확인
summary(conn1)

# 5. 쿼리실행
res<-sqlQuery(conn1, 'select * from emp')
str(res)
sqlQuery(conn1, 'select * from MEMBERTBL')

# 6. 접속 끊기
odbcClose(conn1)
summary(conn1)
conn1
