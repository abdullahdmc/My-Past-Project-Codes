//variable preparations
replace age_yr = 0 if (age_yr >= .)
replace age_month = 0 if (age_month >= .)
gen age = (age_yr*12) + age_month
recode age min/12.00=1 12.01/60.00=2 60.00/max=3, generate(age_cat) 
label define age_cat 1 "<=1 years" 2 "2 to 5 years" 3 ">5 years"
label variable age_cat "age categories of patients"
label value age_cat age_cat
rename underweight wtfage
rename wasting wtfht
rename stunting htfage
recode wtfage min/-2.00=1 -2.01/max=0, generate (underweight)
label define yn 0 "No" 1 "yes"
label value underweight yn
recode wtfht min/-2.00=1 -2.01/max=0, generate (wasting)
label value wasting yn
label variable wasting "wasting"
recode wtfage min/-2.00=1 -2.01/max=0, generate (stunting)
label value stunting yn
label variable stunting "stunting"
recode mon_exp min/12000=1 12001/18000=2 18001/25000=3 25001/max=4, generate(monexp_cat)
label variable monexp_cat "monthly expense quartiles"
label define expq 1 "<=12000" 2 "12001-18000" 3 "18001-25000" 4 ">25000
label value monexp_cat expq

replace sweat_cl = 3 if (sweat_cl >=.)
replace cf_dx = 3 if (cf_dx >=.)

replace cough=2 if (cough >=.)
replace cough=1 if (cough >=2)
replace sputum=1 if (sputum >= .)
replace asthma0=2 if (sputum >= .)
replace polyp=2 if (sputum >=.)
replace chr_sin=2 if (chr_sin >=.) 
replace mec_il=2 if (mec_il >=.)
replace neonate_jaundice=2 if (neonate_jaundice >=.)
replace constipation=2 if (constipation >=.)

replace phtn=2 if (phtn >=.)
replace abpa=2 if (abpa >=.)
replace neo_hepa_syn=2 if (neo_hepa_syn >=.)

recode stool_for_fat min/max = 1 else=0, generate (stfat)
replace stool_for_fat2=0 if (stool_for_fat2 >=.)
replace stool_for_fat2=2 if (stool_for_fat2 >=1)
gen stfat2= stfat + stool_for_fat2
tabulate stfat2
drop stfat
rename stfat2 stfat
label define stfat 0 "Not done" 1 "<=200" 2 ">200"
label value stfat stfat
tabulate stfat



replace aureus=0 if (aureus >= .)
replace muc_aeru=0 if (muc_aeru >= .)
replace kleb=0 if (kleb >= .)
replace acineto=0 if (acineto >= .)
replace strepto=0 if (strepto >= .)
replace e_coli=0 if (e_coli >= .)
label value aureus yn
label value muc_aeru yn
label value kleb yn
label value acineto yn
label value strepto yn
label value e_coli yn
recode outcome 1=1 3=1 2=2, generate (outcome2)
label define om 1 "Improved" 2 "Death"
label value outcome2 om
label variable outcome2 "outcome of patients"
replace outcome2=1 if (outcome2 >=.)

replace amoxicillin=. if (amoxicillin >=4)
replace erythromycin=. if (erythromycin >=4)
replace gentamicin=. if(gentamicin >=4)
replace rifampicin=. if(rifampicin >=4)
replace clindamycin=. if(clindamycin >=4)
replace vancomycin=. if(vancomycin >=4)
replace linezolid=. if (linezolid >=4)
replace amikacin=. if (amikacin >=4)
replace timentin=. if (timentin >=4)
replace aztreonam=. if (aztreonam >=4)
replace ceftazidime=. if(ceftazidime >=4)
replace cefepime=. if(cefepime >=4)
replace ciprofloxacine=. if(ciprofloxacine >=4)
replace tobramycin=. if (tobramycin >=4)
replace imipenem=. if (imipenem >=4)
replace meropenem=. if (meropenem >=4)
replace piperacillin=. if (piperacillin >=4)
replace cotrimoxazole=. if (cotrimoxazole >=4)
replace levofloxacin=. if (levofloxacin >=4)

