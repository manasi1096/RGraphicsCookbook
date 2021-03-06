library(gcookbook)
ggplot(pg_mean,aes(x=group,y=weight))+geom_bar(stat="identity")
ggplot(BOD,aes(x=factor(Time),y=demand))+geom_bar(stat="identity")
ggplot(pg_mean,aes(x=group,y=weight))+
  geom_bar(stat="identity",fill="lightblue",colour="black")
ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar))+
  geom_bar(stat="identity",position="dodge")+
  scale_fill_brewer(palette="Pastel1")
ce=cabbage_exp[1:5,]
ggplot(ce,aes(x=Date,y=Weight,fill=Cultivar))+
  geom_bar(stat="identity",position="dodge")+
  scale_fill_brewer(palette="Pastel1")
#Making a bar graphs of counts
ggplot(diamonds,aes(x=carat))+geom_bar()
#Using colors in bar graphs
upc=subset(uspopchange,rank(Change)>40)
ggplot(upc,aes(x=Abb,y=Change),fill="region")+
  geom_bar(stat="identity")+
  scale_fill_brewer(palette="Pastel1")

ggplot(upc, aes(x=Abb, y=Change, fill=Region)) +
  geom_bar(stat="identity", colour="black") +
  scale_fill_manual(values=c("#669933", "#FFCC66")) 

ggplot(upc, aes(x=reorder(Abb,Change), y=Change,fill=Region)) +
  geom_bar(stat="identity", colour="black") +
  scale_fill_manual(values=c("#669933", "#FFCC66"))

#Coloring negative and positive bars differently

csub <- subset(climate, Source=="Berkeley" & Year >= 1900) 

csub$pos <- csub$Anomaly10y >= 0

ggplot(csub,aes(x=Year,y=Anomaly10y,fill=pos))+
  geom_bar(stat="identity",position="identity",color="black",size=0.10)+
  scale_fill_manual(values=c("#CCEEFF","#FFDDDD"),guide=F)

#Adjusting Bar width & Spacing

ggplot(pg_mean,aes(x=group,y=weight))+
  geom_bar(stat="identity",width=0.5,position=position_dodge(0.2))

#Making a stacked bar graph
ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar,order=desc(Cultivar)))+
  geom_bar(stat="identity")+
  guides(fill=guide_legend(reverse=TRUE))

#Making propotional bars
head(cabbage_exp)
ce=ddply(cabbage_exp,"Date",transform,
         percent_weight=Weight/sum(Weight)*100)

#Adding text labels


ggplot(ce,aes(x=Date,y=percent_weight,fill=Cultivar),order=desc(Cultivar))+
  geom_bar(stat="identity")+
  scale_fill_brewer(palette = "Pastel2")+
  geom_text(aes(label=Weight),vjust=1.5,color="white")

#Adjusting y limits to be higher depending on Weight
ggplot(ce,aes(x=interaction(Date,Cultivar),y=Weight))+
  geom_bar(stat="identity")+
  scale_fill_brewer(palette = "Pastel2")+
  geom_text(aes(label=Weight),vjust=-0.2,color="white")+
  ylim(0,max(cabbage_exp$Weight)*1.5)

#Auto adjust range regardless of y range

ggplot(ce,aes(x=interaction(Date,Cultivar),y=Weight,fill=Cultivar))+
  geom_bar(stat="identity",position = "dodge")+
  scale_fill_brewer(palette = "Pastel2")+
  geom_text(aes(y=Weight+0.4,label=Weight),vjust=-0.1,color="blue")

