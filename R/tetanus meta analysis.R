library(foreign)
p <- read.spss(file.choose(), to.data.frame = TRUE)
attach(p)

setwd("C:/Users/Sayeed/Dropbox/28. JUNE/1. PI work/1161. Adult tetanus mortality SR & MA ASK Nonfunded/Data Extraction/Data preparation for meta/Final set for meta")

library(readxl)
library(dmetar)
library(tidyverse)
library(meta)
library(gridtext)
library(grid)

##Age
age <- read_excel("age.xlsx")
attach(age)

m.age <- metabin(event.e = event.e, 
                 n.e = n.e,
                 event.c = event.c,
                 n.c = n.c,
                 studlab = author,
                 data = age,
                 sm = "OR",
                 method = "Peto",
                 fixed = FALSE,
                 random = TRUE,
                 method.tau = "PM",
                 hakn = TRUE,
                 prediction = TRUE,
                 title = "Age ")
summary(m.age)

png("age_forrest.png", width = 800, height = 600, type = "windows")

f.age<- forest.meta(m.age, 
            sortvar = TE,
            predict = TRUE, 
            print.tau2 = TRUE,
            prediction = FALSE,
            col.diamond.fixed= "blue",
            col.diamond.random = "red",
            lab.e = "Age >= 40y",
            lab.c = "Age < 40y",
            )
f.age

g.age<- richtext_grob("Age", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.age)

dev.off()

png("age_funnel.png", width = 800, height = 600, type="windows")

col.contour = c("gray75", "gray85", "gray95")

fun.age <- funnel.meta(m.age,
                       studlab=TRUE,
                       contour = c(0.9,0.95,0.99),
                       col.contour = col.contour)
legend (x=7, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 1,
        y.intersp = 1,
        fill = col.contour)
                      
title ("Age")

fun.age

dev.off()

##-------------------
##Sex
sex <- read_excel("sex.xlsx")
attach(sex)

m.sex <- metabin(event.e = event.e, 
                 n.e = n.e,
                 event.c = event.c,
                 n.c = n.c,
                 studlab = author,
                 data = sex,
                 sm = "OR",
                 method = "Peto",
                 fixed = FALSE,
                 random = TRUE,
                 method.tau = "PM",
                 hakn = TRUE,
                 prediction = TRUE,
                 title = "Sex")
summary(m.sex)

png("sex_forrest.png", width = 800, height = 600, type = "windows")

f.sex<- forest.meta(m.sex, 
                    sortvar = TE,
                    predict = TRUE, 
                    print.tau2 = TRUE,
                    prediction = FALSE,
                    col.diamond.fixed= "blue",
                    col.diamond.random = "red",
                    lab.e = "Male",
                    lab.c = "Female",
                    
)

f.sex

g.sex<- richtext_grob("Sex", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.sex)

dev.off()


png("sex_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.sex <- funnel.meta(m.sex,
                       studlab=TRUE,
                       contour = c(0.9,0.95,0.99),
                       col.contour = col.contour)