gen organism=aureus+muc_aeru+kleb+acineto+strepto+e_coli 
recode organism 0=0 1/2=1, gen (organism_cat)
label define org 0 "Negative" 1 "Positive"
label value organism_cat org 

replace cxray1=0 if(cxray1 >=.)
replace cxray2=0 if(cxray2 >=.)
replace cxray3=0 if(cxray3 >=.)
replace cxray4=0 if(cxray4 >=.)
label value cxray1 yn
label value cxray2 yn
label value cxray3 yn
label value cxray4 yn
label variable cxray1 "Bilateral Patchy Opacity"
label variable cxray2 "Hyperinflation of lungs"
label variable cxray3 "Honeycomb appearance"
label variable cxray4 "consolidation or inhomogenous opacity"




//demography
sum age,d
tabulate age_cat
tabulate gender
tabulate education
tabulate employment
sum mon_exp, d
tabulate monexp_cat
tabulate fh_cf
tabulate consanguinity

//demography by outcome2
by outcome2, sort : summarize age, detail
ranksum age, by(outcome2) exact
tabulate age_cat outcome2, chi2 column expected
tabulate gender outcome2, chi2 column
tabulate employment outcome2, chi2 column expected
ttest mon_exp, by(outcome2)
tabulate monexp_cat outcome2, chi2 column expected
tabulate fh_cf outcome2, chi2 column
tabulate sibling_cf outcome2, chi2 column
tabulate consanguinity outcome2, chi2 column
 

//cystic fibrosis diagnosis
tabulate sweat_cl
tabulate cf_dx

//CF dx by outcome2
tabulate sweat_cl outcome2, chi2 column



//anthropometry and nutrition
sum wt, d
sum ht, d
sum muac, d
tabulate underweight
tabulate wasting
tabulate stunting

//anthropometry and nutrition by outcome2
tabulate underweight outcome2, chi2 column
tabulate wasting outcome2, chi2 column
tabulate stunting outcome2, chi2 column


//clinical feature
sum dis_dur, d
tabulate cough 
tabulate sputum
tabulate asthma0
tabulate polyp
tabulate chr_sin
tabulate mec_il
tabulate f_thrive
tabulate bulky_stool
tabulate prolapse
tabulate hypoprotein
tabulate edema
tabulate neonate_jaundice
tabulate short_stature
tabulate pbs
tabulate male_infertility
tabulate salty
tabulate sibling_cf
tabulate unexp_clubbing
tabulate pancrease_insuf
tabulate digital_clubbing
tabulate abnormal_lft
tabulate sinus_dis
tabulate malnutrition
tabulate decre_in_fvc
tabulate incr_in_resp_rate
tabulate bronchiectasis
tabulate constipation

//Clinical features by outcome2
sum dis_dur, d 
ttest dis_dur, by(outcome2) 
by outcome2, sort : sum dis_dur, d
ranksum dis_dur, by(outcome2)

//respiratory
tabulate cough outcome2, chi2 column
tabulate sputum outcome2, chi2 column
tabulate asthma0 outcome2, chi2 column
tabulate polyp outcome2, chi2 column
tabulate chr_sin outcome2, chi2 column
//gastrointestinal
tabulate mec_il outcome2, chi2 column
tabulate f_thrive outcome2, chi2 column
tabulate bulky_stool outcome2, chi2 column
tabulate prolapse outcome2, chi2 column
tabulate neonate_jaundice outcome2, chi2 column
tabulate constipation outcome2, chi2 column
//other
tabulate short_stature outcome2, chi2 column
tabulate pbs outcome2, chi2 column
tabulate male_infertility outcome2, chi2 column
tabulate salty outcome2, chi2 column
tabulate unexp_clubbing outcome2, chi2 column
//signs
tabulate edema outcome2, chi2 column
tabulate pancrease_insuf outcome2, chi2 column
tabulate digital_clubbing outcome2, chi2 column
tabulate abnormal_lft outcome2, chi2 column
tabulate sinus_dis outcome2, chi2 column
tabulate malnutrition outcome2, chi2 column
tabulate incr_in_resp_rate outcome2, chi2 column
tabulate bronchiectasis outcome2, chi2 column
tabulate decre_in_fvc outcome2, chi2 column
tabulate hypoprotein outcome2, chi2 column

