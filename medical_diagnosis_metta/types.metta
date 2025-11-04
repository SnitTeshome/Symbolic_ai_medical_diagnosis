;; -------------------------------------------------------
;; types.metta
;; Basic types and proof constructors for medical diagnosis
;; Using Z/S-style depth for backward chaining
;; -------------------------------------------------------

;; Core types
(:> Symbol Type)        ;; disease names
(:> Atom   Type)        ;; symptoms or treatments 
(:> Prop   Type)        ;; logical propositions
(:> Proof  (-> Prop Type)) ;; Proof object 

;; Depth-limited reasoning (Z/S-style)
(:> BaseCase DepthLimit)               ;; depth = 0, no further reasoning allowed
(:> Next (-> DepthLimit DepthLimit))   ;; increment depth

;; Convert built-in Number to DepthLimit type
(:> toDepthLimit (-> Number DepthLimit))
(= (toDepthLimit $n)
   (if (<= $n 0)
       BaseCase
       (Next (toDepthLimit (- $n 1)))))

;; Predicates for medical diagnosis
(:> HasSymptom (-> Symbol Atom Prop))     ;; is symptom true for disease?
(:> HasTreatment (-> Symbol Atom Prop))   ;; does disease have treatment?

;; Proof constructor for axiomatic facts
(:> pf-axiom (-> Prop Proof))             ;; atomic proof from known fact