##Variable preparations
encode gender, generate(sex)
encode race, generate (race_n)
encode type, generate (type_n)
recode age 16/58.9999=1 59/max=0, generate(age_n)
recode com 1=0 2/max=1, generate(com_n)
recode organsfailed 1/2=0 3/max=1, generate(organfailed_n)
recode ckd 0=0 1/max=1, generate(ckd_n)
label variable age_n "Age Category"
label variable com_n "Comorbidities"
label variable organfailed_n "Organs failed"
label define age_n 0 ">=59" 1 "<59"
label define com_n 0 "1" 1 ">1"
label define of_n 0 "<=2" 1 ">2"
label define ckd_n 0 "0-2" 1 "3-5"
label define yn 0 "No" 1 "Yes"
label value age_n age_n
label value com_n com_n
label value organfailed_n of_n
label value ckd_n ckd_n
label value trauma yn
label value sepsis yn
label value pressors yn

 
 
##Bivariate analysis
ttest age, by(intubation) 
tabulate sex intubation, chi2 row
tabulate race_n intubation, chi2 row
ttest com, by(intubation)
ttest organsfailed, by(intubation)
ranksum organsfailed, by(intubation) 
tabulate type_n intubation, chi2 row
ttest pre_ad_rif, by(intubation)
tabulate pre_ad_rif intubation, chi2 row
tabulate ckd intubation, chi2 row
tabulate ckd_n intubation, chi2 row
tabulate trauma intubation, chi2 row
tabulate pressors intubation, chi2 row
tabulate sepsis intubation, chi2 row
ttest meldd0, by (intubation)
ttest dcrdw, by(intubation)




##Univariate logistic regression 
logistic intubation age
logistic intubation ib0.age_n
logistic intubation ib1.sex
logistic intubation ib1.race_n
logistic intubation ib1.type_n
logistic intubation com
logistic intubation ib0.com_n
logistic intubation organsfailed
logistic intubation ib0.organfailed_n
logistic intubation pre_ad_rif
logistic intubation ckd
logistic intubation ib0.ckd_n 
logistic intubation ib0.trauma 
logistic intubation ib0.pressors
logistic intubation ib0.sepsis
logistic intubation meldd0
logistic intubation dcrdw 


##Multivariate logistic regression
logistic intubation age ib1.sex ib1.race_n ib1.type_n com organsfailed pre_ad_rif ckd ib0.trauma ib0.pressors ib0.sepsis meldd0  

#Excluding non-significant variables
logistic intubation age ib1.sex ib1.race_n ib1.type_n organsfailed pre_ad_rif ib0.trauma ib0.pressors ib0.sepsis meldd0  

#Com, organfailed categorized
logistic intubation ib0.age_n ib1.sex ib1.race_n ib1.type_n ib0.com_n ib0.organfailed_n pre_ad_rif ckd ib0.trauma ib0.pressors ib0.sepsis meldd0  
