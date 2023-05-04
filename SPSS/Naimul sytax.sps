* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
IF  (Cough1 >= 1 | Cough2 >= 1 | Cough3 >= 1 | Cough4 >= 1 | Cough5 >= 1 | Cough6 >= 1| Cough7 >= 1| Cough8 >= 1) cough=1.
EXECUTE.

IF  (Myalgia1 >= 1 | Myalgia2 >= 1 | Myalgia3 >= 1 | Myalgia4 >= 1 | Myalgia5 >= 1 | Myalgia6 >= 1| Myalgia7 >= 1| Myalgia8 >= 1) myalgia=1.
EXECUTE.

IF  (Fever1 >= 1 | Fever2 >= 1 | Fever3 >= 1 | Fever4 >= 1 | Fever5 >= 1 | Fever6 >= 1| Fever7 >= 1| Fever8 >= 1) fever=1.
EXECUTE.

IF  (Sorethroat1 >= 1 | Sorethroat2 >= 1 | Sorethroat3 >= 1 | Sorethroat4 >= 1 | Sorethroat5 >= 1 | Sorethroat6 >= 1| Sorethroat7 >= 1| Sorethroat8 >= 1) sorethroat=1.
EXECUTE.

IF  (Headache1 >= 1 | Headache2 >= 1 | Headache3 >= 1 | Headache4 >= 1 | Headache5 >= 1 | Headache6 >= 1| Headache7 >= 1| Headache8 >= 1) headache=1.
EXECUTE.

IF  (Anosmia1 >= 1 | Anosmia2 >= 1 | Anosmia3 >= 1 | Anosmia4 >= 1 | Anosmia5 >= 1 | Anosmia6 >= 1| Anosmia7 >= 1| Anosmia8 >= 1) anosmia=1.
EXECUTE.

IF  (GIsymptoms1 >= 1 | GIsymptoms2 >= 1 | GIsymptoms3 >= 1 | GIsymptoms4 >= 1 | GIsymptoms5 >= 1 | GIsymptoms6 >= 1| GIsymptoms7 >= 1| GIsymptoms8 >= 1) gisymptoms=1.
EXECUTE.

IF  (Dyspnoea1 >= 1 | Dyspnoea2 >= 1 | Dyspnoea3 >= 1 | Dyspnoea4>= 1 | Dyspnoea5 >= 1 | Dyspnoea6 >= 1| Dyspnoea7 >= 1| Dyspnoea8>= 1) dyspnoea=1.
EXECUTE.



RECODE cough (SYSMIS=0).
RECODE myalgia (SYSMIS=0).
RECODE fever (SYSMIS=0).
RECODE sorethroat (SYSMIS=0).
RECODE headache (SYSMIS=0).
RECODE anosmia (SYSMIS=0).
RECODE gisymptoms (SYSMIS=0).
RECODE dyspnoea (SYSMIS=0).
EXECUTE.

IF  (Cough1 = 1) coughs = 1.
IF  (Cough2 = 2) coughs = 2.
IF (Cough3 = 3) coughs = 3.
IF (Cough4 = 4) coughs = 4.
IF (Cough5 = 5) coughs = 5.
IF (Cough6 = 6) coughs = 6.
IF (Cough7 = 7) coughs = 7.
IF (Cough8 =8) coughs = 8.
EXECUTE.
 
IF  (Myalgia1 = 1) Myalgias = 1.
IF  (Myalgia2 = 2) Myalgias = 2.
IF (Myalgia3 = 3) Myalgias = 3.
IF (Myalgia4 = 4) Myalgias = 4.
IF (Myalgia5 = 5) Myalgias = 5.
IF (Myalgia6 = 6) Myalgias = 6.
IF (Myalgia7 = 7) Myalgias = 7.
IF (Myalgia8 = 8) Myalgias = 8.
EXECUTE.

IF (Fever1 = 1) Fevers = 1.
IF (Fever2 = 2) Fevers = 2.
IF (Fever3 = 3) Fevers = 3.
IF (Fever4 = 4) Fevers = 4.
IF (Fever5 = 5) Fevers = 5.
IF (Fever6 = 6) Fevers = 6.
IF (Fever7 = 7) Fevers = 7.
IF (Fever8 = 8) Fevers = 8.
EXECUTE.

