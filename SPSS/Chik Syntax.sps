﻿* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
T-TEST GROUPS=Joint_pain(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=Age
  /CRITERIA=CI(.95).

COMPUTE agegr60= age >59=1.
EXECUTE.

COMPUTE agegr32= age >31=1.
EXECUTE.

CROSSTABS
  /TABLES=Joint_pain BY agegr32
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.