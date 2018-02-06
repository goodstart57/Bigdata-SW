library(reshape)
library(dplyr)

load("./Data/bseller.RData")
load("./Data/newsam.RData")

head(bseller)
head(newsam)
#'다음은 데이터 설명입니다.
#'
#'
#' 1. 데이터는 크게 두가지입니다. 종로서적의 2014년 도서구입데이터(15만개)와 
#'    네이버 책에서 크롤링을 한 주간 베스트셀러 1위부터 150위까지의 데이터입니다.
#'    시간적인 범위로는 2014년 1월 1일부터 2014년 12월 31일까지입니다.
#'    
#' 2. 종로서적의 도서판매데이터는 다음과 같이 구성되어 있습니다.
#'    1) order : 주문(order), 취소(cancel), 환불 (refund)
unique(newsam$order)
summary(as.factor(newsam$order))

#'    2) custID : 고객번호
#'    3) bname : 책제목
#'    4) isbn : 책 고유번호 (ISBN 넘버)
#'    5) category : 책의 쟝르
#'    6) quantity : 구매수량 (취소 환불의 경우는 -의 정수로 표시됨)
#'    7) date : 구매일자
#'    
#' 3. 네비어 책의 주간 베스트셀러 150데이터는 다음과 같이 구성되어 있습니다.
#'    아래 subgroup이하의 쟝르 구분은 없는 경우도 있어서, 없는 경우는 상위쟝르를 하위 쟝르에서 그대로
#'    내려받는 것으로 정리가 되어있습니다.
#'    
#'    1) year : 연도 (2014년)
#'    2) month : 월 (1~12)
#'    3) week : 주 (1은 해당월의 첫번째 주라는 의미임.)
#'    4) Name : 베스트셀러 책 제목
#'    5) isbn : 책 고유번호(ISBN 넘버)
#'    6) reviewer : 해당책에대하어 네이버책에 서평을 올린 사람들의 수
#'    7) point : 리뷰어 들이 남긴 평점의 평균치
#'    8) group : 네이버책에서 분류한 책의 소속 쟝르(대분류)
#'    9) subgroup : 네이버책에서 분류한 책의 소속 쟝르(중분류) 
#'    10) sub2group : 네이버책에서 분류한 책의 소속 쟝르(세분류)
#'    11) sub3group : 네이버책에서 분류한 책의 소속 쟝르(세세분류)
#'    12) wrank : 해당주에 해당책의 베스트셀러 순위
    


#' 1) 종로서적에서 도서판매(order)가 가장 많은 달은 언제인가요?
library(tidyr)
tmp <- newsam %>% separate(date, c("year", "month", "day"), sep="-")
tmp %>% group_by(month) %>% summarise(N=n()) %>% arrange(desc(N))

datelt <- as.POSIXlt(as.Date(newsam$date), format="%Y-%m-%d")
tmp <- newsam %>% mutate(m=datelt$mon+1)
tmp %>% group_by(m) %>% summarise(N=n()) %>% arrange(desc(N))

#' 2) 종로 서적 데이터는 취소와 환불데이터가 같이 존재합니다.
#'    취소와 환불을 포함하여 10권이상인 고객은 몇명인가요?
#'    힌트- group_by와 cast, abs함수를 적절히 활용하시면 쉽게 구하실 수 있으실 것입니다.
#'          cast사용시, value옵션을 확인하여 적용하세요.

orderq <- newsam %>% group_by(custID, order) %>% summarise(value=sum(quantity))
use <- cast(orderq, custID~order, fill=0)
use %>% mutate(sum=cancel+refund) %>% filter(sum<=-10) %>% summarise(num_more_10=n())


##############
head(newsam, 100) %>% View()
temp = newsam %>% group_by(custID, order) %>% summarize(tq = sum(quantity))
temp_c = cast(temp, custID~order, value="tq", fill = 0)
head(temp_c)
temp_c$total_cr = temp_c$cancel + temp_c$refund
head(temp_c)
dim( temp_c[temp_c$total_cr <= -10,    ] )


#' 3) 종로 서적의 전체 주문(order)중에 베스트셀러의 비중은 몇 % 인가요?
#'    베스트셀러와 종로서적을 합쳐야 하는데, (merge()를 사용하시고, 합칠때 사용하는 key는 isbn이 되면 됩니다.)
#'    베스트셀러 데이터는 "isbn, group, subgroup, sub2group, sub3group" 데이터가 반드시 존재하게 해주세요.
#'
jsales <- merge(newsam, bseller, by.x="isbn", all.x=TRUE)
nrow(jsales[!is.na(jsales$wrank),])/nrow(jsales)

###########################

uniq_bseller = bseller %>% group_by(isbn, group, subgroup, sub2group, sub3group) %>%
  summarize(N=n())
dim(uniq_bseller)
m = merge(newsam, uniq_bseller, all.x = T)
dim(m)
m2 = m[m$order == "order", ]
m_bestseller = m2[!is.na(m2$group), ]
dim(m_bestseller)[1] # 25279
(dim(m_bestseller)[1] / dim(m2)[1] ) * 100

#' 4) 위의 3번문제를 해결하기 위해 두 데이터를 조인하셨을 겁니다. 
#'    베스트셀러가 아닌 부분은 조인이 이루어지지 못한 부분은 NA처리가 되었을 것입니다. 
#'    조인된 결과데이터에서 group, subgroup, sub2group, sub3group이 NA처리가 되어 있다면, 종로서적 도서판매데이터의 category로 대체해주세요.
#'    
#'    is.na() 함수를 활용하시고, which 함수를 활용하시면 상대적으로 쉽게 마무리하실 수 있습니다.
#'    
jsales[is.na(jsales$subgroup), "subgroup"] = jsales[is.na(jsales$subgroup), "category"]
jsales[is.na(jsales$sub2group), "sub2group"] = jsales[is.na(jsales$sub2group), "category"]
jsales[is.na(jsales$sub3group), "sub3group"] = jsales[is.na(jsales$sub3group), "category"]

head(jsales)



m = merge(newsam, uniq_bseller, all.x = T)
m[ is.na(m$group), c("group", "subgroup", "sub2group", "sub3group")] <- m[  is.na(m$group), "category"]
View(m)



anscombe <- read.csv("./Data/anscombe.csv")
apply(anscombe, 2, mean)
apply(anscombe, 2, var)

par(mfrow=c(2,2))
plot(anscombe$Ax, anscombe$Ay)
plot(anscombe$Bx, anscombe$By)
plot(anscombe$Cx, anscombe$Cy)
plot(anscombe$Dx, anscombe$Dy)


##install.packages("psych")

library(psych)
pairs(iris)
pairs.panels(iris)
