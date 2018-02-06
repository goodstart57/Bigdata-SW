data <- read.csv("./Data/레저연구.csv", header=T)

attach(data)
#=========================================================

# factoranalysis
# 종속

test1 <- subset(data, select=c("a35","a36","a37","a38","a41",
                               "a42","a43","a44","a45","a46",
                               "a47","a48","a49","a50","a51",
                               "a53","a54","a55"))
e_value <- eigen(cor(test1))

fit1 <- factanal(test1, factors=5, rotation="varimax", score="regression")
print(fit1, cutoff=0.4, digit=3)
#1 - 41, 42, 43, 44, 45, 46, 48, 49 (동호회활동)
#2 - 53, 54, 55 (여행)
#3 - 35, 36 (모험형 레저)
#4 - 47, 50, 51 (컴퓨터게임)
#5 - 37, 38 (구기운동)

#=========================================================

test2 <- subset(data, select=c("a6","a7","a13"))
e_value <- eigen(cor(test2))

fit2 <- factanal(test2, factors=1, rotation="varimax")
print(fit2, cutoff=0.4, digit=3)
#6, 7, 13

#=========================================================

test5 <- subset(data, select=c("a6","a7","a8","a12","a13",
                               "a14","a18","a20","a21","a22",
                               "a23","a24","a25","a27","a28",
                               "a29","a30"))

e_value <- eigen(cor(test5))
print(e_value, digit=3)

fit5 <- factanal(test5, factors=5, rotation="varimax", score="regression")
print(fit5, cutoff=0.4, digit=3)
fit5$score

# 독립변수
IND1 <- (a23+a24+a25+a29)/4
IND2 <- (a20+a21+a22+a28+a30)/5
IND3 <- (a6+a7+a13)/3
IND4 <- (a26+a27)/2
IND5 <- (a17+a18)/2
# 종속변수
DP1 <- (a41+a42+a43+a44+a45+a46+a48+a49)/8
DP2 <- (a53+a54+a55)/3
DP3 <- (a35+a36)/2
DP4 <- (a47+a50+a51)/3
DP5 <- (a37+a38)/2
#1 - 41, 42, 43, 44, 45, 46, 48, 49 (동호회활동)
#2 - 53, 54, 55 (여행)
#3 - 35, 36 (모험형 레저)
#4 - 47, 50, 51 (컴퓨터게임)
#5 - 37, 38 (구기운동)

DT <- cbind(data, IND1, IND2, IND3, IND4, IND5, DP1, DP2, DP3, DP4, DP5)
head(DT)

# score 저장
INSC1 <- fit5$scores[,1]
INSC2 <- fit5$scores[,2]
INSC3 <- fit5$scores[,3]
INSC4 <- fit5$scores[,4]
INSC5 <- fit5$scores[,5]

DPSC1 <- fit1$scores[,1]
DPSC2 <- fit1$scores[,2]
DPSC3 <- fit1$scores[,3]
DPSC4 <- fit1$scores[,4]
DPSC5 <- fit1$scores[,5]

DT <- cbind(DT, INSC1, INSC2, INSC3, INSC4, INSC5, DPSC1, DPSC2, DPSC3, DPSC4, DPSC5)
head(DT)

sen <- (a1+a2+a3+a4+a5)/5
DT <- cbind(DT, sen)

attach(DT)
summary(sen)

DT$sen_G[sen<2.800] <- 1
DT$sen_G[sen>=2.800&sen<3.200] <- 2
DT$sen_G[sen>=3.200&sen<3.600] <- 3
DT$sen_G[sen>=3.600] <- 4
head(DT)

attach(DT)
table(sen_G)

# crosstab

Cros_T <- table(Gender, sen_G)
margin.table(Cros_T, 1) # row sum
margin.table(Cros_T, 2) # column sum 
margin.table(Cros_T)

chisq.test(Cros_T)

# 조금 더 편리한 것
#install.packages("gmodels")
library(gmodels)
CrossTable(Cros_T, expected=TRUE, prop.c=FALSE, prop.r=FALSE, prop.t=FALSE)


# independent sample t test (독립표본t검정) ===============================

# 등분산성 검정 먼저하고 t검정

var.test(DP1~Gender)
var.test(DP2~Gender)
var.test(DP3~Gender)
var.test(DP4~Gender) # 0.05보다 작지 않아 분산이 다르다고 할 수 없다 --> var.eq=T
var.test(DP5~Gender)

t.test(DP1~Gender, alt="two.sided", var.eq=F)
t.test(DP2~Gender, alt="two.sided", var.eq=F)
t.test(DP3~Gender, alt="two.sided", var.eq=F)
t.test(DP4~Gender, alt="two.sided", var.eq=T)
t.test(DP5~Gender, alt="two.sided", var.eq=F)

# paired t test
t.test(a1, a2, alt="two.sided")

#============================================================
#install.packages("psych")
library(psych)

describeBy(IND1, Gender) # 기술통계랑
describeBy(IND2, Gender)
describeBy(IND3, Gender)
describeBy(IND4, Gender)
describeBy(IND5, Gender)

describeBy(DP1, sen_G)
describeBy(DP2, sen_G)
describeBy(DP3, sen_G)
describeBy(DP4, sen_G)
describeBy(DP5, sen_G)

# ANOVA 분석 ==================================================== 

## one way ANOVA
FV1 <- aov(DP1~sen_G, data=DT)
summary(FV1)
FV2 <- aov(DP2~sen_G, data=DT)
summary(FV2)
FV3 <- aov(DP3~sen_G, data=DT)
summary(FV3)
FV4 <- aov(DP4~sen_G, data=DT)
summary(FV4)
FV5 <- aov(DP5~sen_G, data=DT)
summary(FV5)

