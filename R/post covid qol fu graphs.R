setwd("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID - QoL FU/Data set 12_6_2022")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)


data <-read_dta("PostCovid QoL Basline & FU All data.dta")
attach(data)
class(data)
dim(data)




data$q1 <- ordered(data$q1,
                     levels = c(1,2,3,4,5),
                     labels = c("Very poor", "Poor", "Neither poor nor good", "Good", "Very good")) 

data$q2 <- ordered(data$q2,
                   levels = c(1,2,3,4,5),
                   labels = c("Very dissatisfied", "Dissatisfied", "Neither satisfied nor dissatisfied", "Satisfied", "Very satisfied")) 


data$time <- ordered(data$time, levels = c(1,2), 
                        labels = c("1st", "2nd")) 




tiff("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID - QoL FU/Data set 12_6_2022/q1 plot.tiff", width = 800, height = 600, type="windows") 

plot1<- ggplot(data, aes(factor(time), fill=factor(q1)))+
            geom_bar(width=0.5)+
            theme_classic()+
            theme (
                axis.text.x=element_text(size=14,face="bold"),
                axis.text.y=element_text(size=14,face="bold"),
                axis.title=element_text(size=16,face="bold"),
                legend.text = element_text(size = 14, face ="bold"),
                legend.title = element_text(size = 16, face="bold"),
                legend.key.height = unit(1,"cm") 
                )+
           labs(x="Interview", 
                y="Count", 
                fill="How would you rate your\nquality of life?")+
            geom_text(x=1.40, y=2530, label = "p*<0.001", hjust=0, vjust=0, size=4.5, aes(fontface=2))+
            geom_segment(aes(x = 1, y = 2490, xend = 2, yend = 2490), colour="red", size=1)
           
            
        
plot1 

dev.off()


tiff("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID - QoL FU/Data set 12_6_2022/q2 plot.tiff", width = 800, height = 600, type="windows") 

plot2<- ggplot(data, aes(factor(time), fill=factor(q2)))+
    geom_bar(width=0.5)+
    theme_classic()+
    theme (
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        axis.title=element_text(size=16,face="bold"),
        legend.text = element_text(size = 14, face="bold"),
        legend.title = element_text(size = 16, face="bold"),
        legend.key.height = unit(1.2,"cm") 
    )+

    labs(x="Interview", 
         y="Count", 
         fill="How satisfied are you\nwith your health?")+
    geom_text(x=1.40, y=2530, label = "p*<0.001", hjust=0, vjust=0, size=4.5, aes(fontface=2))+
    geom_segment(aes(x = 1, y = 2490, xend = 2, yend = 2490), colour="red", size=1)

plot2 

dev.off()

#Combined plot

plot3<- ggplot(data, aes(factor(time), fill=factor(q1)))+
    geom_bar(width=0.5)+
    theme_classic()+
    theme (
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        axis.title=element_text(size=16,face="bold"),
        legend.text = element_text(size = 12, face ="bold"),
        legend.title = element_text(size = 12, face="bold"),
        legend.key.height = unit(1,"cm") 
    )+
    labs(x="Interview", 
         y="Count", 
         fill="How would you rate your\nquality of life?")+
    geom_text(x=1.40, y=2530, label = "p*<0.001", hjust=0, vjust=0, size=4.5, aes(fontface=2))+
    geom_segment(aes(x = 1, y = 2490, xend = 2, yend = 2490), colour="red", size=1)

plot4<- ggplot(data, aes(factor(time), fill=factor(q2)))+
    geom_bar(width=0.5)+
    theme_classic()+
    theme (
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        axis.title=element_text(size=16,face="bold"),
        legend.text = element_text(size = 12, face="bold"),
        legend.title = element_text(size = 12, face="bold"),
        legend.key.height = unit(1.2,"cm") 
    )+
    
    labs(x="Interview", 
         y="Count", 
         fill="How satisfied are you\nwith your health?")+
    geom_text(x=1.40, y=2530, label = "p*<0.001", hjust=0, vjust=0, size=4.5, aes(fontface=2))+
    geom_segment(aes(x = 1, y = 2490, xend = 2, yend = 2490), colour="red", size=1)





tiff("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID - QoL FU/Data set 12_6_2022/q1 q2 combined plot.tiff", width = 1200, height = 600, type="windows")

figure <- ggarrange(plot3, plot4,
                    labels = c("A", "B"),
                    ncol = 2, nrow = 1)
figure

dev.off()


setwd("C:/Users/Sayeed/OneDrive/Documents")



data1<- read_dta("PostCovid QoL Basline & FU All data wide form.dta")
attach(data1)
mcnemar.test(q11,q12)
mcnemar.test(q21,q22)


