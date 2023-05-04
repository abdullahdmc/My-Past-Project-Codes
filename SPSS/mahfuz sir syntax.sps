* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
IF  (fever_1st = 1 | fatigue_1st = 1 | anorexia_1st = 1 | weight_loss_1st  = 1 | dyspnoea = 1 | 
    chest_pain_1st = 1 | cough_1st = 1 | palpi_1st = 1 | hemoptysis_1st = 1 | headache_1st =1  | 
    dysguesia_1st = 1 | dysosmia_1st = 1 | alte_consci_1st = 1 | slp_dist_1st = 1 | dizziness_1st = 1 | 
    vertigo_1st = 1 | weakness_1st = 1 | cran_neuro_1st = 1 | sens_disturb_1st = 1 | seizure_1st = 1 | 
    psy_anx_dep_del_hallu_1st = 1 | depressed_1st = 1 | anxious_1st = 1 |  vomiting_1st = 1 | 
    alt_of_bow_1st = 1 | abd_pain_1st = 1 | joint_pain_1st = 1 | caf_bdyac_lbm_pain_1st = 1 | 
    limb_pain_1st = 1 | skin_rash_1st = 1 | loss_of_hair_1st = 1 | loss_of_hearing_1st = 1 |  restless 
    = 1 | sweating = 1 ) fw_1=1.
EXECUTE.

IF  (fevere_2nd = 1 | fatigue_2nd = 1 | anorexia_2nd = 1 | dyspnoea_2nd = 1 | chest_pain_2nd = 1 | 
    headache_2nd = 1 | cough_2nd = 1 | palpi_2nd =  1 | slp_distur_2nd = 1 | dizz_2nd = 1 | vertigo_2nd 
    = 1 | constipation_2nd = 1 | bodyache_2nd = 1 | vomiting = 1 | joint_pain_2nd = 1 | limb_pain_2nd = 
    1 | skin_rush = 1 ) fw_2=1.
EXECUTE.



IF  (fever_3rd = 1 | fatigue_3rd = 1 | anorexia_3rd = 1 | dyspnoea_3rd = 1 | chest_pain_3rd = 1 | 
    cough_3rd = 1 | palpi_3rd = 1 | bodyache_3rd = 1 | slp_distur_3rd = 1 | vertigo_3rd = 1 | 
    constipation_3rd = 1 | limb_pain_3rd = 1 | headache = 1 | joint_pain = 1) fw_3=1.
EXECUTE.