# FV3, FV4, FV5 --> 차이가 나므로 사후검정 필요

# ANova 사후검정 종류
# - Scheffe
# - Turkey
# - Duncan (대부분의 의료데이터 / 민감하게 분석해줌)

# Scheffe
#install.packages("doBy")
#install.packages("agricolae")
library(agricolae)
library(doBy)

scheffe.test(FV3, "sen_G", alpha=0.05, console=TRUE)
scheffe.test(FV4, "sen_G", alpha=0.05, console=TRUE)
duncan.test(FV4, "sen_G", alpha=0.05, console=TRUE) # 던칸이 더 민감
scheffe.test(FV5, "sen_G", alpha=0.05, console=TRUE)
duncan.test(FV5, "sen_G", alpha=0.05, console=TRUE)

## two way ANOVA (이원변량분석) --> 주효과 / 상호작용효과
FFV1 <- aov(DP1~Gender+sen_G+Gender:sen_G)
summary(FFV1)
FFV2 <- aov(DP2~Gender+sen_G+Gender*sen_G)
summary(FFV2)
FFV3 <- aov(DP3~Gender+sen_G+Gender:sen_G)
summary(FFV3)
FFV4 <- aov(DP4~Gender+sen_G+Gender:sen_G)
summary(FFV4)
FFV5 <- aov(DP5~Gender+sen_G+Gender:sen_G)
summary(FFV5)

describeBy(DP5, Gender*sen_G)

#=====================================================

# correlation Analysis (상관분석)
# --> 0.4~0.7:약간있다 / 0.7이상:상관있다.

cor(DP1, DP2)
COR_T <- subset(DT, select=c(IND1, IND2, IND3, IND4, IND5,
                             DP1, DP2, DP3, DP4, DP5))
cor(COR_T, method="pearson")

# scatter plot
plot(IND1, DP2, pch=47)
plot(IND3, DP3, pch=8)

# Multiple Regression
reg1 <- lm(DP1~IND1+IND2+IND3+IND4+IND5, data=DT)
summary(reg1)
reg2 <- lm(DP2~IND1+IND2+IND3+IND4+IND5, data=DT)
summary(reg2)
reg3 <- lm(DP3~IND1+IND2+IND3+IND4+IND5, data=DT)
summary(reg3)
reg4 <- lm(DP4~IND1+IND2+IND3+IND4+IND5, data=DT)
summary(reg4)
reg5 <- lm(DP5~IND1+IND2+IND3+IND4+IND5, data=DT)
summary(reg5)

regSC1 <- lm(DPSC1~INSC1+INSC2+INSC3+INSC4+INSC5, data=DT)
summary(regSC1)

### 모델 평가 
# 잔차분석 확인
par(mfrow=c(2,2))
plot(reg2) # QQ플랏 일직선을 따라가는지

resid <- residuals(reg2) 
shapiro.test(resid) # 잔차가 정규성을 띄는지 검사(p-value가 0.05보다 커야함)

# 다중공선성 확인
# 1. 독립변수끼리 상관분석해서 0.7넘는지 (넘으면 빼야함)
COR_T <- subset(DT, select=c(IND1, IND2, IND3, IND4, IND5))
cor(COR_T, method="pearson")
# 2. vif 값구해서 10넘으면 안됨.
#install.packages("car")
library(car)
vif(reg2) 




#=============================171222=========================================
#install.packages("lm.beta")

summary(reg1)
lm.beta(reg1)

fitted(reg1)
residuals(reg1)
confint(reg1)
predict(reg1)
head(predict(reg1, interval="confidence"))
head(predict(reg1, interval="prediction"))
anova(reg1)

#=============================171223=========================================
attach(DT)
DT$G_DM[Gender==1] <- 1
DT$G_DM[Gender==2] <- 0


reg1 <- lm(DP1~IND1+IND2+IND3+IND4+IND5+G_DM, data=DT)
summary(reg1)
coef(reg1)
lm.beta(reg1)

reg2 <- lm(DP2~IND1+IND2+IND3+IND4+IND5+G_DM, data=DT)
summary(reg2)
coef(reg2)
lm.beta(reg2)

reg3 <- lm(DP3~IND1+IND2+IND3+IND4+IND5+G_DM, data=DT)
summary(reg3)
coef(reg3)
lm.beta(reg3)


DT$sen_DM1 <- ifelse(sen_G==1, 1, 0)
DT$sen_DM2 <- ifelse(sen_G==2, 1, 0)
DT$sen_DM3 <- ifelse(sen_G==3, 1, 0)

table(DT$sen_G)
table(DT$sen_DM1)
table(DT$sen_DM2)
table(DT$sen_DM3)

reg2 <- lm(DP2~IND1+IND2+IND3+IND4+IND5+G_DM+sen_DM1+sen_DM2+sen_DM3, data=DT)
summary(reg2)
coef(reg2)

reg4 <- lm(DP4~IND1+IND2+IND3+IND4+IND5+G_DM+sen_DM1+sen_DM2+sen_DM3, data=DT)
summary(reg4)
##sen_DM1,2,3은 값 자체로 해석하지 않고 sen이 커질때/작아질때 비교해서 해석한다.
coef(reg4)


##############################################################################################
## 사회적 수준                                                                              ##
## - 교육수준 1. 무학 2. 초등 2.중등 3.고등 4.전문대 5.대학 6.석사 7.박사                   ##
##                0        6     9      12     14       16    19      22  로 점수를 메긴다. ##
## - 소득                                                                                   ##
## - 월소득(재산)                                                                           ##
## - 직업                                                                                   ##
##############################################################################################

boxplot(DP3 ~ sen_G, data=DT, notch=TRUE)
