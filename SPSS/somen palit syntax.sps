* Encoding: UTF-8.

DATASET ACTIVATE DataSet9.
AUTORECODE VARIABLES=Sex MaritalStatus Menustration DM HTN IHD BA COPD Other 
  /INTO sex1 maritalstatus1 menstruation dm1 htn1 ihd1 ba1 copd1 other1
  /PRINT.

DATASET ACTIVATE DataSet4.
AUTORECODE VARIABLES=Sex MaritalStatus Menustration DM HTN IHD BA COPD Other 
  /INTO sex1 maritalstatus1 mens dm1 htn1 ihd1 ba1 copd1 other1
  /PRINT.

DATASET ACTIVATE DataSet4.
RECODE sex (2=1) (3=2).
EXECUTE.

DATASET ACTIVATE DataSet4.
RECODE sex (2=1) (3=2).
RECODE maritalstatus (2=1) (3=2) (4=3) (5=4).
RECODE dm (2=1) (3=2).
RECODE htn (2=1) (3=2).
RECODE  ihd (2=1) (3=2).
RECODE ba (2=1) (3=2).
RECODE copd (2=1)(3=2).
RECODE other (2=1)(3=2).
EXECUTE. 


DATASET ACTIVATE DataSet5.
SORT CASES BY Name Age sex.
DATASET ACTIVATE DataSet4.
SORT CASES BY Name Age sex.
DATASET ACTIVATE DataSet5.
MATCH FILES /FILE=*
  /FILE='DataSet4'
  /RENAME (age_A ba copd dm htn ihd maritalstatus mens other St tscore tsgrad = d0 d1 d2 d3 d4 d5 
    d6 d7 d8 d9 d10 d11) 
  /BY Name Age sex
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11.
EXECUTE.





DATASET ACTIVATE DataSet1.
COMPUTE rhs14_1=(q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10 + q11 + q12 + q13 + q14)/5.
EXECUTE.

COMPUTE rhs15=q15.
EXECUTE. 

COMPUTE rhs14fu=q1fu + q2fu + q3fu + q4fu + q5fu + q6fu + q7fu + q8fu + q9fu + q10fu + q11fu + q12fu + q13fu + q14fu.
EXECUTE.

COMPUTE rhs15fu=q15fu.
EXECUTE. 

COMPUTE rhs14_1=(q1 + q2 + q3 + q4 + q5 + q6 + q7 + q8 + q9 + q10 + q11 + q12 + q13 + q14)/4.
EXECUTE.

COMPUTE rhs14fu_1=(q1fu + q2fu + q3fu + q4fu + q5fu + q6fu + q7fu + q8fu + q9fu + q10fu + q11fu + q12fu + q13fu + q14fu)/4.
EXECUTE.

IF  (rhs14 >= 12 | rhs15 >=5) distress=1.
EXECUTE.

IF  (rhs14fu >= 12 | rhs15fu >=5) distress_fu=1.
EXECUTE.

COMPUTE covqol=(c1+c2+c3+c4+c5+c6)/6.
EXECUTE. 

IF (covqol >=3) lowqol=1.
EXECUTE. 

COMPUTE rhs14ch=rhs14fu-rhs14.
EXECUTE.

COMPUTE rhs15ch=rhs15fu-rhs15.
EXECUTE. 


RECODE age (Lowest thru 30=1) (31 thru 40=2) (41 thru 50=3) (51 thru 60=4) (60 thru Highest=5) INTO 
    age_cat.
EXECUTE.

RECODE age (Lowest thru 30=1 ) (31 thru Highest=2) INTO age_cat4.
EXECUTE. 

RECODE age (Lowest thru 25=1) (26 thru 35=2) (36 thru 45=3) (46 thru 55=4) (56 thru 65 =5) (66 thru Highest=5) INTO 
    age_cat3.
EXECUTE.

IF  (dm = 1 | htn = 1 | ihd = 1 | ba = 1 | copd = 1) comorb=1.
EXECUTE.

RECODE comorb (SYSMIS=0).
EXECUTE.

*Sociodemography and comorbidity
  
  FREQUENCIES VARIABLES=age_cat sex maritalstatus dm htn ihd ba copd other
  /ORDER=ANALYSIS.

*RHS at initial evaluation (table 2)

MEANS TABLES=rhs14 rhs15
  /CELLS=COUNT MEAN STDDEV MEDIAN MIN MAX.

T-TEST GROUPS=age_cat4(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).