//comorbidities by outcome
tabulate cf_diabetes outcome2, chi2 column
tabulate asthma outcome2, chi2 column
tabulate phtn outcome2, chi2 column
tabulate celiac_disease outcome2, chi2 column
tabulate cholelithiasis outcome2, chi2 column
tabulate abpa outcome2, chi2 column
tabulate pancreatitis outcome2, chi2 column
tabulate meconium_ileus outcome2, chi2 column
tabulate neo_hepa_syn outcome2, chi2 column

//comobidities
tabulate cf_diabetes
tabulate asthma
tabulate phtn
tabulate celiac_disease
tabulate cholelithiasis
tabulate abpa
tabulate pancreatitis
tabulate meconium_ileus
tabulate neo_hepa_syn

//investigation
sum hb, d 
sum tc, d 
sum plt, d
sum n, d
sum l, d 
sum e, d 
sum m, d 
sum rbs, d 
sum bil, d 
sum sgpt, d 
by outcome2, sort : sum hb, d 
by outcome2, sort : sum tc, d
by outcome2, sort : sum plt, d
by outcome2, sort : sum n, d
by outcome2, sort : sum l, d
by outcome2, sort : sum e, d
by outcome2, sort : sum m, d
by outcome2, sort : sum rbs, d
by outcome2, sort : sum bil, d
by outcome2, sort : sum sgpt, d         


tabulate stfat
tabulate cxray1 
tabulate cxray2
tabulate cxray3
tabulate cxray4




//investigation 
ttest hb, by(outcome2)
ttest tc, by(outcome2)
ttest plt, by(outcome2)
ttest n, by(outcome2)
ttest l, by(outcome2)
ttest e, by(outcome2)
ttest m, by(outcome2)
ttest rbs, by(outcome2)
ttest bil, by(outcome2)
ttest sgpt, by(outcome2)

ranksum hb, by(outcome2)
ranksum tc, by(outcome2)
ranksum plt, by(outcome2)
ranksum n, by(outcome2)
ranksum l, by(outcome2)
ranksum e, by(outcome2)
ranksum m, by(outcome2)
ranksum rbs, by(outcome2)
ranksum sgpt, by(outcome2)

tabulate stfat outcome2, chi2 column
tabulate cxray1 outcome2, chi2 column 
tabulate cxray2 outcome2, chi2 column
tabulate cxray3 outcome2, chi2 column 
tabulate cxray4 outcome2, chi2 column 
 
//organism and CS
tabulate aureus 
tabulate muc_aeru
tabulate kleb
tabulate acineto
tabulate strepto
tabulate e_coli 

tabulate aureus age_cat, chi2 row column
tabulate muc_aeru age_cat, chi2 row column
tabulate kleb age_cat, chi2 row column
tabulate acineto age_cat, chi2 row column
tabulate strepto age_cat, chi2 row column
tabulate e_coli age_cat, chi2 row column

tabulate aureus amoxicillin, row 
tabulate aureus ceftazidime, row 
tabulate aureus cefepime, row 
tabulate aureus tobramycin, row 
tabulate aureus timentin, row 
tabulate aureus aztreonam, row 
tabulate aureus vancomycin, row 
tabulate aureus piperacillin, row 
tabulate aureus imipenem, row 
tabulate aureus meropenem, row
tabulate aureus linezolid, row 
tabulate aureus cotrimoxazole, row 
tabulate aureus gentamicin, row 
tabulate aureus amikacin, row 
tabulate aureus erythromycin, row 
tabulate aureus ciprofloxacine, row
tabulate aureus levofloxacin, row  
tabulate aureus rifampicin, row 
tabulate aureus clindamycin, row

