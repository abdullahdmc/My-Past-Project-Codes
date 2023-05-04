* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
AUTORECODE VARIABLES=sex 
  /INTO sex1
  /PRINT.

AUTORECODE VARIABLES=nutrition
  /INTO nutrition1
  /PRINT.

AUTORECODE VARIABLES=fever
  /INTO fever1
  /PRINT.

AUTORECODE VARIABLES=run_nose
  /INTO runny_nose1
  /PRINT.

AUTORECODE VARIABLES=vomiting
  /INTO vomiting1
  /PRINT.

AUTORECODE VARIABLES=not_feedin
  /INTO notfeeding1
  /PRINT.

AUTORECODE VARIABLES=weakness 
  /INTO weakness1
  /PRINT.

AUTORECODE VARIABLES=sore_throa 
  /INTO sore_throat1
  /PRINT.

AUTORECODE VARIABLES=unconsciou 
  /INTO unconsciousness1
  /PRINT.

AUTORECODE VARIABLES=cough 
  /INTO cough1
  /PRINT.

AUTORECODE VARIABLES=abd_pain 
  /INTO abd_pain1
  /PRINT.

AUTORECODE VARIABLES=seizure  
  /INTO seizure1
  /PRINT.

AUTORECODE VARIABLES=loose_moti
  /INTO loose_motion1
  /PRINT.

AUTORECODE VARIABLES=delayed_cr 
  /INTO delayed_cry1
  /PRINT.

AUTORECODE VARIABLES=breathless 
  /INTO breathlessness1
  /PRINT.

AUTORECODE VARIABLES=rash 
  /INTO rash1
  /PRINT.

AUTORECODE VARIABLES=cld 
  /INTO cold1
  /PRINT.

AUTORECODE VARIABLES=oedema 
  /INTO oedema1
  /PRINT.

AUTORECODE VARIABLES=local_swel
  /INTO local_swelling1
  /PRINT.

DATASET ACTIVATE DataSet1.
RECODE nutrition (2=1) (3=2) (4=3) (5=4).
EXECUTE.

COMPUTE age_days=(age_y*365+age_m*30+age_d).
EXECUTE. 

COMPUTE age_months=(age_y*12+age_m+(age_d/30)).
EXECUTE.

DATASET ACTIVATE DataSet1.
RECODE fever run_nose vomiting not_feedin weakness sore_throa unconsciou cough abd_pain seizure 
    loose_moti delayed_cr breathless rash cld oedema local_swel pneumonia bronchioli sepsis aki 
    meningitis febrile_co acute_gastroen pna jaundice neph_syn awd encephalit acute_leuk rti apasti_ana 
    thalass dengu_feve sam hapatitis mumps pancreatit gbs iugr chd omphocele hydronep lons eons hie 
    occi_encep arm puv ctev myelomenin pelvic_mas epistaxis ihps trache_eso seizure_di enteric_fe 
    covid_19 ass uti a_s_emarge cp_dd cld_A afp msis (SYSMIS=0).
EXECUTE.


AUTORECODE VARIABLES=outcome
  /INTO outcome2
  /PRINT.

RECODE outcome2 (3 thru 5=1) (6 thru 7=3) (12 thru 14=3) (8 thru 11 =2) INTO outcome3.
EXECUTE.

COMPUTE infant=(age_days <=365)=1.
EXECUTE.

COMPUTE neonate=(age_days <=28)=1. 
EXECUTE. 

RECODE age_days (1 thru 28 = 1) (29 thru 365 = 2) (366 thru HIGHEST=3) INTO age_cat. 
EXECUTE. 

*Table 1 (Demography and nutrition) 

DESCRIPTIVES VARIABLES=age_days
  /STATISTICS=MEAN STDDEV MIN MAX.

FREQUENCIES VARIABLES=age_cat. 


FREQUENCIES VARIABLES=sex. 

FREQUENCIES VARIABLES=nutrition. 


DESCRIPTIVES VARIABLES=weight
  /STATISTICS=MEAN STDDEV MIN MAX.

MEANS TABLES=weight
  /CELLS=MEDIAN.

FREQUENCIES VARIABLES=fever run_nose vomiting not_feedin weakness sore_throa unconsciou cough 
    abd_pain seizure loose_moti delayed_cr breathless rash cld oedema local_swel pneumonia bronchioli 
    sepsis aki meningitis febrile_co acute_gastroen pna jaundice neph_syn awd encephalit acute_leuk rti 
    apasti_ana thalass dengu_feve sam hapatitis mumps pancreatit gbs iugr chd omphocele hydronep lons 
    eons hie occi_encep arm puv ctev myelomenin pelvic_mas epistaxis ihps trache_eso seizure_di 
    enteric_fe ass uti a_s_emarge cp_dd cld_A afp msis
  /ORDER=ANALYSIS.

