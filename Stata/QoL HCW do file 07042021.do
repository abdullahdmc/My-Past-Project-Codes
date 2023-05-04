//Qol reliability
alpha QoL1-QoL26, item

//Descriptives
sum Age,d
tabulate cat_age
tabulate Gender
tabulate Division
tabulate Residence
tabulate Religion
tabulate cat_religion
tabulate Education
tabulate MS
tabulate cat_MS
sum Income,d
tabulate cat_income
tabulate Hospital
tabulate Smoke

//Comorbidities
tabulate Q15_1
tabulate Q15_2
tabulate Q15_3
tabulate Q15_4
tabulate Q15_5
tabulate Q15_6
tabulate cat_chronic

//Symptoms
tabulate Q16_1
tabulate Q16_2
tabulate Q16_3
tabulate Q16_4
tabulate Q16_5
tabulate Q16_6
tabulate Q16_7
tabulate Q16_8
tabulate Q16_9
tabulate Q16_10
tabulate Q16_11
tabulate Q16_12
tabulate Q16_13
tabulate Q16_14
tabulate Q16_15
tabulate Q16_16
tabulate Q16_17
tabulate Q16_18
tabulate Q16_19
tabulate Q16_20
tabulate Q16_21
tabulate Q16_22

//QoL 
sum phy,d
tabulate cat_phy
sum psy, d
tabulate cat_psy
sum soci, d
tabulate cat_soci
sum envi, d
tabulate cat_envi

//analytic QoL domain by factors
//physical domain
oneway phy cat_age, tabulate
pwmean phy, over(cat_age) mcompare(tukey) effects
ttest phy, by(Gender)
oneway phy Division, tabulate
pwmean phy, over(Division) mcompare(tukey) effects
oneway phy Residence, tabulate
pwmean phy, over(Residence) mcompare(tukey) effects
ttest phy, by(cat_religion)
oneway phy Education, tabulate
pwmean phy, over(Education) mcompare(tukey) effects
oneway phy cat_MS, tabulate
pwmean phy, over(cat_MS) mcompare(tukey) effects
oneway phy cat_income, tabulate
pwmean phy, over(cat_income) mcompare(tukey) effects
ttest phy, by(Hospital)
oneway phy Smoke, tabulate
pwmean phy, over(Smoke) mcompare(tukey) effects
oneway phy cat_chronic, tabulate
pwmean phy, over(cat_chronic) mcompare(tukey) effects

ttest phy, by(Q15_1)
ttest phy, by(Q15_2)
ttest phy, by(Q15_3)
ttest phy, by(Q15_4)
ttest phy, by(Q15_5)
ttest phy, by(Q15_6)


//psychological domain
oneway psy cat_age, tabulate
pwmean psy, over(cat_age) mcompare(tukey) effects
ttest psy, by(Gender)
oneway psy Division, tabulate
pwmean psy, over(Division) mcompare(tukey) effects
oneway psy Residence, tabulate
pwmean psy, over(Residence) mcompare(tukey) effects
ttest psy, by(cat_religion)
oneway psy Education, tabulate
pwmean psy, over(Education) mcompare(tukey) effects
oneway psy cat_MS, tabulate
pwmean psy, over(cat_MS) mcompare(tukey) effects
oneway psy cat_income, tabulate
pwmean psy, over(cat_income) mcompare(tukey) effects
ttest psy, by(Hospital)
oneway psy Smoke, tabulate
pwmean psy, over(Smoke) mcompare(tukey) effects
oneway psy cat_chronic, tabulate
pwmean psy, over(cat_chronic) mcompare(tukey) effects

ttest psy, by(Q15_1)
ttest psy, by(Q15_2)
ttest psy, by(Q15_3)
ttest psy, by(Q15_4)
ttest psy, by(Q15_5)
ttest psy, by(Q15_6)

//social domain
oneway soci cat_age, tabulate
pwmean soci, over(cat_age) mcompare(tukey) effects
ttest soci, by(Gender)
oneway soci Division, tabulate
pwmean soci, over(Division) mcompare(tukey) effects
oneway soci Residence, tabulate
pwmean soci, over(Residence) mcompare(tukey) effects
ttest soci, by(cat_religion)
oneway soci Education, tabulate
pwmean soci, over(Education) mcompare(tukey) effects
oneway soci cat_MS, tabulate
pwmean soci, over(cat_MS) mcompare(tukey) effects
oneway soci cat_income, tabulate
pwmean soci, over(cat_income) mcompare(tukey) effects
ttest soci, by(Hospital)
oneway soci Smoke, tabulate
pwmean soci, over(Smoke) mcompare(tukey) effects
oneway soci cat_chronic, tabulate
pwmean soci, over(cat_chronic) mcompare(tukey) effects

