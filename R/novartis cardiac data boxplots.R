setwd("G:/Shared drives/1000136702/Reviews/Novartis project pi")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)


data <-read.spss("novartin pi data wide for analysis v6 (2 fups) 09.12.2022.sav", to.data.frame=TRUE)
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