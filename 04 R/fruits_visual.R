apple <- c(260, 300, 250, 280, 310)
peach <- c(180, 200, 210, 190, 170)
berry <- c(210, 250, 260, 210, 220)


################### 꺽은선 그래프 ###############################
#' 그리고자 하는 값이 1개면 y축데이터를 의미함.
#' type="o" : overplotted point and line
#' axes = FALSE : 축은 추후에 추가하려고 함.
#' ann = FALSE : 축 이름도 추후에 추가하려고 함.
plot(apple, type="o", col="red", ylim = c(0, 400), axes=FALSE, ann = FALSE)

# x축을 "월, 화, 수~"요일정보를 넣어줌
axis(1, at=1:5, lab=c("월", "화", "수", "목", "금"))

# y축에 범위를 지정해줌
axis(2, ylim=c(0, 400))

# 제목과 축이름을 넣어주자.
title(main="Fruits")
title(xlab="요일")
title(ylab="가격")

#' peach와 berry는 line으로 추가해보자.
lines(peach, type="o", col="blue")
lines(berry, type="o", col="green")

#'범례를 그려 보자.
#'legend(x축위치, y축 위치, 내용, cex=글자크기, col=색상, pch=크기, lty=선모양)
legend(4, 400, c("apple", "peach", "berry"), cex=0.8, col=c("red", "green", "blue"), pch=21)


################### 상자 그래프 (box plot) ###############################
boxplot(apple, peach, berry)

boxplot(apple, peach, berry, horizontal = TRUE)
axis(2, at=1:3, lab=c("apple", "peach", "berry"))

boxplot(apple, peach, berry, horizontal = TRUE, col=c("red","blue", "green"), 
        names=c("apple", "peach", "berry")) # ylab은 y축의 이름(1개 일때) 
################### 파이 그래프 ###############################
pie(apple)
#' pie()의 인수
#' labels : 각 pie 부분의 이름을 지정하는 문자벡터
pie(apple, col=rainbow(length(apple)), labels=c("월", "화", "수", "목", "금"))

# 항목별 수치로 표현하기
f_days <- round(apple/sum(apple)*100, 1) # 비율을 표시하고, round()를 통해 소숫점 1자리를 표현(2자리에서 반올림)
f_labels <- paste(f_days, "%")

pie(apple, main="Apple", col=rainbow(length(apple)), labels=f_labels)
legend("topright", c("월", "화", "수", "목", "금"), cex=0.8, fill=rainbow(length(apple)))

# 항목별 수치와 요일로 표현하기
days_name<- c("월", "화", "수", "목", "금")
f_labels <- paste(days_name, ":", f_days, "%")

pie(apple, main="Apple", col=rainbow(length(apple)), labels=f_labels)
legend("topright", c("월", "화", "수", "목", "금"), cex=0.8, fill=rainbow(length(apple)))


x <- c(1,2,3,4)
paste(x, )
