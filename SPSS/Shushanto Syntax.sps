﻿* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
RECODE age_gr (0=2).
EXECUTE.

T-TEST PAIRS=pre_trans_plt_count WITH pst_trans_plt_count (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


*Nonparametric Tests: Related Samples. 
NPTESTS 
  /RELATED TEST(pre_trans_plt_count pst_trans_plt_count) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

CROSSTABS
  /TABLES=pre_trans_bleed_grd BY bl
  /FORMAT=AVALUE TABLES
  /STATISTICS=MCNEMAR 
  /CELLS=COUNT 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


*Nonparametric Tests: Independent Samples. 
NPTESTS 
  /INDEPENDENT TEST (cci) GROUP (age_gr) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.
