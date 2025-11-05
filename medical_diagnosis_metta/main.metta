;; -------------------------------------------------------
;; main.metta
;; Run backward chaining diagnosis and print proofs
;; -------------------------------------------------------

;; Load modules
!(load-file "types.metta")
!(print "types.metta loaded")

!(load-file "kb.metta")
!(print "kb.metta loaded")

!(load-file "rules.metta")
!(print "rules.metta loaded")

!(load-file "bc.metta")
!(print "bc.metta loaded")

;; -------------------------------
;; Pneumonia
;; -------------------------------
(!(bc &kb (toDepthLimit 4) $pf1 (HasSymptom Pneumonia fever)))
(!(bc &kb (toDepthLimit 4) $pf2 (HasSymptom Pneumonia cough)))

;; Combine inferred disease
(!(let ((inferred_pneumonia (pf-rule $pf1 $pf2)))
    (print "Pneumonia proofs:")
    (print $pf1)
    (print $pf2)
    (print inferred_pneumonia)))

;; -------------------------------
;; Typhoid
;; -------------------------------
(!(bc &kb (toDepthLimit 4) $pf3 (HasSymptom Typhoid vomiting)))
(!(bc &kb (toDepthLimit 4) $pf4 (HasSymptom Typhoid fever)))

(!(let ((inferred_typhoid (pf-rule $pf3 $pf4)))
    (print "Typhoid proofs:")
    (print $pf3)
    (print $pf4)
    (print inferred_typhoid)))

;; -------------------------------
;; Dengue
;; -------------------------------
(!(bc &kb (toDepthLimit 4) $pf5 (HasSymptom Dengue rash)))
(!(bc &kb (toDepthLimit 4) $pf6 (HasSymptom Dengue fever)))

(!(let ((inferred_dengue (pf-rule $pf5 $pf6)))
    (print "Dengue proofs:")
    (print $pf5)
    (print $pf6)
    (print inferred_dengue)))

;; -------------------------------
;; Tuberculosis
;; -------------------------------
(!(bc &kb (toDepthLimit 4) $pf7 (HasSymptom Tuberculosis cough)))
(!(bc &kb (toDepthLimit 4) $pf8 (HasSymptom Tuberculosis weight_loss)))

(!(let ((inferred_tb (pf-rule $pf7 $pf8)))
    (print "Tuberculosis proofs:")
    (print $pf7)
    (print $pf8)
    (print inferred_tb)))

;; -------------------------------
;; Heart Attack
;; -------------------------------
(!(bc &kb (toDepthLimit 4) $pf9 (HasSymptom Heart_attack chest_pain)))
(!(bc &kb (toDepthLimit 4) $pf10 (HasSymptom Heart_attack shortness_of_breath)))

(!(let ((inferred_heart_attack (pf-rule $pf9 $pf10)))
    (print "Heart Attack proofs:")
    (print $pf9)
    (print $pf10)
    (print inferred_heart_attack)))



