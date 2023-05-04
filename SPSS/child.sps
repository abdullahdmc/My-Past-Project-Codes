* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
RECODE Sex (2=0).
EXECUTE.

T-TEST GROUPS=Passive_smoking(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=FVC FEV1 FEV1_FVC_ratio PEF FEF_25_75
  /CRITERIA=CI(.95).

T-TEST GROUPS=Family_ho_atopy(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=FVC FEV1 FEV1_FVC_ratio PEF FEF_25_75
  /CRITERIA=CI(.95).

USE ALL.
COMPUTE filter_$=(Passive_smoking = 2).
VARIABLE LABELS filter_$ 'Passive_smoking = 2 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

COMPUTE Length.m= (Length/100).
EXECUTE.


 
