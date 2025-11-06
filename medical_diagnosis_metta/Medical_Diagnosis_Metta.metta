;; -------------------------------------------------------
;; medical_diagnosis_complete_runnable.metta
;; Backward chaining with HasSymptom and HasTreatment
;; Proper proof and conclusion variables
;; -------------------------------------------------------

;; -------------------------------
;; Basic types
;; -------------------------------
(:> Nat Type)
(:> Z Nat)
(:> S (-> Nat Nat))

(:> fromNumber (-> Number Nat))
(= (fromNumber $n)
   (if (<= $n 0) Z (S (fromNumber (- $n 1)))))


;; -------------------------------
;; Prop and Proof types
;; -------------------------------
(:> Prop Type)
(:> Proof (-> Prop Type))

(:> HasSymptom (-> Prop Prop Prop))   ;; patient has symptom
(:> HasTreatment (-> Prop Prop Prop)) ;; disease has treatment
(:> pf-axiom (-> Prop Proof))
(:> pf-chain (-> Proof Proof Proof))

;; -------------------------------
;; Knowledge Base (facts)
;; -------------------------------
!(bind! &kb (new-space))

;; Disease symptoms
!(add-atom &kb (HasSymptom Pneumonia fever))
!(add-atom &kb (HasSymptom Pneumonia cough))
!(add-atom &kb (HasSymptom Heart_attack chest_pain))
!(add-atom &kb (HasSymptom Heart_attack shortness_of_breath))
!(add-atom &kb (HasSymptom Drug_Reaction rash))
!(add-atom &kb (HasSymptom Drug_Reaction itching))
!(add-atom &kb (HasSymptom Hypertension headache))
!(add-atom &kb (HasSymptom Hypertension dizziness))

;; Treatments
!(add-atom &kb (HasTreatment Pneumonia Antibiotics))
!(add-atom &kb (HasTreatment Pneumonia Fluids))
!(add-atom &kb (HasTreatment Heart_attack Aspirin))
!(add-atom &kb (HasTreatment Heart_attack Nitroglycerin))
!(add-atom &kb (HasTreatment Drug_Reaction Antihistamines))
!(add-atom &kb (HasTreatment Hypertension Beta_blockers))

;; Patient symptoms
!(add-atom &kb (HasSymptom PatientX fever))
!(add-atom &kb (HasSymptom PatientX cough))
!(add-atom &kb (HasSymptom PatientX chest_pain))
!(add-atom &kb (HasSymptom PatientX shortness_of_breath))
!(add-atom &kb (HasSymptom PatientX rash))
!(add-atom &kb (HasSymptom PatientX itching))
!(add-atom &kb (HasSymptom PatientX headache))
!(add-atom &kb (HasSymptom PatientX dizziness))



;; -------------------------------
;; Rule Base - Binary premises
;; -------------------------------
!(bind! &rb (new-space))

;; Diagnosis rules: patient symptoms → disease
!(add-atom &rb
   (-> (HasSymptom $p fever)
       (HasSymptom $p cough)
       (HasSymptom $p Pneumonia)))

!(add-atom &rb
   (-> (HasSymptom $p chest_pain)
       (HasSymptom $p shortness_of_breath)
       (HasSymptom $p Heart_attack)))

!(add-atom &rb
   (-> (HasSymptom $p rash)
       (HasSymptom $p itching)
       (HasSymptom $p Drug_Reaction)))

!(add-atom &rb
   (-> (HasSymptom $p headache)
       (HasSymptom $p dizziness)
       (HasSymptom $p Hypertension)))

!(add-atom &rb
   (-> (HasSymptom $p $disease)
       (HasTreatment $disease $treatment)
       (HasTreatment $p $treatment)))

;; -------------------------------
;; Backward chaining functions
;; -------------------------------
;; Base case for KB
(= (bc-kb $q Z $proof $conclusion)
   (if (match &kb $q)
       (let ((pf (pf-axiom $q)))
         (bind $proof pf)
         (bind $conclusion $q)
         pf)
       nil))

;; Recursive backward chaining for diagnosis
(:> bc-diagnosis (-> Prop Nat Proof Prop))
(= (bc-diagnosis $query $depth $proof $conclusion)
   
   ;; 1. Base case: check if the query is directly in KB
   (or (bc-kb $query Z $proof $conclusion)
       
       ;; 2. Recursive case: try to use rules from &rb
       (match &rb (-> $prem1 $prem2 $rule_conclusion)
         (if (unify $rule_conclusion $query) ; does the rule conclude what we want?
             (let* ((pf1 (bc-diagnosis $prem1 $depth $p1 $c1))  ; try to prove first premise
                    (pf2 (bc-diagnosis $prem2 $depth $p2 $c2))) ; try to prove second premise
               (if (and pf1 pf2)                                 ; both premises must succeed
                   (let ((combined_pf (pf-chain $p1 $p2)))       ; combine proofs
                     (bind $proof combined_pf)                   ; store proof
                     (bind $conclusion $rule_conclusion)        ; store conclusion
                     combined_pf)))))))

;; Recursive backward chaining for treatment
(:> bc-treatment (-> Prop Nat Proof Prop))
(= (bc-treatment $query $depth $proof $conclusion)
   
   ;; 1. Base case: check if treatment fact exists in KB
   (or (bc-kb $query Z $proof $conclusion)
       
       ;; 2. Recursive case: use rule base
       (match &rb (-> $prem1 $prem2 $rule_conclusion)
         (if (unify $rule_conclusion $query) ; does the rule conclude the treatment we want?
             (let* ((pf1 (bc-diagnosis $prem1 $depth $p1 $c1))  ; first, prove diagnosis
                    (pf2 (bc-kb $prem2 $depth $p2 $c2)))         ; second, check treatment in KB
               (if (and pf1 pf2)                                 ; both must succeed
                   (let ((combined_pf (pf-chain $p1 $p2)))       ; combine proofs
                     (bind $proof combined_pf)                   ; store proof
                     (bind $conclusion $rule_conclusion)        ; store conclusion
                     combined_pf)))))))

;; -------------------------------
;; Queries - simplified to two
;; -------------------------------

!(bind! prf_pneumonia
   (bc-diagnosis (HasSymptom PatientX Pneumonia) (fromNumber 4) $prf_pneumonia $ccln_pneumonia))
(print "Pneumonia proof:" $prf_pneumonia)
(print "Pneumonia conclusion:" $ccln_pneumonia))

!(bind! prf_antibiotics
   (bc-treatment (HasTreatment PatientX Antibiotics) (fromNumber 4) $prf_antibiotics $ccln_antibiotics))
(print "Antibiotics proof:" $prf_antibiotics)
(print "Antibiotics conclusion:" $ccln_antibiotics))
