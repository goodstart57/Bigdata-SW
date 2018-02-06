# header 옵션: 첫 번째 줄을 열이름으로 인식여부(default:F)
# header가 없으면 첫 번째 줄도 data로 인
data <- read.csv(file.choose(), header = T)
head(data)
# data를 attach하면 data 안의 모든 변수들이 memory상에 상주한다.
attach(data)
a1
table(a1)
table(Gender)
#"a17",a18","a19","a20", "a21","a22","a23","a24","a25","a26","a27","a28","a29","a30","a31","a32","a33","a34"
test1 <-subset(data, select =c("a18","a20", 
                               "a21","a22",
                               "a23","a24","a25","a27","a28","a29","a30"
))
head(test1)       
e_value <- eigen(cor(test1))
e_value
fit <- factanal(test1, factors = 2, rotation = 'varimax')
print(fit, cutoff=0.4, digits = 3)

#"a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12","a13","a14", "a15","a16"
test2 <-  subset(data, select = c("a6","a7","a8","a12","a13","a14" ))
e_value <- eigen(cor(test2))
e_value

fit2 <- factanal(test2, factors = 1, rotation="varimax")
print(fit2, cutoff=0.4, digit=3)
# 6, 7, 13
# "a35","a36", "a37","a38","a39","a40", "a41","a42","a43","a44","a45","a46","a47","a48","a49","a50","a51","a52","a53","a54","a55"
test3 <- subset(data,, select = c("a35","a36", 
                                  "a37","a38",
                                  "a41","a42","a43","a44","a45"))
e_value <- eigen(cor(test3))
e_value

fit3 <- factanal(test3, factors = 3, rotation="varimax")
print(fit3, cutoff=0.4, digit=3)

test4 <- subset(data, select = c("a6","a7","a8","a12","a13","a14","a18","a20","a21","a22",
                                 "a23","a24","a25","a27","a28","a29","a30"))
e_value <- eigen(cor(test4))
print(e_value, digit=3)

fit4 <- factanal(test4, factors = 3, rotation="varimax")
print(fit4, cutoff=0.4, digit=3)
# 독립변수
#1 - 도전(6 7 8 12 13 14)
#2 - 개인(18 23 24 25 27 29)
#3 - 사회(20 21 22 28 30)
# 종속변수
#1 - 레저(35 36)
#2 - 운동(37 38)
#3 - 취미(41 42 43 44 45)

IND1 <- (a6+a7+a8+a12+a13+a14)/5 
IND2 <- (a18+a23+a24+a25+a27+a29)/6
IND3 <- (a20+a21+a22+a28+a30)/5
DP1 <- (a35+a36)/2
DP2 <- (a37+a38)/2
DP3 <- (a41+a42+a43+a44+a45)/5

fit5 <- factanal(test5, factors=5, rotation="varimax", score="regression")
print(fit5, cutoff=0.4, digit=3)
fit5$scores

#독립변수
#1 - 가족의 안전(23 24 25 29)
#2 - 평화 및 보수(20 21 22 28 30)
#3 - 자극감성추구(6 7 13)
#4 - 사랑과 조화(26 27)
#5 - 부유한 삶(17 18)
#종속변수
#1 - 41 42 43 44 45 46 48 49(동호회활동)
#2 - 53 54 55(여행)
#3 - 35 36(모험형 레저)
#4 - 47 50 51(컴퓨터 게임)
#5 - 37 38(구기운동)

test