DATASET ACTIVATE DataSet1.
MEANS TABLES=age_months BY age_cat
  /CELLS=MEAN COUNT STDDEV MEDIAN MIN MAX.

MEANS TABLES=weight BY age_cat
  /CELLS=MEAN COUNT STDDEV MEDIAN MIN MAX.

CROSSTABS
  /TABLES=sex nutrition BY age_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

ONEWAY weight BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

*Table 2 Clinical feature by age

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=fever breathless pneumonia abd_pain cough seizure vomiting sepsis oedema loose_moti rash seizure_di not_feedin weakness sore_throa bronchioli awd run_nose unconsciou delayed_cr local_swel  BY age_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

*Comorbidity by age 

CROSSTABS
  /TABLES= a_s_emarge acute_leuk chd neph_syn meningitis encephalit enteric_fe
  cp_dd aki hydronep thalass dengu_feve sam ihps pancreatit iugr myelomenin uti cld
  acute_gastroen hapatitis mumps hie arm seizure_di pna rti apasti_ana gbs omphocele lons eons occi_encep puv ctev trache_eso pelvic_mas epistaxis afp msis  BY age_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).



DATASET ACTIVATE DataSet4.
COMPUTE comorb=a_s_emarge + acute_leuk + chd + neph_syn + meningitis + encephalit + enteric_fe + 
    aki + cp_dd + aki + hydronep + thalass + dengu_feve + sam + ihps + pancreatit + iugr + myelomenin + 
    uti + cld + acute_gastroen + hapatitis + mumps + hie + arm + seizure_di + pna + rti + apasti_ana + 
    gbs + omphocele + occi_encep + puv + ctev + trache_eso + afp + msis.
EXECUTE.


CROSSTABS
  /TABLES= comorb_cat BY age_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

*Table 3 Investigation profile

MEANS TABLES=rbc wbc2 neutro lymph mono eosinophil platelet2 BY age_cat
  /CELLS=MEAN COUNT STDDEV MEDIAN MIN MAX.

MEANS TABLES=creatinine2 BY age_cat
  /CELLS=MEAN COUNT STDDEV MEDIAN MIN MAX.

MEANS TABLES=na k cl BY age_cat
  /CELLS=MEAN COUNT STDDEV MEDIAN MIN MAX.


DATASET ACTIVATE DataSet1.
ONEWAY hb rbc hct wbc2 neutro lymph mono eosinophil platelet2 creatinine na k cl BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

DATASET ACTIVATE DataSet1.
ONEWAY hb  BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

DATASET ACTIVATE DataSet1.
ONEWAY hct BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

DATASET ACTIVATE DataSet1.
ONEWAY rbc BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

DATASET ACTIVATE DataSet1.
ONEWAY wbc2 BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

ONEWAY neutro lymph mono eosinophil  BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).

*Nonparametric Tests: Independent Samples. 
NPTESTS 
  /INDEPENDENT TEST (wbc2) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (neutro) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (lymph) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (mono) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (eosinophil) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (platelet2) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (creatinine2) GROUP (age_cat) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

ONEWAY na k cl BY age_cat
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI GH ALPHA(0.05).


*by outcome

MEANS TABLES=wbc2 neutro lymph mono eosinophil platelet2 creatinine2 BY outcome4
  /CELLS= MEDIAN MIN MAX.



  CROSSTABS
  /TABLES=age_cat sex nutrition comorb_cat BY outcome4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


T-TEST GROUPS=outcome4(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=hb rbc hct na k cl
  /CRITERIA=CI(.95).


  NPTESTS 
  /INDEPENDENT TEST (wbc2) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (neutro) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (lymph) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (mono) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (eosinophil) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (platelet2) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

NPTESTS 
  /INDEPENDENT TEST (creatinine2) GROUP (outcome4) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.
  
  
  
  
  
  CROSSTABS
  /TABLES=fever breathless pneumonia abd_pain cough seizure vomiting sepsis oedema loose_moti rash seizure_di not_feedin weakness sore_throa bronchioli awd run_nose unconsciou delayed_cr local_swel  BY outcome4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

CROSSTABS
  /TABLES= a_s_emarge acute_leuk chd neph_syn meningitis encephalit enteric_fe
  cp_dd aki hydronep thalass dengu_feve sam ihps pancreatit iugr myelomenin uti cld
  acute_gastroen hapatitis mumps hie arm seizure_di pna rti apasti_ana gbs omphocele lons eons occi_encep puv ctev trache_eso pelvic_mas epistaxis afp msis  BY outcome4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).



CROSSTABS
  /TABLES= comorb_cat BY outcome4
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

COMPUTE wbc2=wbc/1000.
EXECUTE.

COMPUTE platelet2=plactelet/100000.
EXECUTE. 

COMPUTE creatinine2=creatinine/88.42.
EXECUTE. 


