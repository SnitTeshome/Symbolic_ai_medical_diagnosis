;; -----------------------------
;; main.metta queries
;; -----------------------------

;; Query 1: Pneumonia (symptoms: cough + fever)
!(bc &kb (toDepthLimit 4) $pf1 (HasSymptom Pneumonia cough))
!(bc &kb (toDepthLimit 4) $pf2 (HasSymptom Pneumonia high_fever))
(: inferred_pneumonia
   (pf-fever-cough-pneumonia-rule $pf1 $pf2))

;; Query 2: Typhoid (symptoms: vomiting + fever)
!(bc &kb (toDepthLimit 4) $pf3 (HasSymptom Typhoid vomiting))
!(bc &kb (toDepthLimit 4) $pf4 (HasSymptom Typhoid high_fever))
(: inferred_typhoid
   (pf-vomiting-fever-typhoid-rule $pf3 $pf4))

;; Query 3: Dengue (symptoms: rash + fever)
!(bc &kb (toDepthLimit 4) $pf5 (HasSymptom Dengue skin_rash))
!(bc &kb (toDepthLimit 4) $pf6 (HasSymptom Dengue high_fever))
(: inferred_dengue
   (pf-rash-fever-dengue-rule $pf5 $pf6))

;; Query 4: Tuberculosis (symptoms: cough + weight_loss)
!(bc &kb (toDepthLimit 4) $pf7 (HasSymptom Tuberculosis cough))
!(bc &kb (toDepthLimit 4) $pf8 (HasSymptom Tuberculosis weight_loss))
(: inferred_tb
   (pf-cough-weightloss-tb-rule $pf7 $pf8))

;; Query 5: Heart Attack (symptoms: chest_pain + shortness_of_breath)
!(bc &kb (toDepthLimit 4) $pf9 (HasSymptom Heart_attack chest_pain))
!(bc &kb (toDepthLimit 4) $pf10 (HasSymptom Heart_attack shortness_of_breath))
(: inferred_heart_attack
   (pf-chestpain-breath-heartattack-rule $pf9 $pf10))