tabulate muc_aeru amoxicillin, row 
tabulate muc_aeru ceftazidime, row 
tabulate muc_aeru cefepime, row 
tabulate muc_aeru tobramycin, row 
tabulate muc_aeru timentin, row 
tabulate muc_aeru aztreonam, row 
tabulate muc_aeru vancomycin, row 
tabulate muc_aeru piperacillin, row 
tabulate muc_aeru imipenem, row 
tabulate muc_aeru meropenem, row
tabulate muc_aeru linezolid, row 
tabulate muc_aeru cotrimoxazole, row 
tabulate muc_aeru gentamicin, row 
tabulate muc_aeru amikacin, row 
tabulate muc_aeru erythromycin, row 
tabulate muc_aeru ciprofloxacine, row
tabulate muc_aeru levofloxacin, row  
tabulate muc_aeru rifampicin, row 
tabulate muc_aeru clindamycin, row

tabulate kleb amoxicillin, row 
tabulate kleb ceftazidime, row 
tabulate kleb cefepime, row 
tabulate kleb tobramycin, row 
tabulate kleb timentin, row 
tabulate kleb aztreonam, row 
tabulate kleb vancomycin, row 
tabulate kleb piperacillin, row 
tabulate kleb imipenem, row 
tabulate kleb meropenem, row
tabulate kleb linezolid, row 
tabulate kleb cotrimoxazole, row 
tabulate kleb gentamicin, row 
tabulate kleb amikacin, row 
tabulate kleb erythromycin, row 
tabulate kleb ciprofloxacine, row
tabulate kleb levofloxacin, row  
tabulate kleb rifampicin, row 
tabulate kleb clindamycin, row

tabulate acineto amoxicillin, row 
tabulate acineto ceftazidime, row 
tabulate acineto cefepime, row 
tabulate acineto tobramycin, row 
tabulate acineto timentin, row 
tabulate acineto aztreonam, row 
tabulate acineto vancomycin, row 
tabulate acineto piperacillin, row 
tabulate acineto imipenem, row 
tabulate acineto meropenem, row
tabulate acineto linezolid, row 
tabulate acineto cotrimoxazole, row 
tabulate acineto gentamicin, row 
tabulate acineto amikacin, row 
tabulate acineto erythromycin, row 
tabulate acineto ciprofloxacine, row
tabulate acineto levofloxacin, row  
tabulate acineto rifampicin, row 
tabulate acineto clindamycin, row

tabulate strepto amoxicillin, row 
tabulate strepto ceftazidime, row 
tabulate strepto cefepime, row 
tabulate strepto tobramycin, row 
tabulate strepto timentin, row 
tabulate strepto aztreonam, row 
tabulate strepto vancomycin, row 
tabulate strepto piperacillin, row 
tabulate strepto imipenem, row 
tabulate strepto meropenem, row
tabulate strepto linezolid, row 
tabulate strepto cotrimoxazole, row 
tabulate strepto gentamicin, row 
tabulate strepto amikacin, row 
tabulate strepto erythromycin, row 
tabulate strepto ciprofloxacine, row
tabulate strepto levofloxacin, row  
tabulate strepto rifampicin, row 
tabulate strepto clindamycin, row

tabulate e_coli amoxicillin, row 
tabulate e_coli ceftazidime, row 
tabulate e_coli cefepime, row 
tabulate e_coli tobramycin, row 
tabulate e_coli timentin, row 
tabulate e_coli aztreonam, row 
tabulate e_coli vancomycin, row 
tabulate e_coli piperacillin, row 
tabulate e_coli imipenem, row 
tabulate e_coli meropenem, row
tabulate e_coli linezolid, row 
tabulate e_coli cotrimoxazole, row 
tabulate e_coli gentamicin, row 
tabulate e_coli amikacin, row 
tabulate e_coli erythromycin, row 
tabulate e_coli ciprofloxacine, row
tabulate e_coli levofloxacin, row  
tabulate e_coli rifampicin, row 
tabulate e_coli clindamycin, row

tabulate aureus outcome2, chi2 exact row
tabulate muc_aeru outcome2, chi2 exact row
tabulate kleb outcome2, chi2 exact row
tabulate acineto outcome2, chi2 exact row
tabulate strepto outcome2, chi2 exact row
tabulate e_coli outcome2, chi2 exact row



