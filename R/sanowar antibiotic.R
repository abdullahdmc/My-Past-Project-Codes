library(foreign)
p<- read.spss(file.choose(), to.data.frame=TRUE)
attach(p)
library(car)

png("C:/Users/Sayeed/Dropbox/28. JUNE/1. PI Work/1185. sanowar k 61_MMJ/Data/bbyk.png", type="cairo")

scatterplot(
  k ~ ib, 
  data = p, 
  regLine=list(method=lm, lty=1, lwd=2, col="green"), 
  smooth=list(smoother=loessLine, 
              style="filled", 
              alpha=0.15, 
              border=TRUE, 
              vertical=TRUE, 
              col.var="yellow", 
              lty.var="red")
  )

s

dev.off()