ttest soci, by(Q15_1)
ttest soci, by(Q15_2)
ttest soci, by(Q15_3)
ttest soci, by(Q15_4)
ttest soci, by(Q15_5)
ttest soci, by(Q15_6)

//environmental domain
oneway envi cat_age, tabulate
pwmean envi, over(cat_age) mcompare(tukey) effects
ttest envi, by(Gender)
oneway envi Division, tabulate
pwmean envi, over(Division) mcompare(tukey) effects
oneway envi Residence, tabulate
pwmean envi, over(Residence) mcompare(tukey) effects
ttest envi, by(cat_religion)
oneway envi Education, tabulate
pwmean envi, over(Education) mcompare(tukey) effects
oneway envi cat_MS, tabulate
pwmean envi, over(cat_MS) mcompare(tukey) effects
oneway envi cat_income, tabulate
pwmean envi, over(cat_income) mcompare(tukey) effects
ttest envi, by(Hospital)
oneway envi Smoke, tabulate
pwmean envi, over(Smoke) mcompare(tukey) effects
oneway envi cat_chronic, tabulate
pwmean envi, over(cat_chronic) mcompare(tukey) effects

ttest envi, by(Q15_1)
ttest envi, by(Q15_2)
ttest envi, by(Q15_3)
ttest envi, by(Q15_4)
ttest envi, by(Q15_5)
ttest envi, by(Q15_6)

//Univariate logistic regression 
//Physical domain
logistic cat_phy ib1.cat_age
logistic cat_phy ib1.Gender
logistic cat_phy ib3.Division
logistic cat_phy ib1.Residence
logistic cat_phy ib1.cat_religion
logistic cat_phy ib1.cat_education 
logistic cat_phy ib1.cat_MS
logistic cat_phy ib1.cat_income 
logistic cat_phy ib0.Hospital
logistic cat_phy ib0.Smoke
logistic cat_phy ib0.cat_chronic

//Psychological domain
logistic cat_psy ib1.cat_age
logistic cat_psy ib1.Gender
logistic cat_psy ib3.Division
logistic cat_psy ib1.Residence
logistic cat_psy ib1.cat_religion
logistic cat_psy ib1.cat_education 
logistic cat_psy ib1.cat_MS
logistic cat_psy ib1.cat_income 
logistic cat_psy ib0.Hospital
logistic cat_psy ib0.Smoke
logistic cat_psy ib0.cat_chronic

//Social domain
logistic cat_soci ib1.cat_age
logistic cat_soci ib1.Gender
logistic cat_soci ib3.Division
logistic cat_soci ib1.Residence
logistic cat_soci ib1.cat_religion
logistic cat_soci ib1.cat_education 
logistic cat_soci ib1.cat_MS
logistic cat_soci ib1.cat_income 
logistic cat_soci ib0.Hospital
logistic cat_soci ib0.Smoke
logistic cat_soci ib0.cat_chronic

//Environmental domain
logistic cat_envi ib1.cat_age
logistic cat_envi ib1.Gender
logistic cat_envi ib3.Division
logistic cat_envi ib1.Residence
logistic cat_envi ib1.cat_religion
logistic cat_envi ib1.cat_education 
logistic cat_envi ib1.cat_MS
logistic cat_envi ib1.cat_income 
logistic cat_envi ib0.Hospital
logistic cat_envi ib0.Smoke
logistic cat_envi ib0.cat_chronic

//Multivariate logistic regression
//Physcial domain with and without duration
logistic cat_phy ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic  

logistic cat_phy ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic daysbetween

//Psychological domain with and without duration
logistic cat_psy ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic  

logistic cat_psy ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic daysbetween

//Social domain with and without duration
logistic cat_soci ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic 

logistic cat_soci ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic daysbetween 

//Environmental domain with and without duration
logistic cat_envi ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic 

logistic cat_envi ib1.cat_age ib1.Gender ib1.Residence ib1.cat_religion ib1.cat_education ib1.cat_MS ib1.cat_income ib0.Hospital ib0.Smoke ib0.cat_chronic daysbetween 

