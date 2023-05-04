* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
COMPUTE neonate=Age_M <= 11 | Age_Y = 1.
EXECUTE.

RECODE neonate (SYSMIS=2).
EXECUTE.

CROSSTABS
  /TABLES=Fever Headache Vomiting Abdominal_pain Anuria Nausea Hypotension Dehydration Loose_motion 
    Rash Ascities Pleural_effusion Extended_syndrome Cough_Cold Respiratory_distress Plasma_leakage 
    Warning_sign BY neonate
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT TOTAL SRESID 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


CROSSTABS
  /TABLES=ICU_Oedema BY neonate
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT TOTAL SRESID 
  /COUNT ROUND CELL
  /METHOD=EXACT TIMER(5).


