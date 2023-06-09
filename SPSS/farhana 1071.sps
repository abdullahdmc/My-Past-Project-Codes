﻿* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
RECODE TYPETREA (2=0).
EXECUTE.

RECODE OUTCOME (1=1) (2=1) (3=0) (4=0) (5=0) INTO outcome2.
EXECUTE.



MEANS TABLES=Satisfactionscorenumeric BY SOCIECON
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=DURATION BY Satisfactionscorenumeric
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=Age_yr BY Satisfactionscorenumeric
  /CELLS=MEAN COUNT STDDEV.

ONEWAY Age_yr BY Satisfactionscorenumeric
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).


ONEWAY Satisfactionscorenumeric BY SOCIECON
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

RECODE SOCIECON (1=0) (2=0) (3=1) (4=1) INTO econ2.
EXECUTE.

RECODE HOSTYPE (1=0) (2=1) INTO hospi2.
EXECUTE.

RECODE Sex (1=1) (2=0) INTO sex2.
EXECUTE.

RECODE OUTCOME (1=1) (2=1) (3=0) (4=0) (5=0) INTO outcome2.
EXECUTE.


RECODE Age_yr (Lowest thru 49.99=1) (50.00 thru Highest=0) INTO age2.
EXECUTE.

RECODE totalexpense (Lowest thru 49999=0) (50000 thru Highest=1) INTO te2.
EXECUTE.

RECODE Satisfactionscorenumeric (Lowest thru 3=0) (4 thru Highest=1) INTO sat2.
EXECUTE. 

RECODE DURATION (Lowest thru 5=1) (6 thru Highest=0) INTO dur2.
EXECUTE. 





LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER age2 
  /CONTRAST (age2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER sex2
  /CONTRAST (sex2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER econ2
  /CONTRAST (econ2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER outcome2 
  /CONTRAST (outcome2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER dur2 
  /CONTRAST (dur2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER hospi2
  /CONTRAST (hospi2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER treat
  /CONTRAST (treat)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER te2
  /CONTRAST (te2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

LOGISTIC REGRESSION VARIABLES sat2
  /METHOD=ENTER age2 sex2 econ2 hospi2 treat outcome2 dur2 te2
  /CONTRAST (age2)=Indicator(1)
  /CONTRAST (sex2)=Indicator(1)
  /CONTRAST (econ2)=Indicator(1)
  /CONTRAST (hospi2)=Indicator(1)
  /CONTRAST (treat)=Indicator(1)
  /CONTRAST (outcome2)=Indicator(1)
  /CONTRAST (dur2)=Indicator(1)
  /CONTRAST (te2)=Indicator(1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).
