library(readxl)
library(dplyr)
cust <- read_excel(path="./Data/cust_small.xlsx")
## cust 필드 설명
### CUST_ID : 고객번호 
### SEX : 성별 - 성별 1은 '남성' 2는 '여성'
### AGE : 나이
cntt <- read_excel(path="./Data/cntt_small.xlsx")
## cntt 필드 설명
### POLY_NO : 증권번호 
### CUST_ID : 고객번호
### GOOD_CLSF_CDNM : 가입한 보험의 종

#### cust 데이터에 cntt 데이터를 합친다. 
ins <- merge(cust, cntt)
m.data <- merge(cust, cntt)
head(ins)

#### 성별에 대한 고객의 비율은 어떠한가? 위에서 합친 데이터로 산출 하여라.
(sex_prob <- ins %>% group_by(CUST_ID, SEX) %>% summarize(N=n()))
sex_prob
(per_sex <- tapply(sex_prob$CUST_ID, sex_prob$SEX, length))
per_sex
(per_sex[1]/sum(per_sex)) * 100 # 43%
(per_sex[2]/sum(per_sex)) * 100 # 56%

#### GOOD_CLSF_CDNM별로 가입한 사람의 수는? + 가장 많이 가입한 보험은?
ins %>% group_by(GOOD_CLSF_CDNM) %>% summarise(num=n()) %>% arrange(desc(GOOD_CLSF_CDNM))

#### 각 고객별로 몇개의 보험에 가입했는가? + 가장 많이 가입한 사람은?
ins_num <- ins %>% group_by(CUST_ID) %>% summarise(num=n()) %>% arrange(desc(num))
ins_num

#### 50개이상의 보험에 가입한 고객들은 어떤 보험(GOOD_CLSF_CDNM)을 많이 들었을까?
ins_more_50_ind <- data.frame(ins_num %>% filter(num>=50))[,1]
ins_more_50 <- filter(ins, CUST_ID %in% ins_more_50_ind)
group_by(ins_more_50, GOOD_CLSF_CDNM) %>%
      summarise(num=n()) %>%
      arrange(desc(num))

#### 50개이상의 보험에 가입한 고객들의 남/녀 비율은 어떠한가?
group_by(ins_more_50, SEX) %>% summarise(rate=round(n()/nrow(ins_more_50)*100))


ins_more_50$value <- 1
head(ins_more_50)
(m.ins <- cast(ins_more_50, CUST_ID ~ GOOD_CLSF_CDNM, sum))