IF (Sorethroat1 = 1) Sorethroats = 1.
IF (Sorethroat2 = 2) Sorethroats = 2.
IF (Sorethroat3 = 3) Sorethroats = 3.
IF (Sorethroat4 = 4) Sorethroats = 4.
IF (Sorethroat5 = 5) Sorethroats = 5.
IF (Sorethroat6 = 6) Sorethroats = 6.
IF (Sorethroat7 = 7) Sorethroats = 7.
IF (Sorethroat8 = 8) Sorethroats = 8.
EXECUTE.

IF (Headache1 = 1) Headaches = 1.
IF (Headache2 = 2) Headaches = 2.
IF (Headache3 = 3) Headaches = 3.
IF (Headache4 = 4) Headaches = 4.
IF (Headache5 = 5) Headaches = 5.
IF (Headache6 = 6) Headaches = 6.
IF (Headache7 = 7) Headaches = 7.
IF (Headache8 = 8) Headaches = 8.
EXECUTE.

IF (Anosmia1 = 1) Anosmias = 1.
IF (Anosmia2 = 2) Anosmias = 2.
IF (Anosmia3 = 3) Anosmias = 3.
IF (Anosmia4 = 4) Anosmias = 4.
IF (Anosmia5 = 5) Anosmias = 5.
IF (Anosmia6 = 6) Anosmias = 6.
IF (Anosmia7 = 7) Anosmias = 7.
IF (Anosmia8 = 8) Anosmias = 8.
EXECUTE.

IF (GIsymptoms1 = 1) GIsymptomss = 1.
IF (GIsymptoms2 = 2) GIsymptomss = 2.
IF (GIsymptoms3 = 3) GIsymptomss = 3.
IF (GIsymptoms4 = 4) GIsymptomss = 4.
IF (GIsymptoms5 = 5) GIsymptomss = 5.
IF (GIsymptoms6 = 6) GIsymptomss = 6.
IF (GIsymptoms7 = 7) GIsymptomss = 7.
IF (GIsymptoms8 = 8) GIsymptomss = 8.
EXECUTE.

IF (Dyspnoea1 = 1) Dyspnoeas = 1.
IF (Dyspnoea2 = 2) Dyspnoeas = 2.
IF (Dyspnoea3 = 3) Dyspnoeas = 3.
IF (Dyspnoea4 = 4) Dyspnoeas = 4.
IF (Dyspnoea5 = 5) Dyspnoeas = 5.
IF (Dyspnoea6 = 6) Dyspnoeas = 6.
IF (Dyspnoea7 = 7) Dyspnoeas = 7.
IF (Dyspnoea8 = 8) Dyspnoeas = 8.
EXECUTE.

DATASET ACTIVATE DataSet1.
AUTORECODE VARIABLES=Honey 
  /INTO honey1 
  /PRINT.

AUTORECODE VARIABLES=BlackCuminKalijira 
  /INTO black_cumin1
  /PRINT. 

AUTORECODE VARIABLES=Lemon
  /INTO lemon1
  /PRINT. 

AUTORECODE VARIABLES=AnyspicesMasala
  /INTO masala
  /PRINT. 


RECODE honey1 black_cumin1 lemon1 masala (2=1) (1=0).
EXECUTE.

AUTORECODE VARIABLES=Homeisolation 
  /INTO isolation
  /PRINT.

AUTORECODE VARIABLES=Generalwardadmission
  /INTO admission 
  /PRINT.

AUTORECODE VARIABLES=ICUadmission 
  /INTO icuadmit
  /PRINT.

AUTORECODE VARIABLES=AntibioticlikeazithromycinDoxycycline
  /INTO antibiotic1
  /PRINT.

AUTORECODE VARIABLES=Ivermectin
  /INTO ivermectin1
   /PRINT.

AUTORECODE VARIABLES=Hydroxychloroquine
  /INTO hcq
  /PRINT.

AUTORECODE VARIABLES=Antihistamine
  /INTO antihist
  /PRINT.

AUTORECODE VARIABLES=Steroids
  /INTO steroid
  /PRINT.

DATASET ACTIVATE DataSet1.
AUTORECODE VARIABLES=O2therapy
  /INTO o2
  /PRINT.

RECODE honey1 black_cumin1 lemon1 masala (2=1) (1=0).
EXECUTE.



DATASET ACTIVATE DataSet1.
RECODE age (24 thru 35=1) (36 thru 45=2) (46 thru Highest=3) INTO agegr.
EXECUTE.


DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=agegr gender workplace icu department health_care_cat position
  /ORDER=ANALYSIS.
