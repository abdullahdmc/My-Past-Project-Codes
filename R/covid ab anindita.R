library(foreign)
ab <- read.spss(file.choose(), to.data.frame=TRUE)
attach(ab)

summary(age)
by(data = ab_0, INDICES = base_posi, FUN =summary)
by(data = ab_1, INDICES = base_posi, FUN =summary)
by(data = ab_2, INDICES = base_posi, FUN =summary)

library(ggplot2)

p<- ggplot(ab, aes(x=base_posi, color=base_posi)) +
  geom_boxplot(y=(y=ab_0)) +
  geom_boxplot(y=(y=ab_1)) +
  geom_boxplot(y=(y=ab_2)) 

p

#Trying 3 separate boxplots at one graph

df1 <- data.frame(x=base_posi, y=ab_0, type="pre-vaccine")
df2 <- data.frame(x=base_posi, y=ab_1, type="after first dose")
df3 <- data.frame(x=base_posi, y=ab_2, type="after second dose")

df<- rbind(df1,df2,df3)

p <- ggplot(df, aes())+geom_boxplot(aes(x,y,colour=type))

p 

#Its not working, i need binning along x
x <- ab$base_posi
y1 <- ab$ab_0
y2 <- ab$ab_1
y3 <- ab$ab_2

hf <-as.data.frame(cbind(x,y1,y2,y3))

hfmelt <- melt(hf, measure.vars=2:4)

hfmelt$bin <-hfmelt$x


p <- ggplot(hfmelt, aes(x=factor(round_any(x,0.5)), y=value, fill=variable))+
  geom_boxplot(outlier.shape = NA)+
  facet_grid(.~variable, scales="free")+
  labs(x="X (binned)")+
  theme(axis.text.x=element_blank())

p <- p + geom_jitter(aes(), shape=16, position=position_jitter(0.4))

p

#using graph fil

library(foreign)
library(ggplot2)
library(dplyr)
library(reshape)

g <- read.spss(file.choose(), to.data.frame = TRUE)

attach(g)

p <- ggplot (g, aes(covid, ab, color=covid), x=covid, y=ab, fill=level)+
  geom_boxplot(lwd=1.2, outlier.shape=NA, notch= TRUE)+
  facet_grid(.~level, scales="free")+
  labs (x= NULL, y= "Optical Density Ratio")
theme(axis.text.x=element_blank())


p <- p + geom_jitter (aes(), shape=16, position=position_jitter(0.30))

p <- p + theme_minimal()

p 





#Trying another method using reshape2, plyr, ggplot2 packeges


dfmelt <- melt(ab, id.vars = id, measure.vars=ab_0:ab_2)



p + geom_jitter(shape=16, position=position_jitter(0.4))


p2 <- ggplot(ab, aes(x=base_posi, y=lab0, color=base_posi)) +
  geom_boxplot(outlier.colour="black", outlier.shape=NA,
               outlier.size=1, notch=FALSE)
p2

p3 <- p2 + geom_jitter(shape=16, position=position_jitter(0.4)
                       
p4 <- p3 +
       theme(
                           panel.background = element_rect(fill = "transparent"), # bg of the panel
                           plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
                           panel.grid.major = element_blank(), # get rid of major grid
                           panel.grid.minor = element_blank(), # get rid of minor grid
                           legend.background = element_rect(fill = "transparent"), # get rid of legend bg
                           legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
                         )
                       ggsave(p4, filename = "tr_tst2.png",  bg = "transparent")
                       
                       p4
                       
                       
#New graph for revised analysis
library(foreign)
library(ggplot2)
library(dplyr)
library(reshape)
                       
g <- read.spss(file.choose(), to.data.frame = TRUE)
attach(g)


png("C:/Users/Sayeed/Dropbox/28. JUNE/1. PI Work/1210. Antibody response post vaccine/5. Result/Images/ab response.png")


p<- ggplot(g, aes(x=level, y=ab, color=level, fill=level))+
  geom_boxplot(alpha=0.3, show.legend=FALSE)+
  labs (x = NULL, y= "Optical Density Ratio")
  theme (axis.text.x=element_blank())
  
p2 <- p + geom_jitter(aes(), width=0.25, size=2,  shape=16, alpha=0.7, show.legend=FALSE)


p3 <- p2 + theme_minimal()

p3

dev.off()
     
                       