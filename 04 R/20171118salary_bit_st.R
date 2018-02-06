### salary 데이터는 통계청에서 발표한 2013년도 전국 연령,남녀, 경력별 평균월급 데이터 셋이다. 

### > 파일을 읽어 salary2013 객체에 담으세요.
salary2013 <- read.csv(file="./Data/example_salary.csv", na="-")
##salary2013 <- salary2013[which(!is.na(salary2013[,2]))&!is.na(salary2013[,3]),]
attach(salary2013)

###> 한글로 된 컬럼 이름을 다음과 같은 영어로 바꾸세요. 
# "age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex"
names(salary2013) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
head(salary2013)

###> 우리나라 평균 월급은 얼마인가요? (평균값 : mean()함수를 사용 )
# (답) 
mean(salary, na.rm=T)

###> 월급의 중앙값은 얼마인가요? (중앙값 : median() 함수 사용 )
# (답) 
median(salary, na.rm=T)

###> 월급을 최대로 받으면 얼마고, 최소로 받으면 얼마인가요? (최대값 : max() 함수 사용, 최소값 : min()함수 사용)
# (답) 
max(salary, na.rm=T)
min(salary, na.rm=T)
range(salary, na.rm=T)

###> 최대 월급을 받고 있는 사람은 어떤 특징을 가지고 있나요?
# (답) 최대 월급을 받고 있는 사람은 평균보다 수당, 근로시간, 경력이 많고 남자이다. 
salary2013[salary==max(salary, na.rm=T), ]
salary2013[which.max(salary),]

apply(salary2013[,c(2:5)], 2, mean)


###> 남, 여별 평균월급은 얼마나 차이가 나나요?
# (답) 여자가 611,391만큼 적다
diff(tapply(salary, sex, mean))
result <- tapply(salary, sex, mean, na.rm=T)
diff(result)

###########################################################
#apply()군을 배웠다면!! - tapply()를 사용하여 아래의 내용을 구해보자. 
###########################################################
###> 남, 여별 평균월급은? 
# (답) 
tapply(salary, sex, mean)

###> 연령대별 평균월급은? tapply() 사용
# (답) 
tapply(salary, age, mean)

###> 경력별 평균월급은? 
# (답) 
tapply(salary, career, mean)

###> 경력별 월급의 범위는?
# (답) 
tapply(salary, career, range)
