setwd("C:/Users/Sayeed/Dropbox/28. JUNE/1. PI work/1256. HTN health seeking behaviour")

library(foreign)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(reshape)
library(haven)
library(stringr)
library(tidyverse)
library(ggrepel)

#Reading dataset

data <-read.spss("Symptom_HTN_ask symptoms.sav", to.data.frame=TRUE)
attach(data)
class(data)
dim(data)



#Upset plot

library(UpSetR)


plot <-upset(data, sets = c("headache", "diziness", "vertigo", "tinnitus", "blurred_vision", "paresthesia", "neck_pain"), sets.bar.color = "red", main.bar.color="purple",
                            order.by = "freq", empty.intersections = "on", point.size = 3.2, shade.color="blue", 
                            text.scale = 2, number.angle = 0)

plot

help ("upset")