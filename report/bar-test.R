library(ggplot2)

df <- data.frame(time = factor(c("Bro","Dinner"), levels=c("Lunch","Dinner")),
                 total_bill = c(14.89, 17.23))

ggplot(data=df, aes(x=time, y=total_bill)) + geom_bar(stat="identity")