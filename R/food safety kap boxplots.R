setwd("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/Reviews/Delwer Sir/Food safety article")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)


data <-read.spss("Food safety KAP total score long.sav", to.data.frame=TRUE)
attach(data)
class(data)
dim(data)


plot1<- ggplot(data, aes(x=kap, y=score, fill=kap))+
    geom_violin(width=0.9, alpha=0.5, size=0.5,
                 show.legend=FALSE)+
    geom_boxplot(width=0.1, color="black", alpha=0.3, show.legend=FALSE, outlier.alpha=0)+
    theme_classic()+
    theme (
        axis.text.x=element_text(size=22,face="bold", color="black"),
        axis.text.y=element_text(size=16,face="bold"),
        axis.title.x=element_blank(),
        axis.title=element_text(size=24,face="bold"),
        legend.text = element_text(size=27, face ="bold"),
        legend.key.height = unit(1.5,"cm") 
    )+
    labs(y="Score", 
         fill=element_blank())+
    ylim(0,35)+
    geom_text(x=0.50, y=5,label = "7 (2-10)", hjust=0, vjust=0, size=6, aes(fontface=1), angle=90)+
    geom_text(x=1.70, y=10,label = "16 (5-18)", hjust=0, vjust=0, size=6, aes(fontface=1), angle=90)+
    geom_text(x=2.80, y=20,label = "26 (9-30)", hjust=0, vjust=0, size=6, aes(fontface=1), angle=90)
plot1 

ggsave("kap boxplot.tiff", device="tiff", width=8, height=8, dpi=300)

ggsave("kap boxplot 150dpi.tiff", device="tiff", width=8, height=8, dpi=150)




#Bar chart using wide format data

setwd("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/Reviews/Delwer Sir/Food safety article")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)


data <-read_dta("Food safety data sheet KAP categories.dta")
attach(data)
class(data)
dim(data)


data$kno_cat <- factor(data$kno_cat,
                   levels = c(0,1),
                   labels = c("Poor", "Good")) 

data$att_cat <- factor(data$att_cat,
                       levels = c(0,1),
                       labels = c("Poor", "Good")) 

data$prc_cat <- factor(data$prc_cat,
                       levels = c(0,1),
                       labels = c("Poor", "Good")) 


attach(data)

plot_kno <- ggplot(data, aes(factor(kno_cat)))+
         geom_bar(aes(fill=factor(kno_cat)), width=0.5, stat="count", show.legend=FALSE)+
    theme_classic2()+    
    theme(
        axis.text.x=element_text(size=16,face="bold", color="black"),
        axis.text.y=element_text(size=16,face="bold"),
        axis.title.x=element_text(size=22,face="bold"),
        axis.title=element_text(size=24,face="bold"),
        )+
        labs(y="Frequency",
            x="Knowledge")
         
plot_att <- ggplot(data, aes(factor(att_cat)))+
    geom_bar(aes(fill=factor(att_cat)), width=0.4, stat="count", show.legend=FALSE)+
    theme_classic2()+
    theme(
        axis.text.x=element_text(size=16,face="bold", color="black"),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x=element_text(size=22,face="bold"),
        axis.title.y=element_blank(),
        axis.title=element_text(size=24,face="bold"),
    )+
    labs(y="Frequency",
        x="Attitude") 

plot_prc <- ggplot(data, aes(factor(prc_cat)))+
    geom_bar(aes(fill=factor(prc_cat)), width=0.4, stat="count", show.legend=FALSE)+
    theme_classic2()+
    theme(
        axis.text.x=element_text(size=16,face="bold", color="black"),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x=element_text(size=22,face="bold"),
        axis.title.y=element_blank(),
        axis.title=element_text(size=24,face="bold"),
    )+
    labs(y="Frequency",
         x="Practice")

figure <- ggarrange(plot_kno, plot_att, plot_prc,
                    labels = c("A", "B", "C"),
                    ncol = 3, nrow = 1)
figure

ggsave("kap barplot.tiff", device="tiff", width=8, height=8, dpi=300)



setwd("C:/Users/Sayeed/OneDrive/Documents")


#Barchart using long format data


setwd("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/Reviews/Delwer Sir/Food safety article")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)


data <-read_dta("Food safety data sheet KAP categories long.dta")
attach(data)
class(data)
dim(data)


data$kap <- factor(data$kap,
                       levels = c(1,2,3),
                       labels = c("Knolwedge", "Attitude", "Practice")) 

data$cat <- factor(data$cat,
                       levels = c(0,1),
                       labels = c("Poor", "Good")) 

attach(data)


plot <- ggplot(data, aes(kap,fill=cat))+
    geom_bar(width=0.5, stat="count", show.legend=TRUE)+
    theme(
        axis.text.x=element_text(size=16,face="bold", color="black"),
        axis.text.y=element_text(size=10),
        axis.title.x=element_blank(),
        axis.title=element_text(size=16,face="bold"),
        legend.text = element_text(size = 14, face ="bold"),
        legend.title = element_text(size = 16, face="bold"),
        legend.key.height = unit(1,"cm")
    )+
    labs(y="Count",
         fill="Categories")+
        geom_text(x=1, y=20,label = "33.75%", hjust=0, vjust=0, size=5, aes(fontface=1), angle=90)+
        geom_text(x=1, y=210,label = "66.25%", hjust=0, vjust=0, size=5, aes(fontface=1), angle=90)+
        geom_text(x=2, y=150,label = "80.25%", hjust=0, vjust=0, size=5, aes(fontface=1), angle=90)+
        geom_text(x=2, y=335,label = "19.75%", hjust=0, vjust=0, size=5, aes(fontface=1), angle=90)+
        geom_text(x=3, y=130,label = "69.00%", hjust=0, vjust=0, size=5, aes(fontface=1), angle=90)+
        geom_text(x=3, y=310,label = "31.00%", hjust=0, vjust=0, size=5, aes(fontface=1), angle=90)


ggsave("kap barplot.tiff", device="tiff", width=8, height=8, dpi=300)

ggsave("kap barplot 150dpi.tiff", device="tiff", width=8, height=8, dpi=150)

setwd("C:/Users/Sayeed/OneDrive/Documents")


