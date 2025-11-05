;; -------------------------------------------------------
;; kb.metta
;; Emergency disease facts
;; Corrected for types and invisible characters
;; -------------------------------------------------------

;; Initialize knowledge base space
!(bind! &kb (new-space))

;; ------------------------------
;; Pneumonia
!(add-atom &kb Fact_Pneumonia_fever        (HasSymptom Pneumonia fever))
!(add-atom &kb Fact_Pneumonia_cough        (HasSymptom Pneumonia cough))
!(add-atom &kb Fact_Pneumonia_fatigue      (HasSymptom Pneumonia fatigue))
!(add-atom &kb Fact_Pneumonia_Antibiotics  (HasTreatment Pneumonia Antibiotics))
!(add-atom &kb Fact_Pneumonia_Fluids       (HasTreatment Pneumonia Fluids))

;; ------------------------------
;; Heart attack
!(add-atom &kb Fact_Heart_attack_chest_pain        (HasSymptom Heart_attack chest_pain))
!(add-atom &kb Fact_Heart_attack_shortness_of_breath (HasSymptom Heart_attack shortness_of_breath))
!(add-atom &kb Fact_Heart_attack_nausea            (HasSymptom Heart_attack nausea))
!(add-atom &kb Fact_Heart_attack_Aspirin          (HasTreatment Heart_attack Aspirin))
!(add-atom &kb Fact_Heart_attack_Nitroglycerin    (HasTreatment Heart_attack Nitroglycerin))

;; ------------------------------
;; Drug Reaction
!(add-atom &kb Fact_Drug_Reaction_rash         (HasSymptom Drug_Reaction rash))
!(add-atom &kb Fact_Drug_Reaction_swelling     (HasSymptom Drug_Reaction swelling))
!(add-atom &kb Fact_Drug_Reaction_itching      (HasSymptom Drug_Reaction itching))
!(add-atom &kb Fact_Drug_Reaction_Antihistamines   (HasTreatment Drug_Reaction Antihistamines))
!(add-atom &kb Fact_Drug_Reaction_Stop_offending_drug (HasTreatment Drug_Reaction Stop_offending_drug))

;; ------------------------------
;; Hypertension
!(add-atom &kb Fact_Hypertension_headache      (HasSymptom Hypertension headache))
!(add-atom &kb Fact_Hypertension_dizziness     (HasSymptom Hypertension dizziness))
!(add-atom &kb Fact_Hypertension_Beta_blockers (HasTreatment Hypertension Beta_blockers))
!(add-atom &kb Fact_Hypertension_ACE_inhibitors (HasTreatment Hypertension ACE_inhibitors))

;; ------------------------------
;; Paralysis (brain hemorrhage)
!(add-atom &kb Fact_Paralysis_brain_hemorrhage_weakness      (HasSymptom Paralysis_brain_hemorrhage weakness))
!(add-atom &kb Fact_Paralysis_brain_hemorrhage_confusion     (HasSymptom Paralysis_brain_hemorrhage confusion))
!(add-atom &kb Fact_Paralysis_brain_hemorrhage_loss_of_balance (HasSymptom Paralysis_brain_hemorrhage loss_of_balance))
!(add-atom &kb Fact_Paralysis_brain_hemorrhage_Supportive_meds (HasTreatment Paralysis_brain_hemorrhage Supportive_meds))
!(add-atom &kb Fact_Paralysis_brain_hemorrhage_Physiotherapy (HasTreatment Paralysis_brain_hemorrhage Physiotherapy))

;; ------------------------------
;; Jaundice
!(add-atom &kb Fact_Jaundice_yellow_skin      (HasSymptom Jaundice yellow_skin))
!(add-atom &kb Fact_Jaundice_fatigue          (HasSymptom Jaundice fatigue))
!(add-atom &kb Fact_Jaundice_Rest             (HasTreatment Jaundice Rest))
!(add-atom &kb Fact_Jaundice_Fluids           (HasTreatment Jaundice Fluids))

;; ------------------------------
;; Malaria
!(add-atom &kb Fact_Malaria_fever      (HasSymptom Malaria fever))
!(add-atom &kb Fact_Malaria_chills     (HasSymptom Malaria chills))
!(add-atom &kb Fact_Malaria_headache   (HasSymptom Malaria headache))
!(add-atom &kb Fact_Malaria_Chloroquine (HasTreatment Malaria Chloroquine))
!(add-atom &kb Fact_Malaria_Artesunate (HasTreatment Malaria Artesunate))

;; ------------------------------
;; Chickenpox
!(add-atom &kb Fact_Chickenpox_rash     (HasSymptom Chickenpox rash))
!(add-atom &kb Fact_Chickenpox_fever    (HasSymptom Chickenpox fever))
!(add-atom &kb Fact_Chickenpox_itching  (HasSymptom Chickenpox itching))
!(add-atom &kb Fact_Chickenpox_Antivirals    (HasTreatment Chickenpox Antivirals))
!(add-atom &kb Fact_Chickenpox_Calamine_lotion (HasTreatment Chickenpox Calamine_lotion))

;; ------------------------------
;; Dengue
!(add-atom &kb Fact_Dengue_fever     (HasSymptom Dengue fever))
!(add-atom &kb Fact_Dengue_rash      (HasSymptom Dengue rash))
!(add-atom &kb Fact_Dengue_joint_pain (HasSymptom Dengue joint_pain))
!(add-atom &kb Fact_Dengue_Paracetamol (HasTreatment Dengue Paracetamol))
!(add-atom &kb Fact_Dengue_IV_fluids   (HasTreatment Dengue IV_fluids))

;; ------------------------------
;; Typhoid
!(add-atom &kb Fact_Typhoid_fever          (HasSymptom Typhoid fever))
!(add-atom &kb Fact_Typhoid_abdominal_pain (HasSymptom Typhoid abdominal_pain))
!(add-atom &kb Fact_Typhoid_diarrhea       (HasSymptom Typhoid diarrhea))
!(add-atom &kb Fact_Typhoid_Ceftriaxone    (HasTreatment Typhoid Ceftriaxone))
!(add-atom &kb Fact_Typhoid_Azithromycin   (HasTreatment Typhoid Azithromycin))

;; ------------------------------
;; Tuberculosis
!(add-atom &kb Fact_Tuberculosis_cough       (HasSymptom Tuberculosis cough))
!(add-atom &kb Fact_Tuberculosis_weight_loss (HasSymptom Tuberculosis weight_loss))
!(add-atom &kb Fact_Tuberculosis_night_sweats (HasSymptom Tuberculosis night_sweats))
!(add-atom &kb Fact_Tuberculosis_Rifampin    (HasTreatment Tuberculosis Rifampin))
!(add-atom &kb Fact_Tuberculosis_Isoniazid   (HasTreatment Tuberculosis Isoniazid))
