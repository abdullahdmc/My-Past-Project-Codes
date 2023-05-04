* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=Depression_cat Anx_cat Stress_cat BY LR_Age_group_2
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=Depression_cat Anx_cat Stress_cat BY LR_Age_group_2
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=LR_sex LR_Marital_stats2 LR_Residence_2 Education_4 LR_HCW LR_Income_cat Job_stat bus_stat kn_fb BY LR_Age_group_2
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

DATASET ACTIVATE DataSet1.
CROSSTABS
  /TABLES=kn_fb BY LR_Age_group_2
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


*Anxiety

CROSSTABS
  /TABLES=LR_Age_group_2 LR_sex LR_Marital_stats2 LR_Residence_2 Occupation_2 Education_4 LR_HCW LR_Income_cat Job_stat bus_stat kn_fb BY Anx_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Depression

CROSSTABS
  /TABLES=LR_Age_group_2 LR_sex LR_Marital_stats2 LR_Residence_2 Occupation_2 Education_4 LR_HCW LR_Income_cat Job_stat bus_stat kn_fb BY Depression_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Stress 

CROSSTABS
  /TABLES=LR_Age_group_2 LR_sex LR_Marital_stats2 LR_Residence_2 Occupation_2 Education_4 LR_HCW LR_Income_cat Job_stat bus_stat kn_fb BY Stress_cat
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


RELIABILITY
  /VARIABLES=dep1 dep2 dep3 dep4 dep5 dep6 dep7 dep8 dep9
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=anx1 anx2 anx3 amx4 anx5 anx6 anx7
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=str1 str2 str3 str4 str5 str6 str7 str8 str9 str10
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.
