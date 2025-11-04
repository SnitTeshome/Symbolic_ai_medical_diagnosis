;; -------------------------------------------------------
;; rules.metta
;; Binary-premise rules mapping symptom pairs -> disease
;; -------------------------------------------------------

;; Rule1: Pneumonia (fever, cough, fatigue)
!(add-atom &rb fever-cough-pneumonia-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d cough)
       (HasSymptom $d Pneumonia)))

!(add-atom &rb fever-fatigue-pneumonia-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d fatigue)
       (HasSymptom $d Pneumonia)))

!(add-atom &rb cough-fatigue-pneumonia-rule
   (-> (HasSymptom $d cough)
       (HasSymptom $d fatigue)
       (HasSymptom $d Pneumonia)))

;; Rule2: Heart Attack (chest_pain, shortness_of_breath, nausea)
!(add-atom &rb chestpain-shortness-heartattack-rule
   (-> (HasSymptom $d chest_pain)
       (HasSymptom $d shortness_of_breath)
       (HasSymptom $d Heart_attack)))

!(add-atom &rb chestpain-nausea-heartattack-rule
   (-> (HasSymptom $d chest_pain)
       (HasSymptom $d nausea)
       (HasSymptom $d Heart_attack)))

!(add-atom &rb shortness-nausea-heartattack-rule
   (-> (HasSymptom $d shortness_of_breath)
       (HasSymptom $d nausea)
       (HasSymptom $d Heart_attack)))

;; Rule3: Drug Reaction (rash, swelling, itching)
!(add-atom &rb rash-swelling-drugreaction-rule
   (-> (HasSymptom $d rash)
       (HasSymptom $d swelling)
       (HasSymptom $d Drug_Reaction)))

!(add-atom &rb rash-itching-drugreaction-rule
   (-> (HasSymptom $d rash)
       (HasSymptom $d itching)
       (HasSymptom $d Drug_Reaction)))

!(add-atom &rb swelling-itching-drugreaction-rule
   (-> (HasSymptom $d swelling)
       (HasSymptom $d itching)
       (HasSymptom $d Drug_Reaction)))

;; Rule4: Hypertension (headache, dizziness)
!(add-atom &rb headache-dizziness-hypertension-rule
   (-> (HasSymptom $d headache)
       (HasSymptom $d dizziness)
       (HasSymptom $d Hypertension)))

;; Rule5: Paralysis (brain hemorrhage) (weakness, confusion, loss_of_balance)
!(add-atom &rb weakness-confusion-paralysis-rule
   (-> (HasSymptom $d weakness)
       (HasSymptom $d confusion)
       (HasSymptom $d Paralysis_brain_hemorrhage)))

!(add-atom &rb weakness-lossbalance-paralysis-rule
   (-> (HasSymptom $d weakness)
       (HasSymptom $d loss_of_balance)
       (HasSymptom $d Paralysis_brain_hemorrhage)))

!(add-atom &rb confusion-lossbalance-paralysis-rule
   (-> (HasSymptom $d confusion)
       (HasSymptom $d loss_of_balance)
       (HasSymptom $d Paralysis_brain_hemorrhage)))

;; Rule6: Jaundice (yellow_skin, fatigue)
!(add-atom &rb yellowskin-fatigue-jaundice-rule
   (-> (HasSymptom $d yellow_skin)
       (HasSymptom $d fatigue)
       (HasSymptom $d Jaundice)))

;; Rule7: Malaria (fever, chills, headache)
!(add-atom &rb fever-chills-malaria-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d chills)
       (HasSymptom $d Malaria)))

!(add-atom &rb fever-headache-malaria-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d headache)
       (HasSymptom $d Malaria)))

!(add-atom &rb chills-headache-malaria-rule
   (-> (HasSymptom $d chills)
       (HasSymptom $d headache)
       (HasSymptom $d Malaria)))

;; Rule8: Chickenpox (rash, fever, itching)
!(add-atom &rb rash-fever-chickenpox-rule
   (-> (HasSymptom $d rash)
       (HasSymptom $d fever)
       (HasSymptom $d Chickenpox)))

!(add-atom &rb rash-itching-chickenpox-rule
   (-> (HasSymptom $d rash)
       (HasSymptom $d itching)
       (HasSymptom $d Chickenpox)))

!(add-atom &rb fever-itching-chickenpox-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d itching)
       (HasSymptom $d Chickenpox)))

;; Rule9: Dengue (fever, rash, joint_pain)
!(add-atom &rb fever-rash-dengue-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d rash)
       (HasSymptom $d Dengue)))

!(add-atom &rb fever-jointpain-dengue-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d joint_pain)
       (HasSymptom $d Dengue)))

!(add-atom &rb rash-jointpain-dengue-rule
   (-> (HasSymptom $d rash)
       (HasSymptom $d joint_pain)
       (HasSymptom $d Dengue)))

;; Rule10: Typhoid (fever, abdominal_pain, diarrhea)
!(add-atom &rb fever-abdominalpain-typhoid-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d abdominal_pain)
       (HasSymptom $d Typhoid)))

!(add-atom &rb fever-diarrhea-typhoid-rule
   (-> (HasSymptom $d fever)
       (HasSymptom $d diarrhea)
       (HasSymptom $d Typhoid)))

!(add-atom &rb abdominalpain-diarrhea-typhoid-rule
   (-> (HasSymptom $d abdominal_pain)
       (HasSymptom $d diarrhea)
       (HasSymptom $d Typhoid)))

;; Rule11: Tuberculosis (cough, weight_loss, night_sweats)
!(add-atom &rb cough-weightloss-tb-rule
   (-> (HasSymptom $d cough)
       (HasSymptom $d weight_loss)
       (HasSymptom $d Tuberculosis)))

!(add-atom &rb cough-nightsweats-tb-rule
   (-> (HasSymptom $d cough)
       (HasSymptom $d night_sweats)
       (HasSymptom $d Tuberculosis)))

!(add-atom &rb weightloss-nightsweats-tb-rule
   (-> (HasSymptom $d weight_loss)
       (HasSymptom $d night_sweats)
       (HasSymptom $d Tuberculosis)))
