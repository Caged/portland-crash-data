library(data.table)
library(dplyr)
library(ggplot2)

cyclist_crashes <- read.csv(file="/Users/justin/dev/me/data/crashes/csv/crashes.csv", head = TRUE)


years        <- group_by(cyclist_crashes, crash_yr_no)
months       <- group_by(cyclist_crashes, crash_mo_no)
year_months  <- group_by(cyclist_crashes, crash_yr_no, crash_mo_no)

month_counts <- summarise(months, count = n())
year_counts  <- summarise(years, count = n())
ym_counts    <- summarize(year_months, count = n())

ggplot(ym_counts,aes(x=crash_yr_no,y=count,fill=factor(crash_mo_no))) +
geom_bar(stat="identity",position="dodge")

ggplot(ym_counts,aes(x=crash_mo_no,y=count,fill=factor(crash_mo_no))) +
  geom_bar(stat="identity",position="dodge")