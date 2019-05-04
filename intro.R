library(ggplot2)
library(gcookbook)
#Chapter 2 creating scatterplot
ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+geom_point()
#Creating line graph
plot(pressure$temperature,pressure$pressure,data=pressure,type="l")
ggplot(pressure,aes(x=temperature,y=pressure))+geom_line()
#Creating a bar graph
ggplot(BOD,aes(x=as.factor(Time),y=demand))+geom_bar(stat="identity")
#Creating a histogram
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 4)
ggplot(ToothGrowth,aes(x=interaction(supp,dose),y=len))+geom_boxplot()
