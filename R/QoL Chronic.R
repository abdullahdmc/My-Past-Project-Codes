library(foreign)
p <- read.spss(file.choose(), to.data.frame = TRUE)
attach(p)




##ridge Plots
install.packages("ggridges")

library(ggplot2)
library(tidyverse)
library(gridExtra)
library(ggridges)

#Barplots
ggplot(p, aes(x=cat_chronic3, y=QoL1))+
  geom_bar(stat = "identity")+
  theme(
    legend.position="none",
    axis.text.x=element_text(size=12,face="bold"),
    axis.text.y=element_text(size=12,face="bold"))+
  xlab("How would you rate your quality of life?")+
  ylab("Number of chronic diseases")


#Ridge plots
#physical by chronic
png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/phy by chr3.png", width = 800, height = 600, type="windows")
g <-ggplot(p, aes(y=cat_chronic3, x=phy, fill=cat_chronic3))+
  geom_density_ridges(alpha=0.6, bandwidth=4)+
  theme_classic() + 
  theme (
      legend.position = "none",
      panel.spacing = unit(0.1, "lines"),
      axis.text.x=element_text(size=14,face="bold"),
      axis.text.y=element_text(size=14,face="bold"),
      axis.title=element_text(size=16,face="bold")
    ) +
  xlab ("Physical Domain Score") +
  ylab ("Number of Chronic Disease") 

g
dev.off()

#psychological by chronic
png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/psy by chr3.png", width = 800, height = 600, type="windows")
g <-ggplot(p, aes(y=cat_chronic3, x=psy, fill=cat_chronic3))+
  geom_density_ridges(alpha=0.6, bandwidth=4)+
  theme_classic() + 
  theme (
    legend.position = "none",
    panel.spacing = unit(0.1, "lines"),
    axis.text.x=element_text(size=14,face="bold"),
    axis.text.y=element_text(size=14,face="bold"),
    axis.title=element_text(size=16,face="bold")
  ) +
  xlab ("Psychological Domain Score") +
  ylab ("Number of Chronic Disease") 

g
dev.off()

#social by chronic
png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/soci by chr3.png", width = 800, height = 600, type="windows")
g <-ggplot(p, aes(y=cat_chronic3, x=soci, fill=cat_chronic3))+
  geom_density_ridges(alpha=0.6, bandwidth=4)+
  theme_classic() + 
  theme (
    legend.position = "none",
    panel.spacing = unit(0.1, "lines"),
    axis.text.x=element_text(size=14,face="bold"),
    axis.text.y=element_text(size=14,face="bold"),
    axis.title=element_text(size=16,face="bold")
  ) +
  xlab ("Social Domain Score") +
  ylab ("Number of Chronic Disease") 

g
dev.off()

#environmental by chronic
png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/envi by chr3.png", width = 800, height = 600, type="windows")
g <-ggplot(p, aes(y=cat_chronic3, x=envi, fill=cat_chronic3))+
  geom_density_ridges(alpha=0.6, bandwidth=4)+
  theme_classic() + 
  theme (
    legend.position = "none",
    panel.spacing = unit(0.1, "lines"),
    axis.text.x=element_text(size=14,face="bold"),
    axis.text.y=element_text(size=14,face="bold"),
    axis.title=element_text(size=16,face="bold")
  ) +
  xlab ("Environmental Domain Score") +
  ylab ("Number of Chronic Disease") 

g
dev.off()


#Upset plot

library(UpSetR)

png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/upset_plot2.png", width = 1000, height = 600, type="windows")

ncdplot <-upset(p, sets = c("HTN", "DM", "IHD", "BA", "CKD", "Cancer"), sets.bar.color = "red", main.bar.color="purple",
      order.by = "freq", empty.intersections = "on", point.size = 3.2, shade.color="blue", text.scale = 2, number.angle = 0)


ncdplot

dev.off()

tiff("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/upset_plot2.tiff", width = 1000, height = 600, type="windows")

ncdplot <-upset(p, sets = c("HTN", "DM", "IHD", "BA", "CKD", "Cancer"), sets.bar.color = "red", main.bar.color="purple",
                order.by = "freq", empty.intersections = "on", point.size = 3.2, shade.color="blue", text.scale = 2, number.angle = 0)


ncdplot

dev.off()

help ("upset")


#Boxplot
b <- read.spss(file.choose(), to.data.frame= TRUE )
attach (b)

#Boxplot phy 
png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/phy by ncd boxplot.png", width = 800, height = 420, type="windows")

g<- ggplot(b, aes(y=phy,x=stat, fill=ncd2))+
    geom_boxplot(alpha=0.6)+
    facet_wrap(~ncd2, ncol=6)+
    theme (
        legend.position = "none",
        panel.spacing = unit(0.1, "lines"),
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        strip.text.x = element_text(size = 14, face="bold"),
        axis.title=element_text(size=16,face="bold")
    ) +
    xlab ("Chronic Diseases") +
    ylab ("Physical Domain Score")

g
    
dev.off()

#Boxplot psy

png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/psy by ncd boxplot.png", width = 800, height = 400, type="windows")

g<- ggplot(b, aes(y=psy,x=stat, fill=ncd2))+
    geom_boxplot(alpha=0.6)+
    facet_wrap(~ncd2, ncol=6)+
    theme (
        legend.position = "none",
        panel.spacing = unit(0.1, "lines"),
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        strip.text.x = element_text(size = 14, face="bold"),
        axis.title=element_text(size=16,face="bold")
    ) +
    xlab ("Chronic Diseases") +
    ylab ("Psychological Domain Score")

g

dev.off()

#Boxplot soci

png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/soci by ncd boxplot.png", width = 800, height = 400, type="windows")

g<- ggplot(b, aes(y=soci,x=stat, fill=ncd2))+
    geom_boxplot(alpha=0.6)+
    facet_wrap(~ncd2, ncol=6)+
    theme (
        legend.position = "none",
        panel.spacing = unit(0.1, "lines"),
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        strip.text.x = element_text(size = 14, face="bold"),
        axis.title=element_text(size=16,face="bold")
    ) +
    xlab ("Chronic Diseases") +
    ylab ("Social Domain Score")

g

dev.off()

#Boxplot psy

png("C:/Users/Sayeed/Dropbox/previous less used file/Folder S/NSU researches/Post COVID- QoL/PostCovQoL QoL chronic disease/envi by ncd boxplot.png", width = 800, height = 400, type="windows")

g<- ggplot(b, aes(y=envi, x=stat, fill=ncd2))+
    geom_boxplot(alpha=0.6)+
    facet_wrap(~ncd2, ncol=6)+
    theme (
        legend.position = "none",
        panel.spacing = unit(0.1, "lines"),
        axis.text.x=element_text(size=14,face="bold"),
        axis.text.y=element_text(size=14,face="bold"),
        strip.text.x = element_text(size = 14, face="bold"),
        axis.title=element_text(size=16,face="bold")
    ) +
    xlab ("Chronic Diseases") +
    ylab ("Environmental Domain Score")

g

dev.off()