T-TEST GROUPS=age_cat2(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=sex(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).

T-TEST GROUPS=marital1(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=comorb(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=dm(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=htn(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=ba(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=ihd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


T-TEST GROUPS=copd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14 rhs15
  /CRITERIA=CI(.95).


*RHS at follow-up evaluation (table 3)

MEANS TABLES=rhs14fu rhs15fu
  /CELLS=COUNT MEAN STDDEV MEDIAN MIN MAX.

DESCRIPTIVES rhs14fu rhs15fu. 

T-TEST GROUPS=age_cat4(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=sex(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).

T-TEST GROUPS=marital1(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=comorb(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=dm(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=htn(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=ba(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=ihd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).


T-TEST GROUPS=copd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14fu rhs15fu
  /CRITERIA=CI(.95).



*Comparison of RHS before and after (Supplementary table 1)

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SORT CASES  BY age_cat4.
SPLIT FILE SEPARATE BY age_cat4.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.


SORT CASES  BY sex.
SPLIT FILE SEPARATE BY sex.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.


SORT CASES  BY marital1.
SPLIT FILE SEPARATE BY marital1.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.


SORT CASES  BY htn.
SPLIT FILE SEPARATE BY htn.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.

SORT CASES  BY ba.
SPLIT FILE SEPARATE BY ba.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.

SORT CASES  BY ihd.
SPLIT FILE SEPARATE BY ihd.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.

SORT CASES  BY copd.
SPLIT FILE SEPARATE BY copd.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.

SORT CASES  BY dm.
SPLIT FILE SEPARATE BY dm.

T-TEST PAIRS=rhs14 rhs15 WITH rhs14fu rhs15fu (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

SPLIT FILE OFF.


*Table 4 Mean RHS changes across participant characteristis

MEANS TABLES=rhs14ch rhs15ch
  /CELLS=COUNT MEAN STDDEV MEDIAN MIN MAX.


DESCRIPTIVES rhs14ch rhs15ch. 

T-TEST GROUPS=age_cat4(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).


T-TEST GROUPS=sex(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

T-TEST GROUPS=marital1(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

T-TEST GROUPS=comorb(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

T-TEST GROUPS=htn(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

 T-TEST GROUPS=ba(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

T-TEST GROUPS=ihd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

T-TEST GROUPS=copd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

T-TEST GROUPS=dm(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=rhs14ch rhs15ch
  /CRITERIA=CI(.95).

*Table 5 COV19-QoL score 

MEANS TABLES=covqol
  /CELLS=COUNT MEAN STDDEV MEDIAN MIN MAX.


T-TEST GROUPS=age_cat4(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).


T-TEST GROUPS=sex(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

T-TEST GROUPS=marital1(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

T-TEST GROUPS=comorb(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

T-TEST GROUPS=htn(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

 T-TEST GROUPS=ba(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

T-TEST GROUPS=ihd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

T-TEST GROUPS=copd(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).

T-TEST GROUPS=dm(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=covqol
  /CRITERIA=CI(.95).


*Table 6 (LR)

RECODE sex (1=1) (2=0) INTO sexlr.
EXECUTE.

RECODE age_cat4 (1=1) (2=0) INTO agelr.
EXECUTE. 

*RHS 14 items

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT rhs14ch
  /METHOD=ENTER covqol age sexlr marital1 htn ba ihd copd dm
  /RESIDUALS DURBIN.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT rhs14ch
  /METHOD=STEPWISE covqol age sex marital1 htn ba ihd copd dm
  /RESIDUALS DURBIN.


*RHS 15 items

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT rhs15ch
  /METHOD=ENTER covqol age sexlr marital1 htn ba ihd copd dm
  /RESIDUALS DURBIN.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT rhs15ch
  /METHOD=STEPWISE covqol age sexlr marital1 htn ba ihd copd dm
  /RESIDUALS DURBIN.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=rhs14 distress MISSING=LISTWISE REPORTMISSING=NO 
    DATAFILTER=distress(VALUES=ALL UNLABELED=INCLUDE) 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: rhs14=col(source(s), name("rhs14"))
  GUIDE: axis(dim(1), label("rhs14"))
  GUIDE: axis(dim(2), label("Frequency"))
  GUIDE: text.title(label("Simple Histogram of rhs14"))
  GUIDE: text.footnote(label("Filtered by distress variable"))
  ELEMENT: interval(position(summary.count(bin.rect(rhs14))), shape.interior(shape.square))
END GPL.


*Reliability analysis 

DATASET ACTIVATE DataSet1.
RELIABILITY
  /VARIABLES=q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL MEANS.



RELIABILITY
  /VARIABLES=q1fu q2fu q3fu q4fu q5fu q6fu q7fu q8fu q9fu q10fu q11fu q12fu q13fu q14fu 
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL MEANS.



RELIABILITY
  /VARIABLES=c1 c2 c3 c4 c5 c6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL MEANS.

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(fu = 1).
VARIABLE LABELS filter_$ 'fu = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*Supplementary table (comparison between fu and non-fu)

DATASET ACTIVATE DataSet1.
USE ALL.

CROSSTABS
  /TABLES=age_cat sex maritalstatus dm htn ihd ba copd BY fu
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

DATASET ACTIVATE DataSet1.
T-TEST GROUPS=fu(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

*Supplementary tabel (comparison between distress present and absent)

CROSSTABS
  /TABLES=age_cat sex maritalstatus htn ba ihd copd dm  BY distress
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.