legend (x=3, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Sex")

fun.sex

dev.off()


##-------------------------
##Residence
residence <- read_excel("residence.xlsx")
attach(residence)

m.residence <- metabin(event.e = event.e, 
                 n.e = n.e,
                 event.c = event.c,
                 n.c = n.c,
                 studlab = author,
                 data = residence,
                 sm = "OR",
                 method = "Peto",
                 fixed = FALSE,
                 random = TRUE,
                 method.tau = "PM",
                 hakn = TRUE,
                 prediction = TRUE,
                 title = "Residence")
summary(m.residence)

png("residence_forrest.png", width = 800, height = 600, type = "windows")

f.residence<- forest.meta(m.residence, 
                    sortvar = TE,
                    predict = TRUE, 
                    print.tau2 = TRUE,
                    prediction = FALSE,
                    col.diamond.fixed= "blue",
                    col.diamond.random = "red",
                    lab.e = "Rural",
                    lab.c = "Urban",
                    
)

f.residence

g.residence<- richtext_grob("Residence", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.residence)

dev.off()


png("residence_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.residence <- funnel.meta(m.residence,
                       studlab=TRUE,
                       contour = c(0.9,0.95,0.99),
                       col.contour = col.contour)
legend (x=1.8, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Residence")

fun.residence

dev.off()


##----------------
##Immunization history

vaccination <-read_excel("immunization_history.xlsx")
attach(vaccination)

m.vaccination <- metabin(event.e = event.e, 
                       n.e = n.e,
                       event.c = event.c,
                       n.c = n.c,
                       studlab = author,
                       data = vaccination,
                       sm = "OR",
                       method = "Peto",
                       fixed = FALSE,
                       random = TRUE,
                       method.tau = "PM",
                       hakn = TRUE,
                       prediction = TRUE,
                       title = "Vaccination")
summary(m.vaccination)

png("vaccination_forrest.png", width = 800, height = 600, type = "windows")

f.vaccination<- forest.meta(m.vaccination, 
                          sortvar = TE,
                          predict = TRUE, 
                          print.tau2 = TRUE,
                          prediction = FALSE,
                          colgap.forest.right = "10mm",
                          col.diamond.fixed= "blue",
                          col.diamond.random = "red",
                          lab.e = "Unvaccinated",
                          lab.c = "Vaccinated",
                          
)

f.vaccination

g.vaccination<- richtext_grob("Vaccination", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.vaccination)

dev.off()


png("vaccination_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.vaccination <- funnel.meta(m.vaccination,
                             studlab=TRUE,
                             contour = c(0.9,0.95,0.99),
                             col.contour = col.contour)
legend (x=8, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Vaccination")

fun.vaccination

dev.off()



## Post exposure prophylaxis
pep <- read_excel ("tetanus_prophylaxis.xlsx")
attach(pep)

m.pep <- metabin(event.e = event.e, 
                         n.e = n.e,
                         event.c = event.c,
                         n.c = n.c,
                         studlab = author,
                         data = pep,
                         sm = "OR",
                         method = "Peto",
                         fixed = FALSE,
                         random = TRUE,
                         method.tau = "PM",
                         hakn = TRUE,
                         prediction = TRUE,
                         title = "Post-expsoure Prophylaxis")
summary(m.pep)

png("pep_forrest.png", width = 800, height = 600, type = "windows")

f.pep <- forest.meta(m.pep, 
                             sortvar = TE,
                             predict = TRUE, 
                             print.tau2 = TRUE,
                             prediction = FALSE,
                             col.diamond.fixed= "blue",
                             col.diamond.random = "red",
                             lab.e = "No PEP",
                             lab.c = "PEP",
                             
)

f.pep

g.pep<- richtext_grob("Post-exposure prophylaxis", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.pep)

dev.off()


png("pep_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.pep <- funnel.meta(m.pep,
                             studlab=TRUE,
                             contour = c(0.9,0.95,0.99),
                             col.contour = col.contour)
legend (x=18, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Post-exposure prophylaxis")

fun.pep

dev.off()

##----------------------

##Incubation period
ip <- read_excel ("incubation_period.xlsx")
attach(ip)


m.ip <- metabin(event.e = event.e, 
                 n.e = n.e,
                 event.c = event.c,
                 n.c = n.c,
                 studlab = author,
                 data = ip,
                 sm = "OR",
                 method = "Peto",
                 fixed = FALSE,
                 random = TRUE,
                 method.tau = "PM",
                 hakn = TRUE,
                 prediction = TRUE,
                 title = "Incubation Period")
summary(m.ip)

png("ip_forrest.png", width = 800, height = 600, type = "windows")

f.ip <- forest.meta(m.ip, 
                     sortvar = TE,
                     predict = TRUE, 
                     print.tau2 = TRUE,
                     prediction = FALSE,
                     col.diamond.fixed= "blue",
                     col.diamond.random = "red",
                     lab.e = "<7days",
                     lab.c = ">=7days",
                     
)


f.ip

g.ip<- richtext_grob("Incubation period", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.ip)

dev.off()


png("ip_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.ip <- funnel.meta(m.ip,
                       studlab=TRUE,
                       contour = c(0.9,0.95,0.99),
                       col.contour = col.contour)
legend (x=7, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Incubation period")

fun.ip

dev.off()

## Onset time 
ot <- read_excel ("onset_time.xlsx")
attach(ot)

m.ot <- metabin(event.e = event.e, 
                n.e = n.e,
                event.c = event.c,
                n.c = n.c,
                studlab = author,
                data = ot,
                sm = "OR",
                method = "Peto",
                fixed = FALSE,
                random = TRUE,
                method.tau = "PM",
                hakn = TRUE,
                prediction = TRUE,
                title = "Onset time")
summary(m.ot)

png("ot_forrest.png", width = 800, height = 600, type = "windows")

f.ot <- forest.meta(m.ot, 
                    sortvar = TE,
                    predict = TRUE, 
                    print.tau2 = TRUE,
                    prediction = FALSE,
                    col.diamond.fixed= "blue",
                    col.diamond.random = "red",
                    lab.e = "< 3days",
                    lab.c = ">= 3days",
                    
)

f.ot

g.ot<- richtext_grob("Onset Time", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.ot)

dev.off()


png("ot_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.ot <- funnel.meta(m.ot,
                      studlab=TRUE,
                      contour = c(0.9,0.95,0.99),
                      col.contour = col.contour)
legend (x=6, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Onset time")

fun.ot

dev.off()

## Onset time (48 hours cut-off)

ot2 <- read_excel("onset_time_b.xlsx")
attach(onset_time_b)

m.ot2 <- metabin(event.e = event.e, 
                n.e = n.e,
                event.c = event.c,
                n.c = n.c,
                studlab = author,
                data = ot2,
                sm = "OR",
                method = "Peto",
                fixed = FALSE,
                random = TRUE,
                method.tau = "PM",
                hakn = TRUE,
                prediction = TRUE,
                title = "Onset time")
summary(m.ot2)

png("ot2_forrest.png", width = 800, height = 600, type = "windows")

f.ot2 <- forest.meta(m.ot2, 
                    sortvar = TE,
                    predict = TRUE, 
                    print.tau2 = TRUE,
                    col.diamond.fixed= "blue",
                    col.diamond.random = "red",
                    lab.e = "<2 days",
                    lab.c = ">=2 days",
                    
)

f.ot2

g.ot2<- richtext_grob("Onset time", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.ot2)

dev.off()


png("ot2_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.ot2 <- funnel.meta(m.ot2,
                      studlab=TRUE,
                      contour = c(0.9,0.95,0.99),
                      col.contour = col.contour)
legend (x=8, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Onset time")

fun.ot2

dev.off()


##co-morbidity
comorb <- read_excel ("comorbidity.xlsx")
attach(comorb)

m.comorb <- metabin(event.e = event.e, 
                  n.e = n.e,
                  event.c = event.c,
                  n.c = n.c,
                  studlab = author,
                  data = comorb,
                  sm = "OR",
                  method = "Peto",
                  fixed = FALSE,
                  random = TRUE,
                  method.tau = "PM",
                  hakn = TRUE,
                  prediction = TRUE,
                  title = "Comorbidity")
summary(m.comorb)

png("comorb_forrest.png", width = 800, height = 600, type = "windows")

f.comorb <- forest.meta(m.comorb, 
                      sortvar = TE,
                      predict = TRUE, 
                      print.tau2 = TRUE,
                      prediction = FALSE,
                      col.diamond.fixed= "blue",
                      col.diamond.random = "red",
                      lab.e = "Present",
                      lab.c = "comorbidity",
                      
)

f.comorb

g.comorb<- richtext_grob("Comorbidity", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.comorb)

dev.off()


png("comorb_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.comorb <- funnel.meta(m.comorb,
                      studlab=TRUE,
                      contour = c(0.9,0.95,0.99),
                      col.contour = col.contour)
legend (x=40, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Comorbidity as a risk factor for tetanus deaths")

fun.comorb

dev.off()


##complications

compl <- read_excel ("complication.xlsx")
attach(compl)

m.compl <- metabin(event.e = event.e, 
                    n.e = n.e,
                    event.c = event.c,
                    n.c = n.c,
                    studlab = author,
                    data = compl,
                    sm = "OR",
                    method = "Peto",
                    fixed = FALSE,
                    random = TRUE,
                    method.tau = "PM",
                    hakn = TRUE,
                    prediction = TRUE,
                    title = "Complication")
summary(m.compl)

png("compl_forrest.png", width = 1000, height = 600, type = "windows")

f.compl <- forest.meta(m.compl, 
                        sortvar = TE,
                        predict = TRUE, 
                        print.tau2 = TRUE,
                        prediction = FALSE,
                        colgap.forest.right = "10mm",
                        col.diamond.fixed = "blue",
                        col.diamond.random = "red",
                        lab.e = "Present",
                        lab.c = "Absent",
                        
)

f.compl

g.compl<- richtext_grob("Complications", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.compl)

dev.off()


png("compl_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.compl <- funnel.meta(m.compl,
                          studlab=TRUE,
                          contour = c(0.9,0.95,0.99),
                          col.contour = col.contour)
legend (x=100, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Complications")

fun.compl

dev.off()

##ventilation
vent <- read_excel ("ventilation.xlsx")
attach(vent)

m.vent <- metabin(event.e = event.e, 
                   n.e = n.e,
                   event.c = event.c,
                   n.c = n.c,
                   studlab = author,
                   data = vent,
                   sm = "OR",
                   method = "Peto",
                   fixed = FALSE,
                   random = TRUE,
                   method.tau = "PM",
                   hakn = TRUE,
                   prediction = TRUE,
                   title = "Ventilation")
summary(m.vent)

png("vent_forrest.png", width = 1000, height = 600, type = "windows")

f.vent <- forest.meta(m.vent, 
                       sortvar = TE,
                       predict = TRUE, 
                       print.tau2 = TRUE,
                       prediction = FALSE,
                       colgap.forest.right = "25mm",
                       col.diamond.fixed= "blue",
                       col.diamond.random = "red",
                       lab.e = "Required",
                       lab.c = "Not required ",
                       
)

f.vent

g.vent<- richtext_grob("Ventilation", 0.55, 0.65, gp=gpar(fontsize=20))
grid.draw(g.vent)

dev.off()


png("vent_funnel.png", width = 1000, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.vent <- funnel.meta(m.vent,
                         studlab=TRUE,
                         contour = c(0.9,0.95,0.99),
                         col.contour = col.contour)
legend (x=8, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Ventilation")

fun.vent

dev.off()

##Dysautonomia

dysauto<- read_excel("dysautonomia.xlsx")
attach(dysauto)

m.dysauto <- metabin(event.e = event.e, 
                  n.e = n.e,
                  event.c = event.c,
                  n.c = n.c,
                  studlab = author,
                  data = dysauto,
                  sm = "OR",
                  method = "Peto",
                  fixed = FALSE,
                  random = TRUE,
                  method.tau = "PM",
                  hakn = TRUE,
                  prediction = TRUE,
                  title = "Dysautonomia")
summary(m.dysauto)

png("dysauto_forrest.png", width = 800, height = 600, type = "windows")

f.dysauto <- forest.meta(m.dysauto, 
                      sortvar = TE,
                      predict = TRUE, 
                      print.tau2 = TRUE,
                      prediction = FALSE,
                      colgap.forest.right = "10mm",
                      col.diamond.fixed= "blue",
                      col.diamond.random = "red",
                      lab.e = "Present",
                      lab.c = "Absent",
                      
)

f.dysauto

g.dysauto<- richtext_grob("Dysautonomia", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.dysauto)

dev.off()


png("dysauto_funnel.png", width = 1000, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.dysauto <- funnel.meta(m.dysauto,
                        studlab=TRUE,
                        contour = c(0.9,0.95,0.99),
                        col.contour = col.contour)
legend (x=10, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Dysautonomia")

fun.dysauto

dev.off()

##Severity

severity<- read_excel("Disease severity.xlsx")
attach(severity)

m.severity <- metabin(event.e = event.e, 
                     n.e = n.e,
                     event.c = event.c,
                     n.c = n.c,
                     studlab = author,
                     data = severity,
                     sm = "OR",
                     method = "Peto",
                     fixed = FALSE,
                     random = TRUE,
                     method.tau = "PM",
                     hakn = TRUE,
                     prediction = TRUE,
                     title = "Severity")
summary(m.severity)

png("severity_forrest.png", width = 800, height = 600, type = "windows")

f.severity <- forest.meta(m.severity, 
                         sortvar = TE,
                         predict = TRUE, 
                         print.tau2 = TRUE,
                         prediction = FALSE,
                         col.diamond.fixed= "blue",
                         col.diamond.random = "red",
                         lab.e = "Severe",
                         lab.c = "Mild",
                         
)

f.severity

g.severity<- richtext_grob("Disease severity", 0.55, 0.75, gp=gpar(fontsize=20))
grid.draw(g.severity)

dev.off()


png("severity_funnel.png", width = 800, height = 600, type = "windows")

col.contour = c("gray75", "gray85", "gray95")

fun.severity <- funnel.meta(m.severity,
                           studlab=TRUE,
                           contour = c(0.9,0.95,0.99),
                           col.contour = col.contour)
legend (x=25, y=0.05,
        legend = c("p<0.01", "p<0.05", "p<0.01"),
        bty= "n",
        x.intersp = 0.75,
        y.intersp = 0.75,
        fill = col.contour)

title ("Disease severity")

fun.severity

dev.off()


##-----------
summary(m.age)
summary(m.sex)
summary(m.residence)
summary(m.vaccination)
summary(m.pep)
summary(m.ip)
summary(m.ot)
summary(m.comorb)
summary(m.compl)
summary(m.dysauto)
summary(m.vent)
summary(m.comorb)
summary(m.dysauto)

##funnel plot asymmetry test
##eggers test good for pooled prevalence or similar estimates
##peters method good for case-control type analysis
##Minimum number of studies required to perform these tests (k=10)

##Exampl commands
eggers.test(m.age)

metabias(m.age, method.bias = "peters")

