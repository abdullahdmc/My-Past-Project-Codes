* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
RECODE DM HTN asthema IHD (SYSMIS=0).
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.


CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=any_adv BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

DATASET ACTIVATE DataSet1.
RECODE Group (6=4)(4=5) (5=6).
EXECUTE.

DATASET ACTIVATE DataSet1.
RECODE dm htn asthma ihd (0=2).
EXECUTE.

IF  (dm = 1 | htn = 1 | asthma = 1 | ihd = 1) any_com=1.
EXECUTE.

RECODE any_com (SYSMIS=2).
EXECUTE.

COMPUTE tot_com=dm + htn + asthma + ihd.
EXECUTE.

MEANS TABLES=dur_dis BY group
  /CELLS=COUNT MEAN STDDEV MIN MAX.

*Age by groups 

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=age_grp BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*sex by groups 

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=sex BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*Residence by group 

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=residence BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*income by group



CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.
  

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=income BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*occupation by group

RECODE occupation (1 thru 2 = 1) (3 = 2) (4 thru 7 = 3) into occupation2.
EXECUTE. 

FREQUENCIES occupation2. 

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=occupation2 BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*Severity by group

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=severity BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*Comorbidities 

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=dm htn ihd asthma BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*any_com by group

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_com BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*duration disease by severity

T-TEST GROUPS=group(1 4)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(2 4)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(3 4)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).


T-TEST GROUPS=group(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).


T-TEST GROUPS=group(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).


T-TEST GROUPS=group(5 7)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(6 7)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(5 6)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(1 5)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(1 6)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(2 5)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(2 6)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(3 5)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(3 6)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(4 7)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

*age by groups


DATASET ACTIVATE DataSet1.
MEANS TABLES=age BY group
  /CELLS=MEAN COUNT STDDEV MEDIAN MIN MAX.

T-TEST GROUPS=group(1 4)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(2 4)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(3 4)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).


T-TEST GROUPS=group(1 3)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).


T-TEST GROUPS=group(2 3)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).


T-TEST GROUPS=group(5 7)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(6 7)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(5 6)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(1 5)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(1 6)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(2 5)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(2 6)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(3 5)
  /MISSING=ANALYSIS
  /VARIABLES=dur_dis
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(3 6)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

T-TEST GROUPS=group(4 7)
  /MISSING=ANALYSIS
  /VARIABLES=age
  /CRITERIA=CI(.95).

*adverse event by groups

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=any_adv BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*outcome by groups

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 2).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 2(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 3).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 3(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 6 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 6 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 5).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 5(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 6).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 6(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

USE ALL.
COMPUTE filter_$=(Group = 4 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 4 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CROSSTABS
  /TABLES=outcome BY Group
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).

FILTER OFF.
USE ALL.
EXECUTE.

*log regression table for outcome

USE ALL.
COMPUTE filter_$=(Group = 1 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 1 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


LOGISTIC REGRESSION VARIABLES outcome2
  /METHOD=ENTER age sex dur_dis severity2 any_com group 
  /CONTRAST (sex)=Indicator
  /CONTRAST (severity2)=Indicator
  /CONTRAST (any_com)=Indicator(1)
  /CONTRAST (group)=Indicator
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

USE ALL.
COMPUTE filter_$=(Group = 2 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 2 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

LOGISTIC REGRESSION VARIABLES outcome2
  /METHOD=ENTER age sex dur_dis severity2 any_com group 
  /CONTRAST (sex)=Indicator
  /CONTRAST (severity2)=Indicator
  /CONTRAST (any_com)=Indicator(1)
  /CONTRAST (group)=Indicator
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

USE ALL.
COMPUTE filter_$=(Group = 3 | Group = 4).
VARIABLE LABELS filter_$ 'Group = 3 | Group = 4(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

LOGISTIC REGRESSION VARIABLES outcome2
  /METHOD=ENTER age sex dur_dis severity2 any_com group 
  /CONTRAST (sex)=Indicator
  /CONTRAST (severity2)=Indicator
  /CONTRAST (any_com)=Indicator(1)
  /CONTRAST (group)=Indicator
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

USE ALL.
COMPUTE filter_$=(Group = 5 | Group = 7).
VARIABLE LABELS filter_$ 'Group = 5 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


LOGISTIC REGRESSION VARIABLES outcome2
  /METHOD=ENTER age sex dur_dis severity2 any_com group 
  /CONTRAST (sex)=Indicator
  /CONTRAST (severity2)=Indicator
  /CONTRAST (any_com)=Indicator(1)
  /CONTRAST (group)=Indicator
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

USE ALL.
COMPUTE filter_$=(Group = 6 | Group =7).
VARIABLE LABELS filter_$ 'Group = 6 | Group = 7(FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


LOGISTIC REGRESSION VARIABLES outcome2
  /METHOD=ENTER age dur_dis severity2 any_com group 
  /CONTRAST (severity2)=Indicator
  /CONTRAST (any_com)=Indicator(1)
  /CONTRAST (group)=Indicator
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

FILTER OFF.
USE ALL.
EXECUTE.


LOGISTIC REGRESSION VARIABLES outcome2
  /METHOD=ENTER age sex dur_dis severity2 any_com group 
  /CONTRAST (sex)=Indicator
  /CONTRAST (severity2)=Indicator
  /CONTRAST (any_com)=Indicator(1)
  /CONTRAST (group)=Indicator
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).



COMMENT BOOKMARK;LINE_NUM=76;ID=1.
COMMENT BOOKMARK;LINE_NUM=345;ID=2.
COMMENT BOOKMARK;LINE_NUM=614;ID=3.
COMMENT BOOKMARK;LINE_NUM=892;ID=4.
COMMENT BOOKMARK;LINE_NUM=1171;ID=5.
COMMENT BOOKMARK;LINE_NUM=1453;ID=6.
COMMENT BOOKMARK;LINE_NUM=1722;ID=7.
COMMENT BOOKMARK;LINE_NUM=1999;NAME=8;ID=8.
COMMENT BOOKMARK;LINE_NUM=2268;ID=9.
