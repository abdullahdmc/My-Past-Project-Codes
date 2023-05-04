setwd("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/AMR among nursing students/Data")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)


data <-read.spss("kap amr ask long.sav", to.data.frame=TRUE)
attach(data)
class(data)
dim(data)

#violin boxplots

plot1<- ggplot(data, aes(x=kap, y=score, fill=kap))+
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
    geom_text(x=0.50, y=5,label = "7 (7-8)", hjust=0, vjust=0, size=6, aes(fontface=1), angle=90)+
    geom_text(x=1.70, y=10,label = "26 (25-28)", hjust=0, vjust=0, size=6, aes(fontface=1), angle=90)+
    geom_text(x=2.80, y=20,label = "4 (4-5)", hjust=0, vjust=0, size=6, aes(fontface=1), angle=90)

ggsave("kap boxplot.tiff", device="tiff", width=8, height=8, dpi=300)

ggsave("kap boxplot 150dpi.tiff", device="tiff", width=8, height=8, dpi=150)




#Bar chart using wide format data

data <-read_dta("amr data ask.dta")
attach(data)
class(data)
dim(data)


data$k_cat <- factor(data$k_cat,
                       levels = c(0,1),
                       labels = c("Poor", "Good")) 

data$a_cat <- factor(data$a_cat,
                       levels = c(0,1),
                       labels = c("Poor", "Good")) 

data$p_cat <- factor(data$p_cat,
                       levels = c(0,1),
                       labels = c("Poor", "Good")) 


attach(data)

plot_kno <- ggplot(data,  aes(factor(k_cat)))+
    geom_bar(aes(fill=factor(k_cat)), width=0.5, stat="count", show.legend=FALSE)+
    theme_classic2()+    
    theme(
        axis.text.x=element_text(size=16,face="bold", color="black"),
        axis.text.y=element_text(size=16,face="bold"),
        axis.title.x=element_text(size=22,face="bold"),
        axis.title=element_text(size=24,face="bold"),
    )+
    labs(y="Frequency",
         x="Knowledge")

plot_att <- ggplot(data, aes(factor(a_cat)))+
    geom_bar(aes(fill=factor(a_cat)), width=0.4, stat="count", show.legend=FALSE)+
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

plot_prc <- ggplot(data, aes(factor(p_cat)))+
    geom_bar(aes(fill=factor(p_cat)), width=0.4, stat="count", show.legend=FALSE)+
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


