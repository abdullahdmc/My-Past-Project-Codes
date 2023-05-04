* Encoding: UTF-8.
*WHO BREF score calculations

recode q3 (1=5) (2=4) (3=3) (4=2) (5=1) into iq3.
recode q4 (1=5) (2=4) (3=3) (4=2) (5=1) into iq4.
recode q26 (1=5) (2=4) (3=3) (4=2) (5=1) into iq26.
execute. 

recode q21 (sysmis=0).
execute.

*Domain score for 0-20 scale direct calculation

compute dom1=mean.6(iq3,iq4,q10,q15,q16,q17,q18)*4.
compute dom2=mean.5(q5,q6,q7,q11,q19,iq26)*4. 
compute dom3=mean.2(q20,q21,q22)*4.
compute dom4=mean.6(q8,q9,q12,q13,q14,q23,q24,q25)*4.
execute. 

*Domain score calculation3 for 0-100 scale

compute dom1= iq3+iq4+q10+q15+q16+q17+q18.
compute dom2= q5+q6+q7+q11+q19+iq26.
compute dom3=q20+q21+q22.
compute dom4=q8+q9+q12+q13+q14+q23+q24+q25.
execute. 

*Transforming score for 0-100 scale

recode dom1 (7=0) (8=6) (9=6) (10=13) (11=13) (12=19) (13=19) (14=25) (15=31) (16=31) (17=38) (18=38) (19=44) (20=44) 
(21=50) (22=56) (23=56) (24=63) (25=63) (26=69) (27=69) (28=75) (29=81) (30=81) (31=88) (32=88) (33=94) (34=94) (35=100) into phy. 
recode dom2 (6=0) (7=6) (8=6) (9=13) (10=19) (11=19) (12=25) (13=31) (14=31) (15=38) (16=44) (17=44) (18=50) (19=56) 
(20=56) (21=63) (22=69) (23=69) (24=75) (25=81) (26=81) (27=88) (28=94) (29=94) (30=100) into psy. 
recode dom3 (3=0) (4=6) (5=19) (6=25) (7=31) (8=44) (9=50) (10=56) (11=69) (12=75) (13=81) (14=94) (15=100) into soci.
recode dom4 (8=0) (9=6) (10=6) (11=13) (12=13) (13=19) (14=19) (15=25) (16=25) (17=31) (18=31) (19=38) (20=38) (21=44) 
(22=44) (23=50) (24=50) (25=56) (26=56) (27=63) (28=63) (29=69) (30=69) (31=75) (32=75) (33=81) (34=81) (35=88) (36=88) (37=94) (38=94) (39=100) (40=100) into envi.   
execute.  


*checking normality of domain scores (appears to be normal from histogram)


DATASET ACTIVATE DataSet1.
EXAMINE VARIABLES=phy psy soci envi
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.



